package io.github.tsutsu3.pi_hole_client.widget

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import io.github.tsutsu3.pi_hole_client.R
import org.json.JSONObject
import java.text.NumberFormat
import java.text.SimpleDateFormat
import java.util.Date
import java.util.Locale

/**
 * WorkManager worker that fetches widget data and updates RemoteViews.
 *
 * All auth and SID issuance are owned by Flutter. The worker only consumes
 * cached SID values and never initiates authentication flows.
 */
class PiHoleWidgetWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {
    /**
     * Entry point for widget refresh and action handling.
     *
     * When no widget id is provided, it refreshes all instances to recover
     * from broad refresh events.
     */
    override suspend fun doWork(): Result {
        val widgetId = inputData.getInt(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID,
        )
        if (widgetId == AppWidgetManager.INVALID_APPWIDGET_ID) {
            // WorkManager may run without a specific widget id; refresh all.
            val manager = AppWidgetManager.getInstance(applicationContext)
            val widgetIds = manager.getAppWidgetIds(
                ComponentName(applicationContext, PiHoleWidgetProvider::class.java),
            )
            widgetIds.forEach { refreshWidget(it) }
            return Result.success()
        }

        refreshWidget(widgetId)
        return Result.success()
    }

    /**
     * Loads cached server info and dispatches v5/v6 handlers.
     */
    private fun refreshWidget(widgetId: Int) {
        val prefs = WidgetPrefs(applicationContext)
        val serverId = prefs.getServerForWidget(widgetId)
        if (serverId.isNullOrEmpty()) {
            // Widget must stay stable even when no server is configured.
            updateState(
                widgetId,
                placeholderState(
                    serverId = "",
                    serverName = applicationContext.getString(R.string.widget_unknown_server),
                    status = WidgetStatus.ERROR,
                    actionsEnabled = false,
                ),
            )
            return
        }

        val server = prefs.getServerInfo(serverId)
        if (server == null) {
            // Cached server metadata may be missing if Flutter cleared it.
            updateState(
                widgetId,
                placeholderState(
                    serverId = serverId,
                    serverName = applicationContext.getString(R.string.widget_unknown_server),
                    status = WidgetStatus.ERROR,
                    actionsEnabled = false,
                ),
            )
            return
        }

        val action = inputData.getString(WidgetConstants.EXTRA_ACTION)
            ?: WidgetConstants.ACTION_REFRESH

        val client = PiHoleApiClient(server.allowSelfSignedCert)
        if (server.apiVersion == "v5") {
            // Legacy API does not support SID-based auth.
            handleV5(
                client = client,
                serverId = serverId,
                serverName = server.alias,
                serverAddress = server.address,
                widgetId = widgetId,
                action = action,
            )
            return
        }

        handleV6(
            client = client,
            prefs = prefs,
            serverId = serverId,
            serverName = server.alias,
            serverAddress = server.address,
            widgetId = widgetId,
            action = action,
        )
    }

    private fun handleV6(
        client: PiHoleApiClient,
        prefs: WidgetPrefs,
        serverId: String,
        serverName: String,
        serverAddress: String,
        widgetId: Int,
        action: String,
    ) {
        val sid = prefs.getSid(serverId)
        val sidValid = prefs.isSidValid(serverId)
        if (!sidValid || sid.isNullOrEmpty()) {
            // IMPORTANT: widgets must not re-authenticate; Flutter owns SID lifecycle.
            updateState(
                widgetId,
                placeholderState(
                    serverId = serverId,
                    serverName = serverName,
                    status = WidgetStatus.AUTH_REQUIRED,
                    actionsEnabled = false,
                ),
            )
            return
        }

        val paddResponse = client.get("$serverAddress/api/padd", sid)

        if (isAuthFailure(paddResponse.statusCode, paddResponse.body)) {
            // Mark SID invalid so Flutter can refresh on next app open.
            prefs.setSidValid(serverId, false)
            updateState(
                widgetId,
                placeholderState(
                    serverId = serverId,
                    serverName = serverName,
                    status = WidgetStatus.AUTH_REQUIRED,
                    actionsEnabled = false,
                ),
            )
            return
        }

        if (paddResponse.statusCode !in 200..299) {
            // Avoid retries here; worker will run again on next schedule.
            updateState(
                widgetId,
                placeholderState(
                    serverId = serverId,
                    serverName = serverName,
                    status = WidgetStatus.ERROR,
                    actionsEnabled = false,
                ),
            )
            return
        }

        val paddJson = JSONObject(paddResponse.body)
        var currentBlocking = paddJson.optString("blocking")
        if (action == WidgetConstants.ACTION_TOGGLE) {
            val nextBlocking = currentBlocking == "disabled"
            val body = JSONObject()
            body.put("blocking", nextBlocking)
            body.put("timer", JSONObject.NULL)
            val toggleResponse = client.post(
                "$serverAddress/api/dns/blocking",
                sid,
                body.toString(),
            )
            if (isAuthFailure(toggleResponse.statusCode, toggleResponse.body)) {
                // Widget cannot recover from auth errors; surface auth required.
                prefs.setSidValid(serverId, false)
                updateState(
                    widgetId,
                    placeholderState(
                        serverId = serverId,
                        serverName = serverName,
                        status = WidgetStatus.AUTH_REQUIRED,
                        actionsEnabled = false,
                    ),
                )
                return
            }
            if (toggleResponse.statusCode in 200..299) {
                currentBlocking = if (nextBlocking) "enabled" else "disabled"
            }
        }

        val numberFormat = NumberFormat.getIntegerInstance()
        val queries = paddJson.optJSONObject("queries")
        val total = if (queries?.has("total") == true) {
            numberFormat.format(queries.optLong("total"))
        } else {
            "--"
        }
        val blocked = if (queries?.has("blocked") == true) {
            numberFormat.format(queries.optLong("blocked"))
        } else {
            "--"
        }
        val percent = if (queries?.has("percent_blocked") == true) {
            queries.optDouble("percent_blocked")
        } else {
            null
        }
        val domainsOnAdlists = if (paddJson.has("gravity_size")) {
            numberFormat.format(paddJson.optLong("gravity_size"))
        } else {
            "--"
        }
        val percentText = if (percent != null) {
            String.format(Locale.getDefault(), "%.1f%%", percent)
        } else {
            "--"
        }

        val system = paddJson.optJSONObject("system")
        val uptime = if (system?.has("uptime") == true) {
            formatUptime(system.optLong("uptime"))
        } else {
            "--"
        }
        val cpuUsage = system?.optJSONObject("cpu")
        val cpuUsageText = if (cpuUsage?.has("%cpu") == true) {
            String.format(Locale.getDefault(), "%.1f%%", cpuUsage.optDouble("%cpu"))
        } else {
            "--"
        }
        val memUsage = system?.optJSONObject("memory")?.optJSONObject("ram")
        val memUsageText = if (memUsage?.has("%used") == true) {
            String.format(Locale.getDefault(), "%.1f%%", memUsage.optDouble("%used"))
        } else {
            "--"
        }
        val sensors = paddJson.optJSONObject("sensors")
        val tempUnit = sensors?.optString("unit").orEmpty()
        val tempText = if (sensors?.has("cpu_temp") == true) {
            val temp = sensors.optDouble("cpu_temp")
            String.format(Locale.getDefault(), "%.1f°%s", temp, tempUnit)
        } else {
            "--"
        }

        val status = when (currentBlocking) {
            "enabled" -> WidgetStatus.BLOCKING_ON
            "disabled" -> WidgetStatus.BLOCKING_OFF
            else -> WidgetStatus.ERROR
        }

        updateState(
            widgetId,
            WidgetState(
                serverId = serverId,
                serverName = serverName,
                status = status,
                totalQueries = total,
                blockedQueries = blocked,
                percentBlocked = percentText,
                domainsOnAdlists = domainsOnAdlists,
                uptime = uptime,
                cpuTemp = tempText,
                cpuUsage = cpuUsageText,
                memUsage = memUsageText,
                updatedAt = nowString(),
                actionsEnabled = true,
            ),
        )
    }

    private fun handleV5(
        client: PiHoleApiClient,
        serverId: String,
        serverName: String,
        serverAddress: String,
        widgetId: Int,
        action: String,
    ) {
        // v5 is not selectable in config; keep a safe fallback without API calls.
        updateState(
            widgetId,
            placeholderState(
                serverId = serverId,
                serverName = serverName,
                status = WidgetStatus.ERROR,
                actionsEnabled = false,
            ),
        )
    }

    private fun updateState(widgetId: Int, state: WidgetState) {
        WidgetRenderer(applicationContext).update(widgetId, state)
    }

    /**
     * Builds a minimal placeholder state for error/auth/missing data cases.
     */
    private fun placeholderState(
        serverId: String,
        serverName: String,
        status: WidgetStatus,
        actionsEnabled: Boolean,
    ): WidgetState {
        return WidgetState(
            serverId = serverId,
            serverName = serverName,
            status = status,
            totalQueries = "--",
            blockedQueries = "--",
            percentBlocked = "--",
            domainsOnAdlists = "--",
            uptime = "--",
            cpuTemp = "--",
            cpuUsage = "--",
            memUsage = "--",
            updatedAt = nowString(),
            actionsEnabled = actionsEnabled,
        )
    }

    /**
     * Formats a timestamp for display in widget text.
     */
    private fun nowString(): String {
        val formatter = SimpleDateFormat("yyyy-MM-dd HH:mm:ss", Locale.US)
        return formatter.format(Date())
    }

    /**
     * Formats uptime into a compact display string.
     */
    private fun formatUptime(seconds: Long): String {
        if (seconds <= 0) return "--"
        val days = seconds / 86400
        val hours = (seconds % 86400) / 3600
        val minutes = (seconds % 3600) / 60
        return when {
            days > 0 -> "${days}d"
            hours > 0 -> "${hours}h"
            minutes > 0 -> "${minutes}m"
            else -> "${seconds}s"
        }
    }

    /**
     * Detects auth failures from either status code or body content.
     */
    private fun isAuthFailure(statusCode: Int, body: String): Boolean {
        if (statusCode == 401 || statusCode == 403) return true
        return body.contains("unauthorized", ignoreCase = true) ||
            body.contains("forbidden", ignoreCase = true)
    }
}

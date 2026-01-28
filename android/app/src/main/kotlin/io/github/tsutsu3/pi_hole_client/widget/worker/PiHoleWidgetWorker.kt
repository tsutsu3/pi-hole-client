package io.github.tsutsu3.pi_hole_client.widget.worker

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.util.Log
import androidx.glance.appwidget.GlanceAppWidgetManager
import androidx.glance.appwidget.state.updateAppWidgetState
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import io.github.tsutsu3.pi_hole_client.R
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.common.PiHoleApiClient
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.parseBlockingStatus
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.data.updateFrom
import io.github.tsutsu3.pi_hole_client.widget.ui.stats.PiHoleWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.stats.PiHoleGlanceWidget
import io.github.tsutsu3.pi_hole_client.widget.ui.compact.CompactWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.compact.CompactGlanceWidget
import org.json.JSONObject
import java.text.NumberFormat
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.Locale

/**
 * WorkManager worker that fetches widget data and updates Glance state.
 *
 * Serves both the full stats widget ([PiHoleWidgetProvider]) and the compact
 * widget ([CompactWidgetProvider]). The correct Glance widget type is resolved
 * in [updateState] based on the widget id.
 *
 * All auth and SID issuance are owned by Flutter. The worker only consumes
 * cached SID values and never initiates authentication flows.
 */
class PiHoleWidgetWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    companion object {
        private const val TAG = "PiHoleWidgetWorker"
    }

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
            val statsIds = manager.getAppWidgetIds(
                ComponentName(applicationContext, PiHoleWidgetProvider::class.java),
            )
            for (id in statsIds) {
                refreshWidget(id)
            }
            val compactIds = manager.getAppWidgetIds(
                ComponentName(applicationContext, CompactWidgetProvider::class.java),
            )
            for (id in compactIds) {
                refreshWidget(id)
            }
            return Result.success()
        }

        refreshWidget(widgetId)
        return Result.success()
    }

    /**
     * Loads cached server info and fetches fresh data from the Pi-hole API.
     */
    private suspend fun refreshWidget(widgetId: Int) {
        val prefs = WidgetPrefs.getInstance(applicationContext)
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

        // Only v6 servers can be selected in widget config (PiHoleWidgetConfigureActivity),
        // but stale metadata could contain a v5 entry. Guard against it defensively.
        if (server.apiVersion != "v6") {
            Log.w(TAG, "Unsupported API version: ${server.apiVersion} for server $serverId")
            updateState(
                widgetId,
                placeholderState(
                    serverId = serverId,
                    serverName = server.alias,
                    status = WidgetStatus.ERROR,
                    actionsEnabled = false,
                ),
            )
            return
        }

        val action = inputData.getString(WidgetConstants.EXTRA_ACTION)
            ?: WidgetConstants.ACTION_REFRESH

        val client = PiHoleApiClient(
            allowSelfSigned = server.allowSelfSignedCert,
            ignoreCertificateErrors = server.ignoreCertificateErrors,
            pinnedCertificateSha256 = server.pinnedCertificateSha256,
        )
        if (!client.canConnect(server.address)) {
            // Self-signed cert enabled without a pinned fingerprint.
            // The widget refuses to trust arbitrary certificates; the user
            // must open the app and pin the server's certificate.
            Log.w(TAG, "Certificate pin required for server $serverId (${server.address})")
            updateState(
                widgetId,
                placeholderState(
                    serverId = serverId,
                    serverName = server.alias,
                    status = WidgetStatus.ERROR,
                    actionsEnabled = false,
                ),
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

    /**
     * Handles refresh and toggle actions for a Pi-hole v6 server.
     *
     * Fetches `/api/padd` for full stats, optionally toggles blocking via
     * `/api/dns/blocking`, and pushes the resulting [WidgetState] into Glance.
     */
    private suspend fun handleV6(
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
            // Widgets cannot re-authenticate; Flutter owns the SID lifecycle.
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

        if (PiHoleApiClient.isAuthFailure(paddResponse.statusCode, paddResponse.body)) {
            // Mark SID invalid so Flutter can refresh on next app open.
            Log.w(TAG, "Auth failure for server $serverId: ${paddResponse.statusCode}")
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
            Log.w(TAG, "API request failed for server $serverId: status=${paddResponse.statusCode}, body=${paddResponse.body}")
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

        try {
            val paddJson = JSONObject(paddResponse.body)
            var currentBlocking = paddJson.optString("blocking")
            if (action == WidgetConstants.ACTION_TOGGLE) {
                // Toggle direction: enable when not currently enabled (covers
                // "disabled", "failure", and any unknown value).
                val nextBlocking = currentBlocking != "enabled"
                val body = JSONObject()
                body.put("blocking", nextBlocking)
                body.put("timer", JSONObject.NULL)
                val toggleResponse = client.post(
                    "$serverAddress/api/dns/blocking",
                    sid,
                    body.toString(),
                )
                if (PiHoleApiClient.isAuthFailure(toggleResponse.statusCode, toggleResponse.body)) {
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
                    // Refresh all other widgets bound to this server (exclude current widget to avoid redundant API call).
                    WidgetUpdateHelper.refreshWidgetsForServer(applicationContext, serverId, excludeWidgetId = widgetId)
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

            val status = parseBlockingStatus(currentBlocking)

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
        } catch (e: org.json.JSONException) {
            Log.w(TAG, "Invalid JSON response for server $serverId: ${e.message}, body=${paddResponse.body}")
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
    }

    /**
     * Persists the view-state into Glance preferences and triggers a UI re-render.
     *
     * Resolves whether the widget id belongs to a compact or full-stats layout
     * and updates the correct [GlanceAppWidget] accordingly.
     */
    private suspend fun updateState(widgetId: Int, state: WidgetState) {
        // Widget may be removed between work enqueue and execution; guard with runCatching
        // because getGlanceIdBy() throws if the widget no longer exists.
        val glanceId = runCatching {
            GlanceAppWidgetManager(applicationContext).getGlanceIdBy(widgetId)
        }.getOrNull() ?: return

        updateAppWidgetState(applicationContext, glanceId) { prefs ->
            prefs.updateFrom(state)
        }

        // Trigger a render with the correct widget type for this id.
        val manager = AppWidgetManager.getInstance(applicationContext)
        val compactIds = manager.getAppWidgetIds(
            ComponentName(applicationContext, CompactWidgetProvider::class.java),
        )
        if (widgetId in compactIds) {
            CompactGlanceWidget().update(applicationContext, glanceId)
        } else {
            PiHoleGlanceWidget().update(applicationContext, glanceId)
        }
    }

    /**
     * Builds a minimal placeholder state for error/auth/missing data cases.
     */
    internal fun placeholderState(
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
     *
     * Uses java.time API which is thread-safe, unlike SimpleDateFormat.
     */
    private fun nowString(): String {
        val formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")
        return LocalDateTime.now().format(formatter)
    }

    /**
     * Formats uptime into a compact display string.
     *
     * Shows only the largest time unit to keep widget text concise.
     */
    internal fun formatUptime(seconds: Long): String {
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
}

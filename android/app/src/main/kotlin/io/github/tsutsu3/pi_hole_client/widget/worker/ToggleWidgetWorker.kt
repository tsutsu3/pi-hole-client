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
import io.github.tsutsu3.pi_hole_client.widget.WidgetDebugConfig
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.common.PiHoleApiClient
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.ToggleWidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.parseBlockingStatus
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetServer
import io.github.tsutsu3.pi_hole_client.widget.data.updateFromToggle
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleGlanceWidget
import org.json.JSONObject

/**
 * WorkManager worker for the 1x1 toggle widget.
 *
 * Uses the lightweight `GET /api/dns/blocking` endpoint instead of the heavier
 * `/api/padd` used by the stats widget, since only blocking status is needed.
 */
class ToggleWidgetWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    companion object {
        private const val TAG = "ToggleWidgetWorker"
    }

    /**
     * Entry point for toggle widget refresh and action handling.
     *
     * When no widget id is provided, it refreshes all toggle instances
     * to recover from broad refresh events (e.g. device reboot).
     */
    override suspend fun doWork(): Result {
        val widgetId = inputData.getInt(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID,
        )
        if (widgetId == AppWidgetManager.INVALID_APPWIDGET_ID) {
            // Periodic run: refresh all toggle widget instances.
            val manager = AppWidgetManager.getInstance(applicationContext)
            val widgetIds = manager.getAppWidgetIds(
                ComponentName(applicationContext, ToggleWidgetProvider::class.java),
            )
            for (id in widgetIds) {
                refreshWidget(id)
            }
            return Result.success()
        }

        refreshWidget(widgetId)
        return Result.success()
    }

    /**
     * Loads cached server info and dispatches to refresh or toggle handler.
     */
    private suspend fun refreshWidget(widgetId: Int) {
        val prefs = WidgetPrefs.getInstance(applicationContext)
        val serverId = prefs.getServerForWidget(widgetId)
        if (serverId.isNullOrEmpty()) {
            updateState(
                widgetId,
                errorState("", applicationContext.getString(R.string.widget_unknown_server)),
            )
            return
        }

        val server = prefs.getServerInfo(serverId)
        if (server == null) {
            updateState(
                widgetId,
                errorState(serverId, applicationContext.getString(R.string.widget_unknown_server)),
            )
            return
        }

        // Only v6 servers can be selected in widget config (PiHoleWidgetConfigureActivity),
        // but stale metadata could contain a v5 entry. Guard against it defensively.
        if (server.apiVersion != "v6") {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Unsupported API version: ${server.apiVersion}")
            }
            updateState(widgetId, errorState(serverId, server.alias))
            return
        }

        val sid = prefs.getSid(serverId)
        val sidValid = prefs.isSidValid(serverId)
        if (!sidValid || sid.isNullOrEmpty()) {
            // Disable actions because the widget cannot re-authenticate;
            // Flutter owns the SID lifecycle and must provide a fresh token.
            updateState(
                widgetId,
                ToggleWidgetState(
                    serverId = serverId,
                    serverName = server.alias,
                    status = WidgetStatus.AUTH_REQUIRED,
                    actionsEnabled = false,
                ),
            )
            return
        }

        val client = PiHoleApiClient(
            allowSelfSigned = server.allowSelfSignedCert,
            ignoreCertificateErrors = server.ignoreCertificateErrors,
            pinnedCertificateSha256 = server.pinnedCertificateSha256,
        )
        if (!client.canConnect(server.address)) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Certificate pin required for widget")
            }
            updateState(widgetId, errorState(serverId, server.alias))
            return
        }
        val action = inputData.getString(WidgetConstants.EXTRA_ACTION)
            ?: WidgetConstants.ACTION_REFRESH

        if (action == WidgetConstants.ACTION_TOGGLE) {
            handleToggle(client, prefs, serverId, server, sid, widgetId)
        } else {
            handleRefresh(client, prefs, serverId, server, sid, widgetId)
        }
    }

    /**
     * Fetches current blocking status and displays it.
     */
    private suspend fun handleRefresh(
        client: PiHoleApiClient,
        prefs: WidgetPrefs,
        serverId: String,
        server: WidgetServer,
        sid: String,
        widgetId: Int,
    ) {
        val resp = client.get("${server.address}/api/dns/blocking", sid)

        if (PiHoleApiClient.isAuthFailure(resp.statusCode)) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Auth failure: ${resp.statusCode}")
            }
            prefs.setSidValid(serverId, false)
            updateState(
                widgetId,
                ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false),
            )
            return
        }

        if (resp.statusCode !in 200..299) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "API request failed: status=${resp.statusCode}")
            }
            updateState(widgetId, errorState(serverId, server.alias))
            return
        }

        try {
            val blocking = JSONObject(resp.body).optString("blocking")
            updateState(
                widgetId,
                ToggleWidgetState(
                    serverId = serverId,
                    serverName = server.alias,
                    status = parseBlockingStatus(blocking),
                    actionsEnabled = true,
                ),
            )
        } catch (e: org.json.JSONException) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Invalid JSON response: ${e.message}")
            }
            updateState(widgetId, errorState(serverId, server.alias))
        }
    }

    /**
     * Reads current status, toggles it, and updates the widget.
     */
    private suspend fun handleToggle(
        client: PiHoleApiClient,
        prefs: WidgetPrefs,
        serverId: String,
        server: WidgetServer,
        sid: String,
        widgetId: Int,
    ) {
        // Get current status first.
        val statusResp = client.get("${server.address}/api/dns/blocking", sid)

        if (PiHoleApiClient.isAuthFailure(statusResp.statusCode)) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Auth failure: ${statusResp.statusCode}")
            }
            prefs.setSidValid(serverId, false)
            updateState(
                widgetId,
                ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false),
            )
            return
        }
        if (statusResp.statusCode !in 200..299) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Get status failed: status=${statusResp.statusCode}")
            }
            updateState(widgetId, errorState(serverId, server.alias))
            return
        }

        try {
            val currentBlocking = JSONObject(statusResp.body).optString("blocking")
            // Toggle direction: enable when not currently enabled (covers
            // "disabled", "failure", and any unknown value).
            val nextBlocking = currentBlocking != "enabled"

            val body = JSONObject()
            body.put("blocking", nextBlocking)
            body.put("timer", JSONObject.NULL)

            val toggleResp = client.post(
                "${server.address}/api/dns/blocking",
                sid,
                body.toString(),
            )

            if (PiHoleApiClient.isAuthFailure(toggleResp.statusCode)) {
                if (WidgetDebugConfig.DEBUG) {
                    Log.w(TAG, "Auth failure in toggle: ${toggleResp.statusCode}")
                }
                prefs.setSidValid(serverId, false)
                updateState(
                    widgetId,
                    ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false),
                )
                return
            }

            val finalStatus = if (toggleResp.statusCode in 200..299) {
                if (nextBlocking) WidgetStatus.BLOCKING_ON else WidgetStatus.BLOCKING_OFF
            } else {
                if (WidgetDebugConfig.DEBUG) {
                    Log.w(TAG, "Toggle POST failed: status=${toggleResp.statusCode}")
                }
                parseBlockingStatus(currentBlocking)
            }

            updateState(
                widgetId,
                ToggleWidgetState(
                    serverId = serverId,
                    serverName = server.alias,
                    status = finalStatus,
                    actionsEnabled = true,
                ),
            )

            // Refresh all other widgets bound to this server (exclude current widget to avoid redundant API call).
            if (toggleResp.statusCode in 200..299) {
                WidgetUpdateHelper.refreshWidgetsForServer(applicationContext, serverId, excludeWidgetId = widgetId)
            }
        } catch (e: org.json.JSONException) {
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Invalid JSON response: ${e.message}")
            }
            updateState(widgetId, errorState(serverId, server.alias))
        }
    }

    /**
     * Persists the toggle view-state into Glance preferences and triggers a UI re-render.
     */
    private suspend fun updateState(widgetId: Int, state: ToggleWidgetState) {
        // Widget may be removed between work enqueue and execution; guard with runCatching
        // because getGlanceIdBy() throws if the widget no longer exists.
        val glanceId = runCatching {
            GlanceAppWidgetManager(applicationContext).getGlanceIdBy(widgetId)
        }.getOrNull() ?: return

        updateAppWidgetState(applicationContext, glanceId) { prefs ->
            prefs.updateFromToggle(state)
        }
        ToggleGlanceWidget().update(applicationContext, glanceId)
    }

    /** Builds a minimal error state with actions disabled. */
    private fun errorState(serverId: String, serverName: String) = ToggleWidgetState(
        serverId = serverId,
        serverName = serverName,
        status = WidgetStatus.ERROR,
        actionsEnabled = false,
    )
}

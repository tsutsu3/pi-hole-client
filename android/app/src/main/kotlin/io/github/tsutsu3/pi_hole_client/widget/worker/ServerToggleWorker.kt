package io.github.tsutsu3.pi_hole_client.widget.worker

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.util.Log
import androidx.glance.appwidget.GlanceAppWidgetManager
import androidx.glance.appwidget.state.updateAppWidgetState
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetDebugConfig
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.common.PiHoleApiClient
import io.github.tsutsu3.pi_hole_client.widget.common.ToggleWidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.parseBlockingStatus
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.data.updateFromToggle
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleGlanceWidget
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleWidgetProvider
import kotlinx.coroutines.delay
import org.json.JSONObject

/**
 * Per-server worker that toggles Pi-hole blocking for [serverId] and updates all
 * Toggle widget instances bound to that server.
 *
 * After a successful toggle it also enqueues [ServerPaddWorker] so the Stats and
 * Compact widgets reflect the new blocking state without an additional user action.
 *
 * Uses [ExistingWorkPolicy.KEEP] so a rapid double-tap cannot cancel an in-flight
 * toggle and leave Pi-hole in an inconsistent state.
 */
class ServerToggleWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    companion object {
        private const val TAG = "ServerToggleWorker"
    }

    override suspend fun doWork(): Result {
        val serverId = inputData.getString(WidgetConstants.EXTRA_SERVER_ID)
            ?: return Result.failure()

        val prefs = WidgetPrefs.getInstance(applicationContext)
        val server = prefs.getServerInfo(serverId)
        if (server == null) {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "No server info for $serverId")
            return Result.success()
        }

        if (server.apiVersion != "v6") {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Unsupported API version: ${server.apiVersion}")
            broadcast(serverId, prefs, errorState(serverId, server.alias))
            return Result.success()
        }

        val sid = prefs.getSid(serverId)
        if (!prefs.isSidValid(serverId) || sid.isNullOrEmpty()) {
            broadcast(serverId, prefs, ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false))
            return Result.success()
        }

        val client = PiHoleApiClient(
            allowUntrustedCert = server.allowUntrustedCert,
            ignoreCertificateErrors = server.ignoreCertificateErrors,
            pinnedCertificateSha256 = server.pinnedCertificateSha256,
        )
        if (!client.canConnect(server.address)) {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Certificate pin required for widget")
            broadcast(serverId, prefs, errorState(serverId, server.alias))
            return Result.success()
        }

        // Read current status before toggling.
        var statusResp = client.get("${server.address}/api/dns/blocking", sid)
        if (statusResp.isConnectionError) {
            delay(200)
            statusResp = client.get("${server.address}/api/dns/blocking", sid)
        }
        if (statusResp.isConnectionError) {
            delay(400)
            statusResp = client.get("${server.address}/api/dns/blocking", sid)
        }

        if (PiHoleApiClient.isAuthFailure(statusResp.statusCode)) {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Auth failure: ${statusResp.statusCode}")
            prefs.setSidValid(serverId, false)
            broadcast(serverId, prefs, ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false))
            return Result.success()
        }
        if (statusResp.statusCode !in 200..299) {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Get status failed: status=${statusResp.statusCode}")
            broadcast(serverId, prefs, errorState(serverId, server.alias))
            return Result.success()
        }

        try {
            val currentBlocking = JSONObject(statusResp.body).optString("blocking")
            val nextBlocking = currentBlocking != "enabled"

            val body = JSONObject()
            body.put("blocking", nextBlocking)
            body.put("timer", JSONObject.NULL)
            val toggleResp = client.post("${server.address}/api/dns/blocking", sid, body.toString())

            if (PiHoleApiClient.isAuthFailure(toggleResp.statusCode)) {
                if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Auth failure in toggle: ${toggleResp.statusCode}")
                prefs.setSidValid(serverId, false)
                broadcast(serverId, prefs, ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false))
                return Result.success()
            }

            val finalStatus = if (toggleResp.statusCode in 200..299) {
                if (nextBlocking) WidgetStatus.BLOCKING_ON else WidgetStatus.BLOCKING_OFF
            } else {
                if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Toggle POST failed: status=${toggleResp.statusCode}")
                parseBlockingStatus(currentBlocking)
            }

            broadcast(serverId, prefs, ToggleWidgetState(serverId, server.alias, finalStatus, true))

            // Trigger Stats + Compact refresh so they reflect the new blocking state.
            if (toggleResp.statusCode in 200..299) {
                WidgetUpdateHelper.enqueueServerPadd(applicationContext, serverId)
            }
        } catch (e: org.json.JSONException) {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Invalid JSON response: ${e.message}")
            broadcast(serverId, prefs, errorState(serverId, server.alias))
        }

        return Result.success()
    }

    private suspend fun broadcast(serverId: String, prefs: WidgetPrefs, state: ToggleWidgetState) {
        val manager = AppWidgetManager.getInstance(applicationContext)
        val toggleIds = prefs.getWidgetIdsForServer(
            manager.getAppWidgetIds(ComponentName(applicationContext, ToggleWidgetProvider::class.java)),
            serverId,
        )
        for (widgetId in toggleIds) {
            val glanceId = runCatching {
                GlanceAppWidgetManager(applicationContext).getGlanceIdBy(widgetId)
            }.getOrNull() ?: continue
            updateAppWidgetState(applicationContext, glanceId) { it.updateFromToggle(state) }
            ToggleGlanceWidget().update(applicationContext, glanceId)
        }
    }

    private fun errorState(serverId: String, serverName: String) =
        ToggleWidgetState(serverId, serverName, WidgetStatus.ERROR, false)
}

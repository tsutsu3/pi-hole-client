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
import io.github.tsutsu3.pi_hole_client.widget.common.PiHoleApiClient
import io.github.tsutsu3.pi_hole_client.widget.common.ToggleWidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.parseBlockingStatus
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.data.updateFromToggle
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleGlanceWidget
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleWidgetProvider
import org.json.JSONException
import org.json.JSONObject

/**
 * Per-server worker that reads `/api/dns/blocking` once and updates all Toggle widget
 * instances bound to [serverId].
 *
 * Replaces the old per-widget [ToggleWidgetWorker] refresh path. A single API call
 * serves every Toggle widget regardless of how many instances share the same server.
 */
class ServerBlockingStatusWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    companion object {
        private const val TAG = "ServerBlockingStatusWorker"
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

        val resp = client.getWithRetry("${server.address}/api/dns/blocking", sid)

        val state = when {
            PiHoleApiClient.isAuthFailure(resp.statusCode) -> {
                if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Auth failure: ${resp.statusCode}")
                prefs.setSidValid(serverId, false)
                ToggleWidgetState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false)
            }
            resp.statusCode !in 200..299 -> {
                if (WidgetDebugConfig.DEBUG) Log.w(TAG, "API request failed: status=${resp.statusCode}")
                errorState(serverId, server.alias)
            }
            else -> {
                try {
                    val blocking = JSONObject(resp.body).optString("blocking")
                    ToggleWidgetState(serverId, server.alias, parseBlockingStatus(blocking), true)
                } catch (e: JSONException) {
                    if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Invalid JSON response: ${e.message}")
                    errorState(serverId, server.alias)
                }
            }
        }

        broadcast(serverId, prefs, state)
        return Result.success()
    }

    private suspend fun broadcast(serverId: String, prefs: WidgetPrefs, state: ToggleWidgetState) {
        val manager = AppWidgetManager.getInstance(applicationContext)
        val glanceManager = GlanceAppWidgetManager(applicationContext)
        val toggleIds = prefs.getWidgetIdsForServer(
            manager.getAppWidgetIds(ComponentName(applicationContext, ToggleWidgetProvider::class.java)),
            serverId,
        )
        for (widgetId in toggleIds) {
            val glanceId = runCatching { glanceManager.getGlanceIdBy(widgetId) }.getOrNull() ?: continue
            updateAppWidgetState(applicationContext, glanceId) { it.updateFromToggle(state) }
            ToggleGlanceWidget().update(applicationContext, glanceId)
        }
    }

    private fun errorState(serverId: String, serverName: String) =
        ToggleWidgetState(serverId, serverName, WidgetStatus.ERROR, false)
}

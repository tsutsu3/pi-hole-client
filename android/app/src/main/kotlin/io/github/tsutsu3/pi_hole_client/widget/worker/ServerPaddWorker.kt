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
import io.github.tsutsu3.pi_hole_client.widget.common.PaddResponseParser
import io.github.tsutsu3.pi_hole_client.widget.common.PiHoleApiClient
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.data.updateFrom
import io.github.tsutsu3.pi_hole_client.widget.ui.compact.CompactGlanceWidget
import io.github.tsutsu3.pi_hole_client.widget.ui.compact.CompactWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.stats.PiHoleGlanceWidget
import io.github.tsutsu3.pi_hole_client.widget.ui.stats.PiHoleWidgetProvider
import org.json.JSONException

/**
 * Per-server worker that fetches `/api/padd` once and updates all Stats and Compact
 * widget instances bound to [serverId].
 *
 * Replaces the old per-widget [PiHoleWidgetWorker] refresh path. A single API call
 * serves every widget regardless of how many instances share the same server.
 */
class ServerPaddWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    companion object {
        private const val TAG = "ServerPaddWorker"
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
            broadcast(serverId, prefs, PaddResponseParser.placeholderState(serverId, server.alias, WidgetStatus.ERROR, false))
            return Result.success()
        }

        val sid = prefs.getSid(serverId)
        if (!prefs.isSidValid(serverId) || sid.isNullOrEmpty()) {
            broadcast(serverId, prefs, PaddResponseParser.placeholderState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false))
            return Result.success()
        }

        val client = PiHoleApiClient(
            allowUntrustedCert = server.allowUntrustedCert,
            ignoreCertificateErrors = server.ignoreCertificateErrors,
            pinnedCertificateSha256 = server.pinnedCertificateSha256,
        )
        if (!client.canConnect(server.address)) {
            if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Certificate pin required for widget")
            broadcast(serverId, prefs, PaddResponseParser.placeholderState(serverId, server.alias, WidgetStatus.ERROR, false))
            return Result.success()
        }

        val resp = client.getWithRetry("${server.address}/api/padd", sid)

        val state = when {
            PiHoleApiClient.isAuthFailure(resp.statusCode) -> {
                if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Auth failure: ${resp.statusCode}")
                prefs.setSidValid(serverId, false)
                PaddResponseParser.placeholderState(serverId, server.alias, WidgetStatus.AUTH_REQUIRED, false)
            }
            resp.statusCode !in 200..299 -> {
                if (WidgetDebugConfig.DEBUG) Log.w(TAG, "API request failed: status=${resp.statusCode}")
                PaddResponseParser.placeholderState(serverId, server.alias, WidgetStatus.ERROR, false)
            }
            else -> {
                try {
                    PaddResponseParser.parse(serverId, server.alias, resp.body)
                } catch (e: JSONException) {
                    if (WidgetDebugConfig.DEBUG) Log.w(TAG, "Invalid JSON response: ${e.message}")
                    PaddResponseParser.placeholderState(serverId, server.alias, WidgetStatus.ERROR, false)
                }
            }
        }

        broadcast(serverId, prefs, state)
        return Result.success()
    }

    private suspend fun broadcast(serverId: String, prefs: WidgetPrefs, state: WidgetState) {
        val manager = AppWidgetManager.getInstance(applicationContext)
        val glanceManager = GlanceAppWidgetManager(applicationContext)
        val statsIds = prefs.getWidgetIdsForServer(
            manager.getAppWidgetIds(ComponentName(applicationContext, PiHoleWidgetProvider::class.java)),
            serverId,
        )
        val compactIds = prefs.getWidgetIdsForServer(
            manager.getAppWidgetIds(ComponentName(applicationContext, CompactWidgetProvider::class.java)),
            serverId,
        )
        for (widgetId in statsIds) {
            val glanceId = runCatching { glanceManager.getGlanceIdBy(widgetId) }.getOrNull() ?: continue
            updateAppWidgetState(applicationContext, glanceId) { it.updateFrom(state) }
            PiHoleGlanceWidget().update(applicationContext, glanceId)
        }
        for (widgetId in compactIds) {
            val glanceId = runCatching { glanceManager.getGlanceIdBy(widgetId) }.getOrNull() ?: continue
            updateAppWidgetState(applicationContext, glanceId) { it.updateFrom(state) }
            CompactGlanceWidget().update(applicationContext, glanceId)
        }
    }
}

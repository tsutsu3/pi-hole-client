package io.github.tsutsu3.pi_hole_client.widget

import android.content.Context
import androidx.work.Constraints
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.ExistingWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.workDataOf
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.worker.ServerBlockingStatusWorker
import io.github.tsutsu3.pi_hole_client.widget.worker.ServerPaddWorker
import io.github.tsutsu3.pi_hole_client.widget.worker.ServerToggleWorker
import io.github.tsutsu3.pi_hole_client.widget.worker.WidgetSyncPeriodicWorker
import java.util.concurrent.TimeUnit

/**
 * Helper for triggering widget refresh from app-side and worker-side events.
 *
 * All refresh paths are per-server: a single API call is made regardless of how
 * many widget instances share the same server. Widget instances are updated locally
 * after the fetch without additional network calls.
 */
object WidgetUpdateHelper {

    /**
     * Refreshes all widget types for widgets bound to [serverId].
     *
     * Enqueues [ServerPaddWorker] (Stats + Compact) and [ServerBlockingStatusWorker]
     * (Toggle) as per-server work items. Concurrent refreshes for the same server are
     * coalesced by WorkManager via [ExistingWorkPolicy.REPLACE].
     */
    fun refreshWidgetsForServer(
        context: Context,
        serverId: String,
        delayMs: Long = 0L,
        existingWorkPolicy: ExistingWorkPolicy = ExistingWorkPolicy.REPLACE,
    ) {
        enqueueServerPadd(context, serverId, delayMs, existingWorkPolicy)
        enqueueServerBlockingStatus(context, serverId, delayMs * 2, existingWorkPolicy)
    }

    /**
     * Refreshes all widget instances regardless of server mapping.
     */
    fun refreshAllWidgets(context: Context) {
        val prefs = WidgetPrefs.getInstance(context)
        prefs.getBoundServerIds(context).forEach { serverId ->
            enqueueServerPadd(context, serverId)
            enqueueServerBlockingStatus(context, serverId)
        }
    }

    /**
     * Refreshes a single widget instance by resolving its server and enqueueing
     * the appropriate per-server workers.
     */
    fun refreshWidget(context: Context, widgetId: Int) {
        val serverId = WidgetPrefs.getInstance(context).getServerForWidget(widgetId) ?: return
        enqueueServerPadd(context, serverId)
        enqueueServerBlockingStatus(context, serverId)
    }

    /**
     * Schedules a one-shot refresh for all widgets bound to [serverId] after
     * [delaySeconds] seconds.
     *
     * Used when the app sets a timed disable on Pi-hole so the widget reflects
     * the automatic re-enable once the timer expires, even if the app is closed.
     */
    fun scheduleDelayedRefresh(context: Context, serverId: String, delaySeconds: Long) {
        val delayMs = delaySeconds * 1000L
        enqueueServerPadd(context, serverId, delayMs)
        enqueueServerBlockingStatus(context, serverId, delayMs)
    }

    /**
     * Schedules the unified periodic background refresh for all widget types.
     *
     * A single [WidgetSyncPeriodicWorker] replaces the three separate periodic
     * workers (stats, compact, toggle). It enumerates bound server ids at runtime
     * and fires per-server workers, so the API call count scales with servers, not
     * with widget instance count.
     */
    fun schedulePeriodicSync(context: Context) {
        // Cleanup legacy periodic jobs from pre per-server architecture versions.
        WorkManager.getInstance(context).cancelUniqueWork("pihole_widget_periodic")
        WorkManager.getInstance(context).cancelUniqueWork("pihole_compact_widget_periodic")
        WorkManager.getInstance(context).cancelUniqueWork("pihole_toggle_widget_periodic")

        val constraints = Constraints.Builder()
            .setRequiredNetworkType(NetworkType.CONNECTED)
            .build()
        val request = PeriodicWorkRequestBuilder<WidgetSyncPeriodicWorker>(
            30L, TimeUnit.MINUTES,
        )
            .setConstraints(constraints)
            .build()
        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            WidgetConstants.WORK_PERIODIC_SYNC,
            ExistingPeriodicWorkPolicy.UPDATE,
            request,
        )
    }

    /**
     * Enqueues [ServerPaddWorker] for [serverId] with an optional initial delay.
     *
     * Stats and Compact widgets share this single fetch; the worker broadcasts the
     * result to all bound instances.
     */
    fun enqueueServerPadd(
        context: Context,
        serverId: String,
        delayMs: Long = 0L,
        existingWorkPolicy: ExistingWorkPolicy = ExistingWorkPolicy.REPLACE,
    ) {
        val builder = OneTimeWorkRequestBuilder<ServerPaddWorker>()
            .setInputData(workDataOf(WidgetConstants.EXTRA_SERVER_ID to serverId))
        if (delayMs > 0L) builder.setInitialDelay(delayMs, TimeUnit.MILLISECONDS)
        WorkManager.getInstance(context).enqueueUniqueWork(
            "${WidgetConstants.WORK_PREFIX_PADD}$serverId",
            existingWorkPolicy,
            builder.build(),
        )
    }

    /**
     * Enqueues [ServerBlockingStatusWorker] for [serverId] with an optional initial delay.
     *
     * Toggle widgets share this single fetch.
     */
    fun enqueueServerBlockingStatus(
        context: Context,
        serverId: String,
        delayMs: Long = 0L,
        existingWorkPolicy: ExistingWorkPolicy = ExistingWorkPolicy.REPLACE,
    ) {
        val builder = OneTimeWorkRequestBuilder<ServerBlockingStatusWorker>()
            .setInputData(workDataOf(WidgetConstants.EXTRA_SERVER_ID to serverId))
        if (delayMs > 0L) builder.setInitialDelay(delayMs, TimeUnit.MILLISECONDS)
        WorkManager.getInstance(context).enqueueUniqueWork(
            "${WidgetConstants.WORK_PREFIX_BLOCKING}$serverId",
            existingWorkPolicy,
            builder.build(),
        )
    }

    /**
     * Enqueues [ServerToggleWorker] for [serverId].
     *
     * Uses [ExistingWorkPolicy.KEEP] so a rapid double-tap cannot cancel an
     * in-flight toggle and leave Pi-hole in an inconsistent state.
     */
    fun enqueueServerToggle(context: Context, serverId: String) {
        val request = OneTimeWorkRequestBuilder<ServerToggleWorker>()
            .setInputData(workDataOf(WidgetConstants.EXTRA_SERVER_ID to serverId))
            .build()
        WorkManager.getInstance(context).enqueueUniqueWork(
            "${WidgetConstants.WORK_PREFIX_TOGGLE}$serverId",
            ExistingWorkPolicy.KEEP,
            request,
        )
    }
}

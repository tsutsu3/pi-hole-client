package io.github.tsutsu3.pi_hole_client.widget.worker

import android.content.Context
import androidx.work.CoroutineWorker
import androidx.work.WorkerParameters
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs

/**
 * Periodic worker that refreshes all widgets for every server that has at least one
 * bound widget instance.
 *
 * Replaces the three separate periodic workers (stats, compact, toggle) with a single
 * schedule entry. For each bound server it enqueues [ServerPaddWorker] and
 * [ServerBlockingStatusWorker], so only one `/api/padd` and one `/api/dns/blocking`
 * call are made per server regardless of widget count.
 */
class WidgetSyncPeriodicWorker(
    context: Context,
    params: WorkerParameters,
) : CoroutineWorker(context, params) {

    override suspend fun doWork(): Result {
        val prefs = WidgetPrefs.getInstance(applicationContext)
        prefs.getBoundServerIds(applicationContext).forEach { serverId ->
            WidgetUpdateHelper.enqueueServerPadd(applicationContext, serverId)
            WidgetUpdateHelper.enqueueServerBlockingStatus(applicationContext, serverId)
        }
        return Result.success()
    }
}

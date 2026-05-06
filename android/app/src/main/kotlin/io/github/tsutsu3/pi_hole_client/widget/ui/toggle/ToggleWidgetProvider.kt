package io.github.tsutsu3.pi_hole_client.widget.ui.toggle

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import androidx.work.Constraints
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.ExistingWorkPolicy
import androidx.work.NetworkType
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.workDataOf
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.worker.ToggleWidgetWorker
import java.util.concurrent.TimeUnit

/**
 * Glance receiver for the 1x1 Pi-hole blocking toggle widget.
 *
 * Mirrors [PiHoleWidgetProvider] but delegates to [ToggleWidgetWorker]
 * and uses distinct work names to avoid collisions.
 */
class ToggleWidgetProvider : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = ToggleGlanceWidget()

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        super.onUpdate(context, appWidgetManager, appWidgetIds)
        appWidgetIds.forEach { widgetId ->
            enqueueWork(context, widgetId, WidgetConstants.ACTION_REFRESH)
        }
        schedulePeriodic(context)
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        val widgetId = intent.getIntExtra(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID,
        )
        if (widgetId == AppWidgetManager.INVALID_APPWIDGET_ID) {
            return
        }

        when (intent.action) {
            WidgetConstants.ACTION_REFRESH,
            WidgetConstants.ACTION_TOGGLE,
            -> enqueueWork(context, widgetId, intent.action ?: WidgetConstants.ACTION_REFRESH)
        }
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        val prefs = WidgetPrefs.getInstance(context)
        appWidgetIds.forEach { widgetId ->
            prefs.clearWidget(widgetId)
        }
        super.onDeleted(context, appWidgetIds)
    }

    companion object {
        /**
         * Enqueues a one-time worker for a single toggle widget instance.
         */
        fun enqueueWork(context: Context, widgetId: Int, action: String) {
            val request = OneTimeWorkRequestBuilder<ToggleWidgetWorker>()
                .setInputData(
                    workDataOf(
                        AppWidgetManager.EXTRA_APPWIDGET_ID to widgetId,
                        WidgetConstants.EXTRA_ACTION to action,
                    ),
                )
                .build()

            // TOGGLE uses KEEP so a rapid second tap cannot cancel an in-flight toggle
            // and leave Pi-hole in an inconsistent state.
            // REFRESH uses a separate name so it never cancels a running TOGGLE.
            val (workName, policy) = when (action) {
                WidgetConstants.ACTION_TOGGLE ->
                    "pihole_toggle_action_$widgetId" to ExistingWorkPolicy.KEEP
                else ->
                    "pihole_toggle_refresh_$widgetId" to ExistingWorkPolicy.KEEP
            }
            WorkManager.getInstance(context).enqueueUniqueWork(workName, policy, request)
        }
    }

    /**
     * Periodic refresh to keep toggle state reasonably fresh.
     *
     * The 30-minute interval balances data freshness against battery cost.
     * Shorter intervals (e.g. 15 min) would improve responsiveness but drain
     * the battery noticeably, while longer intervals make the widget feel stale.
     * 30 minutes is also the minimum that WorkManager's periodic API guarantees.
     */
    private fun schedulePeriodic(context: Context) {
        WidgetUpdateHelper.scheduleTogglePeriodicUpdate(context)
    }
}

package io.github.tsutsu3.pi_hole_client.widget

import android.appwidget.AppWidgetManager
import android.appwidget.AppWidgetProvider
import android.content.Context
import android.content.Intent
import androidx.work.ExistingPeriodicWorkPolicy
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.PeriodicWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.workDataOf
import java.util.concurrent.TimeUnit

/**
 * AppWidgetProvider for the Pi-hole Home Widget.
 *
 * It forwards lifecycle and user actions to WorkManager so the widget never
 * blocks the broadcast receiver on network or disk IO.
 */
class PiHoleWidgetProvider : AppWidgetProvider() {
    /**
     * Enqueue refresh work for each widget instance.
     */
    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        appWidgetIds.forEach { widgetId ->
            enqueueWork(context, widgetId, WidgetConstants.ACTION_REFRESH)
        }
        schedulePeriodic(context)
    }

    /**
     * Handles widget broadcast actions (refresh/toggle).
     */
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

    /**
     * Triggers a refresh when the widget size changes.
     */
    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: android.os.Bundle,
    ) {
        super.onAppWidgetOptionsChanged(context, appWidgetManager, appWidgetId, newOptions)
        enqueueWork(context, appWidgetId, WidgetConstants.ACTION_REFRESH)
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        val prefs = WidgetPrefs(context)
        appWidgetIds.forEach { widgetId ->
            prefs.clearWidget(widgetId)
        }
        super.onDeleted(context, appWidgetIds)
    }

    /**
     * Enqueues a one-time worker for a single widget instance.
     */
    private fun enqueueWork(context: Context, widgetId: Int, action: String) {
        val request = OneTimeWorkRequestBuilder<PiHoleWidgetWorker>()
            .setInputData(
                workDataOf(
                    AppWidgetManager.EXTRA_APPWIDGET_ID to widgetId,
                    WidgetConstants.EXTRA_ACTION to action,
                ),
            )
            .build()

        // Unique work keeps only the latest action for this widget id.
        WorkManager.getInstance(context).enqueueUniqueWork(
            "pihole_widget_$widgetId",
            ExistingWorkPolicy.REPLACE,
            request,
        )
    }

    /**
     * Periodic refresh to keep widget state reasonably fresh.
     */
    private fun schedulePeriodic(context: Context) {
        val request = PeriodicWorkRequestBuilder<PiHoleWidgetWorker>(
            30,
            TimeUnit.MINUTES,
        ).build()
        WorkManager.getInstance(context).enqueueUniquePeriodicWork(
            "pihole_widget_periodic",
            ExistingPeriodicWorkPolicy.UPDATE,
            request,
        )
    }
}

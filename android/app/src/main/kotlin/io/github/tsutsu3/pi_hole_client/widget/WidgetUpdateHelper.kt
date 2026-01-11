package io.github.tsutsu3.pi_hole_client.widget

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.workDataOf

/**
 * Helper for triggering widget refresh from app-side events.
 *
 * Used when Flutter updates server state and wants widgets to repaint.
 */
object WidgetUpdateHelper {
    /**
     * Refreshes widgets that are bound to a specific server id.
     */
    fun refreshWidgetsForServer(context: Context, serverId: String) {
        val manager = AppWidgetManager.getInstance(context)
        val widgetIds = manager.getAppWidgetIds(
            ComponentName(context, PiHoleWidgetProvider::class.java),
        )
        val prefs = WidgetPrefs(context)
        val targets = prefs.getWidgetIdsForServer(widgetIds, serverId)
        targets.forEach { widgetId ->
            enqueueRefresh(context, widgetId)
        }
    }

    /**
     * Refreshes all widget instances regardless of server mapping.
     */
    fun refreshAllWidgets(context: Context) {
        val manager = AppWidgetManager.getInstance(context)
        val widgetIds = manager.getAppWidgetIds(
            ComponentName(context, PiHoleWidgetProvider::class.java),
        )
        widgetIds.forEach { widgetId ->
            enqueueRefresh(context, widgetId)
        }
    }

    /**
     * Enqueues a one-time refresh worker for a widget instance.
     */
    private fun enqueueRefresh(context: Context, widgetId: Int) {
        val request = OneTimeWorkRequestBuilder<PiHoleWidgetWorker>()
            .setInputData(
                workDataOf(
                    AppWidgetManager.EXTRA_APPWIDGET_ID to widgetId,
                    WidgetConstants.EXTRA_ACTION to WidgetConstants.ACTION_REFRESH,
                ),
            )
            .build()

        // Unique work avoids piling up refreshes while keeping the latest request.
        WorkManager.getInstance(context).enqueueUniqueWork(
            "pihole_widget_channel_$widgetId",
            ExistingWorkPolicy.REPLACE,
            request,
        )
    }
}

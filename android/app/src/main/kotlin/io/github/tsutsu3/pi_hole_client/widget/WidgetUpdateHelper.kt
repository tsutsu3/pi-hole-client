package io.github.tsutsu3.pi_hole_client.widget

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import androidx.work.ExistingWorkPolicy
import androidx.work.OneTimeWorkRequestBuilder
import androidx.work.WorkManager
import androidx.work.workDataOf
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.ui.stats.PiHoleWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.compact.CompactWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.worker.PiHoleWidgetWorker
import io.github.tsutsu3.pi_hole_client.widget.worker.ToggleWidgetWorker

/**
 * Helper for triggering widget refresh from app-side events.
 *
 * Used when Flutter updates server state and wants widgets to repaint.
 * Covers stats widget ([PiHoleWidgetProvider]), toggle widget
 * ([ToggleWidgetProvider]), and compact widget ([CompactWidgetProvider]).
 */
object WidgetUpdateHelper {
    /**
     * Refreshes widgets that are bound to a specific server id.
     */
    fun refreshWidgetsForServer(context: Context, serverId: String) {
        val manager = AppWidgetManager.getInstance(context)
        val prefs = WidgetPrefs(context)

        // Stats widgets
        val statsIds = manager.getAppWidgetIds(
            ComponentName(context, PiHoleWidgetProvider::class.java),
        )
        prefs.getWidgetIdsForServer(statsIds, serverId).forEach { widgetId ->
            enqueueStatsRefresh(context, widgetId)
        }

        // Toggle widgets
        val toggleIds = manager.getAppWidgetIds(
            ComponentName(context, ToggleWidgetProvider::class.java),
        )
        prefs.getWidgetIdsForServer(toggleIds, serverId).forEach { widgetId ->
            enqueueToggleRefresh(context, widgetId)
        }

        // Compact widgets
        val compactIds = manager.getAppWidgetIds(
            ComponentName(context, CompactWidgetProvider::class.java),
        )
        prefs.getWidgetIdsForServer(compactIds, serverId).forEach { widgetId ->
            enqueueCompactRefresh(context, widgetId)
        }
    }

    /**
     * Refreshes all widget instances regardless of server mapping.
     */
    fun refreshAllWidgets(context: Context) {
        val manager = AppWidgetManager.getInstance(context)

        manager.getAppWidgetIds(
            ComponentName(context, PiHoleWidgetProvider::class.java),
        ).forEach { enqueueStatsRefresh(context, it) }

        manager.getAppWidgetIds(
            ComponentName(context, ToggleWidgetProvider::class.java),
        ).forEach { enqueueToggleRefresh(context, it) }

        manager.getAppWidgetIds(
            ComponentName(context, CompactWidgetProvider::class.java),
        ).forEach { enqueueCompactRefresh(context, it) }
    }

    /**
     * Refreshes a single widget instance, auto-detecting its type.
     */
    fun refreshWidget(context: Context, widgetId: Int) {
        val manager = AppWidgetManager.getInstance(context)

        val statsIds = manager.getAppWidgetIds(
            ComponentName(context, PiHoleWidgetProvider::class.java),
        )
        if (widgetId in statsIds) {
            enqueueStatsRefresh(context, widgetId)
            return
        }

        val toggleIds = manager.getAppWidgetIds(
            ComponentName(context, ToggleWidgetProvider::class.java),
        )
        if (widgetId in toggleIds) {
            enqueueToggleRefresh(context, widgetId)
            return
        }

        val compactIds = manager.getAppWidgetIds(
            ComponentName(context, CompactWidgetProvider::class.java),
        )
        if (widgetId in compactIds) {
            enqueueCompactRefresh(context, widgetId)
            return
        }

        // Fallback: enqueue all; the wrong worker will silently skip
        // when GlanceAppWidgetManager cannot resolve the GlanceId.
        enqueueStatsRefresh(context, widgetId)
        enqueueToggleRefresh(context, widgetId)
        enqueueCompactRefresh(context, widgetId)
    }

    private fun enqueueStatsRefresh(context: Context, widgetId: Int) {
        val request = OneTimeWorkRequestBuilder<PiHoleWidgetWorker>()
            .setInputData(
                workDataOf(
                    AppWidgetManager.EXTRA_APPWIDGET_ID to widgetId,
                    WidgetConstants.EXTRA_ACTION to WidgetConstants.ACTION_REFRESH,
                ),
            )
            .build()

        WorkManager.getInstance(context).enqueueUniqueWork(
            "pihole_widget_channel_$widgetId",
            ExistingWorkPolicy.REPLACE,
            request,
        )
    }

    private fun enqueueToggleRefresh(context: Context, widgetId: Int) {
        val request = OneTimeWorkRequestBuilder<ToggleWidgetWorker>()
            .setInputData(
                workDataOf(
                    AppWidgetManager.EXTRA_APPWIDGET_ID to widgetId,
                    WidgetConstants.EXTRA_ACTION to WidgetConstants.ACTION_REFRESH,
                ),
            )
            .build()

        WorkManager.getInstance(context).enqueueUniqueWork(
            "pihole_toggle_channel_$widgetId",
            ExistingWorkPolicy.REPLACE,
            request,
        )
    }

    private fun enqueueCompactRefresh(context: Context, widgetId: Int) {
        val request = OneTimeWorkRequestBuilder<PiHoleWidgetWorker>()
            .setInputData(
                workDataOf(
                    AppWidgetManager.EXTRA_APPWIDGET_ID to widgetId,
                    WidgetConstants.EXTRA_ACTION to WidgetConstants.ACTION_REFRESH,
                ),
            )
            .build()

        WorkManager.getInstance(context).enqueueUniqueWork(
            "pihole_compact_channel_$widgetId",
            ExistingWorkPolicy.REPLACE,
            request,
        )
    }
}

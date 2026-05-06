package io.github.tsutsu3.pi_hole_client.widget.ui.toggle

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs

/**
 * Glance receiver for the 1×1 Pi-hole blocking toggle widget.
 *
 * Toggle taps dispatch to [ServerToggleWorker] (per-server, KEEP policy).
 * Refresh requests dispatch to [ServerBlockingStatusWorker].
 */
class ToggleWidgetProvider : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = ToggleGlanceWidget()

    override fun onUpdate(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetIds: IntArray,
    ) {
        super.onUpdate(context, appWidgetManager, appWidgetIds)
        val prefs = WidgetPrefs.getInstance(context)
        appWidgetIds.toList()
            .mapNotNull { prefs.getServerForWidget(it) }
            .toSet()
            .forEach { serverId -> WidgetUpdateHelper.enqueueServerBlockingStatus(context, serverId) }
        WidgetUpdateHelper.schedulePeriodicSync(context)
    }

    override fun onReceive(context: Context, intent: Intent) {
        super.onReceive(context, intent)
        val widgetId = intent.getIntExtra(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID,
        )
        if (widgetId == AppWidgetManager.INVALID_APPWIDGET_ID) return

        val serverId = WidgetPrefs.getInstance(context).getServerForWidget(widgetId) ?: return
        when (intent.action) {
            WidgetConstants.ACTION_TOGGLE -> WidgetUpdateHelper.enqueueServerToggle(context, serverId)
            WidgetConstants.ACTION_REFRESH -> WidgetUpdateHelper.enqueueServerBlockingStatus(context, serverId)
        }
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        val prefs = WidgetPrefs.getInstance(context)
        appWidgetIds.forEach { prefs.clearWidget(it) }
        super.onDeleted(context, appWidgetIds)
    }
}

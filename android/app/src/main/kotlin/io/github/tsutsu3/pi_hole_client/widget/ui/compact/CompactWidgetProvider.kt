package io.github.tsutsu3.pi_hole_client.widget.ui.compact

import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.GlanceAppWidgetReceiver
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs

/**
 * Glance receiver for the 2×1 Pi-hole compact widget.
 *
 * Mirrors [PiHoleWidgetProvider] but uses [CompactGlanceWidget] for rendering.
 * Both share [ServerPaddWorker] since they consume the same `/api/padd` data.
 */
class CompactWidgetProvider : GlanceAppWidgetReceiver() {
    override val glanceAppWidget: GlanceAppWidget = CompactGlanceWidget()

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
            .forEach { serverId -> WidgetUpdateHelper.enqueueServerPadd(context, serverId) }
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
            WidgetConstants.ACTION_REFRESH -> WidgetUpdateHelper.enqueueServerPadd(context, serverId)
        }
    }

    override fun onAppWidgetOptionsChanged(
        context: Context,
        appWidgetManager: AppWidgetManager,
        appWidgetId: Int,
        newOptions: android.os.Bundle,
    ) {
        super.onAppWidgetOptionsChanged(context, appWidgetManager, appWidgetId, newOptions)
        val serverId = WidgetPrefs.getInstance(context).getServerForWidget(appWidgetId) ?: return
        WidgetUpdateHelper.enqueueServerPadd(context, serverId)
    }

    override fun onDeleted(context: Context, appWidgetIds: IntArray) {
        val prefs = WidgetPrefs.getInstance(context)
        appWidgetIds.forEach { prefs.clearWidget(it) }
        super.onDeleted(context, appWidgetIds)
    }
}

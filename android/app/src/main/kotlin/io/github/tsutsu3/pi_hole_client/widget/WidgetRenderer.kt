package io.github.tsutsu3.pi_hole_client.widget

import android.app.PendingIntent
import android.appwidget.AppWidgetManager
import android.content.Context
import android.content.Intent
import android.widget.RemoteViews
import io.github.tsutsu3.pi_hole_client.MainActivity
import io.github.tsutsu3.pi_hole_client.R
import java.util.Locale
import kotlin.math.floor

/**
 * Widget status derived from Pi-hole blocking and auth state.
 */
enum class WidgetStatus {
    BLOCKING_ON,
    BLOCKING_OFF,
    AUTH_REQUIRED,
    ERROR,
}

/**
 * Immutable widget view model used to render RemoteViews.
 */
data class WidgetState(
    val serverId: String,
    val serverName: String,
    val status: WidgetStatus,
    val totalQueries: String,
    val blockedQueries: String,
    val percentBlocked: String,
    val domainsOnAdlists: String,
    val uptime: String,
    val cpuTemp: String,
    val cpuUsage: String,
    val memUsage: String,
    val updatedAt: String,
    val actionsEnabled: Boolean,
)

/**
 * Builds and updates RemoteViews for a widget instance.
 *
 * RemoteViews have strict limitations (no custom views, no data binding),
 * so all UI state must be expressed through basic view setters.
 */
class WidgetRenderer(private val context: Context) {
    /**
     * Renders the widget using the appropriate layout and binds actions.
     */
    fun update(widgetId: Int, state: WidgetState) {
        val layoutType = resolveLayoutType(widgetId)
        val views = RemoteViews(context.packageName, layoutFor(layoutType))
        views.setTextViewText(R.id.widget_server_name, state.serverName)
        if (layoutType == WidgetLayoutType.EXTRA_LARGE) {
            views.setInt(R.id.widget_server_name, "setMaxEms", 16)
        } else if (layoutType == WidgetLayoutType.LARGE) {
            views.setInt(R.id.widget_server_name, "setMaxEms", 12)
        }
        if (layoutType == WidgetLayoutType.LARGE || layoutType == WidgetLayoutType.EXTRA_LARGE) {
            views.setTextViewText(R.id.widget_uptime_text, state.uptime)
            views.setTextViewText(R.id.widget_temp_text, state.cpuTemp)
        }
        if (layoutType == WidgetLayoutType.LARGE ||
            layoutType == WidgetLayoutType.EXTRA_LARGE ||
            layoutType == WidgetLayoutType.MEDIUM
        ) {
            views.setTextViewText(R.id.widget_cpu_text, state.cpuUsage)
            views.setTextViewText(R.id.widget_mem_text, state.memUsage)
        }

        when (layoutType) {
            WidgetLayoutType.EXTRA_LARGE -> {
                // Large layouts favor readability over compact labels.
                views.setTextViewText(
                    R.id.widget_queries_label,
                    context.getString(R.string.widget_total_label_long),
                )
                views.setTextViewText(
                    R.id.widget_blocked_label,
                    context.getString(R.string.widget_blocked_label_long),
                )
                views.setTextViewText(
                    R.id.widget_percent_label,
                    context.getString(R.string.widget_percent_label_long),
                )
                views.setTextViewText(
                    R.id.widget_domains_label,
                    context.getString(R.string.widget_domains_label_long),
                )
                views.setTextViewText(
                    R.id.widget_queries_value,
                    context.getString(R.string.widget_total_format, state.totalQueries),
                )
                views.setTextViewText(
                    R.id.widget_blocked_value,
                    context.getString(R.string.widget_blocked_format, state.blockedQueries),
                )
                views.setTextViewText(
                    R.id.widget_percent_value,
                    context.getString(R.string.widget_percent_format, state.percentBlocked),
                )
                views.setTextViewText(
                    R.id.widget_domains_value,
                    context.getString(R.string.widget_domains_format, state.domainsOnAdlists),
                )
                views.setTextViewText(
                    R.id.widget_last_updated,
                    context.getString(R.string.widget_last_updated_format, state.updatedAt),
                )
            }
            WidgetLayoutType.LARGE -> {
                // Medium-large layout keeps labels short to reduce crowding.
                views.setTextViewText(
                    R.id.widget_queries_label,
                    context.getString(R.string.widget_total_label),
                )
                views.setTextViewText(
                    R.id.widget_blocked_label,
                    context.getString(R.string.widget_blocked_label),
                )
                views.setTextViewText(
                    R.id.widget_percent_label,
                    context.getString(R.string.widget_percent_label),
                )
                views.setTextViewText(
                    R.id.widget_domains_label,
                    context.getString(R.string.widget_domains_label),
                )
                views.setTextViewText(
                    R.id.widget_queries_value,
                    context.getString(R.string.widget_total_format, state.totalQueries),
                )
                views.setTextViewText(
                    R.id.widget_blocked_value,
                    context.getString(R.string.widget_blocked_format, state.blockedQueries),
                )
                views.setTextViewText(
                    R.id.widget_percent_value,
                    context.getString(R.string.widget_percent_format, state.percentBlocked),
                )
                views.setTextViewText(
                    R.id.widget_domains_value,
                    context.getString(R.string.widget_domains_format, state.domainsOnAdlists),
                )
                views.setTextViewText(
                    R.id.widget_last_updated,
                    context.getString(R.string.widget_last_updated_format, state.updatedAt),
                )
            }
            WidgetLayoutType.MEDIUM -> {
                // Compact layout uses abbreviated labels and numbers.
                views.setTextViewText(
                    R.id.widget_queries_label,
                    context.getString(R.string.widget_total_label_short),
                )
                views.setTextViewText(
                    R.id.widget_blocked_label,
                    context.getString(R.string.widget_blocked_label_short),
                )
                views.setTextViewText(
                    R.id.widget_percent_label,
                    context.getString(R.string.widget_percent_label_short),
                )
                views.setTextViewText(
                    R.id.widget_domains_label,
                    context.getString(R.string.widget_domains_label_short),
                )
                val compactTotal = formatCompactNumber(state.totalQueries)
                val compactBlocked = formatCompactNumber(state.blockedQueries)
                val compactDomains = formatCompactNumber(state.domainsOnAdlists)
                views.setTextViewText(
                    R.id.widget_queries_value,
                    context.getString(R.string.widget_total_format, compactTotal),
                )
                views.setTextViewText(
                    R.id.widget_blocked_value,
                    context.getString(R.string.widget_blocked_format, compactBlocked),
                )
                views.setTextViewText(
                    R.id.widget_percent_value,
                    context.getString(R.string.widget_percent_format, state.percentBlocked),
                )
                views.setTextViewText(
                    R.id.widget_domains_value,
                    context.getString(R.string.widget_domains_format, compactDomains),
                )
                views.setTextViewText(
                    R.id.widget_last_updated,
                    context.getString(R.string.widget_last_updated_format, state.updatedAt),
                )
            }
            WidgetLayoutType.TALL -> {
                // Tall layout prioritizes a single metric for quick glance.
                views.setTextViewText(
                    R.id.widget_primary_label,
                    context.getString(R.string.widget_percent_label),
                )
                views.setTextViewText(
                    R.id.widget_primary_value,
                    context.getString(R.string.widget_percent_format, state.percentBlocked),
                )
                views.setTextViewText(
                    R.id.widget_last_updated,
                    context.getString(R.string.widget_last_updated_format, state.updatedAt),
                )
            }
        }

        val refreshIntent = if (state.status == WidgetStatus.AUTH_REQUIRED) {
            // Auth-required state should open the app to let Flutter re-auth.
            buildOpenAppIntent(widgetId, state.serverId)
        } else {
            buildActionIntent(widgetId, WidgetConstants.ACTION_REFRESH)
        }
        val toggleIntent = buildActionIntent(widgetId, WidgetConstants.ACTION_TOGGLE)
        val openIntent = buildOpenAppIntent(widgetId, state.serverId)
        views.setOnClickPendingIntent(
            R.id.widget_toggle_icon,
            toggleIntent,
        )
        if (layoutType == WidgetLayoutType.LARGE || layoutType == WidgetLayoutType.MEDIUM) {
            views.setOnClickPendingIntent(
                R.id.widget_refresh_icon,
                refreshIntent,
            )
        }
        views.setOnClickPendingIntent(R.id.widget_root, openIntent)

        views.setBoolean(R.id.widget_toggle_icon, "setEnabled", state.actionsEnabled)
        if (layoutType == WidgetLayoutType.LARGE || layoutType == WidgetLayoutType.MEDIUM) {
            views.setBoolean(
                R.id.widget_refresh_icon,
                "setEnabled",
                true,
            )
            views.setInt(
                R.id.widget_refresh_icon,
                "setColorFilter",
                context.getColor(R.color.widget_text_secondary),
            )
        }
        views.setInt(
            R.id.widget_toggle_icon,
            "setBackgroundResource",
            toggleBackground(state.status, state.actionsEnabled),
        )
        views.setImageViewResource(
            R.id.widget_toggle_icon,
            toggleIcon(state.status, state.actionsEnabled),
        )

        AppWidgetManager.getInstance(context).updateAppWidget(widgetId, views)
    }

    /**
     * Resolves the layout bucket based on widget size options.
     */
    private fun resolveLayoutType(widgetId: Int): WidgetLayoutType {
        val manager = AppWidgetManager.getInstance(context)
        val options = manager.getAppWidgetOptions(widgetId)
        val minWidth = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_WIDTH)
        val minHeight = options.getInt(AppWidgetManager.OPTION_APPWIDGET_MIN_HEIGHT)
        val columns = estimateColumns(minWidth)
        val rows = estimateRows(minHeight).coerceAtMost(2)

        // Keep only up to 2 rows to avoid over-dense layouts.
        return when {
            columns >= 4 && rows >= 2 -> WidgetLayoutType.EXTRA_LARGE
            columns >= 3 && rows >= 2 -> WidgetLayoutType.LARGE
            columns >= 2 && rows >= 2 -> WidgetLayoutType.MEDIUM
            else -> WidgetLayoutType.TALL
        }
    }

    private fun estimateColumns(sizeDp: Int): Int {
        // Column thresholds are tuned for typical launcher grid sizes.
        return when {
            sizeDp >= 360 -> 4
            sizeDp >= 260 -> 3
            sizeDp >= 140 -> 2
            else -> 1
        }
    }

    private fun estimateRows(sizeDp: Int): Int {
        // Row thresholds mirror the minimum heights exposed by AppWidgetHost.
        return when {
            sizeDp >= 180 -> 3
            sizeDp >= 110 -> 2
            else -> 1
        }
    }

    private fun layoutFor(type: WidgetLayoutType): Int {
        return when (type) {
            WidgetLayoutType.EXTRA_LARGE -> R.layout.pihole_widget_large
            WidgetLayoutType.LARGE -> R.layout.pihole_widget_large
            WidgetLayoutType.MEDIUM -> R.layout.pihole_widget_medium
            WidgetLayoutType.TALL -> R.layout.pihole_widget_small
        }
    }

    private fun buildActionIntent(widgetId: Int, action: String): PendingIntent {
        val intent = Intent(context, PiHoleWidgetProvider::class.java).apply {
            this.action = action
            putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, widgetId)
        }
        // Unique requestCode prevents PendingIntent collisions between actions.
        return PendingIntent.getBroadcast(
            context,
            widgetId + action.hashCode(),
            intent,
            // UPDATE_CURRENT ensures the latest extras are delivered on reuse.
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    private fun buildOpenAppIntent(widgetId: Int, serverId: String): PendingIntent {
        val intent = Intent(context, MainActivity::class.java).apply {
            action = WidgetConstants.ACTION_OPEN_APP
            putExtra(AppWidgetManager.EXTRA_APPWIDGET_ID, widgetId)
            putExtra("serverId", serverId)
            addFlags(Intent.FLAG_ACTIVITY_NEW_TASK or Intent.FLAG_ACTIVITY_CLEAR_TOP)
        }
        // Widgets pass only the server id; Flutter handles auth and navigation.
        return PendingIntent.getActivity(
            context,
            widgetId + 9000,
            intent,
            // Immutable pending intents are required on newer Android versions.
            PendingIntent.FLAG_UPDATE_CURRENT or PendingIntent.FLAG_IMMUTABLE,
        )
    }

    private fun toggleBackground(status: WidgetStatus, enabled: Boolean): Int {
        if (!enabled) {
            return R.drawable.widget_action_button_disabled
        }
        return when (status) {
            WidgetStatus.BLOCKING_ON -> R.drawable.widget_action_button_on
            WidgetStatus.BLOCKING_OFF -> R.drawable.widget_action_button_off
            WidgetStatus.AUTH_REQUIRED -> R.drawable.widget_action_button_disabled
            WidgetStatus.ERROR -> R.drawable.widget_action_button_disabled
        }
    }

    private fun toggleIcon(status: WidgetStatus, enabled: Boolean): Int {
        if (!enabled) {
            return R.drawable.widget_icon_shield_disabled
        }
        return when (status) {
            WidgetStatus.BLOCKING_ON -> R.drawable.widget_icon_shield_on
            WidgetStatus.BLOCKING_OFF -> R.drawable.widget_icon_shield_off
            WidgetStatus.AUTH_REQUIRED -> R.drawable.widget_icon_shield_disabled
            WidgetStatus.ERROR -> R.drawable.widget_icon_shield_disabled
        }
    }

    private fun formatCompactNumber(value: String): String {
        val cleaned = value.replace(",", "").trim()
        val number = cleaned.toLongOrNull() ?: return value
        return formatCompactNumber(number)
    }

    /**
     * Formats large numbers into compact units for small widgets.
     */
    private fun formatCompactNumber(number: Long): String {
        if (number < 1000) {
            return number.toString()
        }
        val units = arrayOf("K", "M", "B", "T")
        var value = number.toDouble()
        var unitIndex = -1
        while (value >= 1000 && unitIndex < units.size - 1) {
            value /= 1000
            unitIndex += 1
        }
        val unit = units[unitIndex]
        val formatted = if (value >= 100) {
            floor(value).toLong().toString()
        } else {
            val truncated = floor(value * 10.0) / 10.0
            if (truncated % 1.0 == 0.0) {
                String.format(Locale.US, "%.0f", truncated)
            } else {
                String.format(Locale.US, "%.1f", truncated)
            }
        }
        return "$formatted$unit"
    }
}

/**
 * Internal layout buckets for size-based rendering decisions.
 */
private enum class WidgetLayoutType {
    EXTRA_LARGE,
    LARGE,
    MEDIUM,
    TALL,
}

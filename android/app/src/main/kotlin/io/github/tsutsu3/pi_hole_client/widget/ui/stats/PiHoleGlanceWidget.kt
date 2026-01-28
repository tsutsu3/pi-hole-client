package io.github.tsutsu3.pi_hole_client.widget.ui.stats

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.DpSize
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.compose.ui.unit.TextUnit
import androidx.datastore.preferences.core.Preferences
import androidx.glance.ColorFilter
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.LocalContext
import androidx.glance.LocalSize
import androidx.glance.background
import androidx.glance.action.Action
import androidx.glance.action.ActionParameters
import androidx.glance.action.actionParametersOf
import androidx.glance.action.actionStartActivity
import androidx.glance.action.clickable
import androidx.glance.appwidget.AppWidgetId
import androidx.glance.appwidget.GlanceAppWidget
import androidx.glance.appwidget.SizeMode
import androidx.glance.appwidget.action.ActionCallback
import androidx.glance.appwidget.action.actionRunCallback
import androidx.glance.appwidget.cornerRadius
import androidx.glance.appwidget.provideContent
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxHeight
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.fillMaxWidth
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.layout.width
import androidx.glance.layout.height
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.state.PreferencesGlanceStateDefinition
import androidx.glance.unit.ColorProvider
import androidx.glance.currentState
import io.github.tsutsu3.pi_hole_client.MainActivity
import io.github.tsutsu3.pi_hole_client.R
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetTheme
import io.github.tsutsu3.pi_hole_client.widget.data.toWidgetState
import kotlin.math.floor

/**
 * Glance widget entry point for the Pi-hole home widget UI.
 */
class PiHoleGlanceWidget : GlanceAppWidget() {
    // Fixed size buckets keep the layout aligned with common launcher grid sizes.
    // Includes tablet-friendly heights (180dp+) for full metric card display.
    override val sizeMode: SizeMode = SizeMode.Responsive(
        setOf(
            DpSize(140.dp, 110.dp),   // TALL or MEDIUM (phone 2x2 min)
            DpSize(210.dp, 110.dp),   // MEDIUM (phone 3x2 min height)
            DpSize(210.dp, 180.dp),   // LARGE (phone/tablet 3x2 full)
            DpSize(320.dp, 180.dp),   // LARGE (tablet wider)
            DpSize(360.dp, 180.dp),   // EXTRA_LARGE (tablet 4x2)
            DpSize(360.dp, 250.dp),   // EXTRA_LARGE (tablet taller)
        ),
    )
    // Preferences-backed state keeps the widget lightweight and easily updated by workers.
    override val stateDefinition = PreferencesGlanceStateDefinition

    override suspend fun provideGlance(context: Context, id: androidx.glance.GlanceId) {
        provideContent {
            // State is pushed by WorkManager; avoid heavy work in composition.
            val prefs = currentState<Preferences>()
            val state = prefs.toWidgetState()
            val layoutType = resolveLayoutType(LocalSize.current)
            WidgetContent(
                state = state,
                layoutType = layoutType,
            )
        }
    }
}

/**
 * Stats widget callback: triggers a data refresh via [PiHoleWidgetProvider].
 */
class StatsRefreshCallback : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: androidx.glance.GlanceId,
        parameters: ActionParameters,
    ) {
        val appWidgetId = (glanceId as? AppWidgetId)?.appWidgetId ?: return
        PiHoleWidgetProvider.enqueueWork(
            context,
            appWidgetId,
            WidgetConstants.ACTION_REFRESH,
        )
    }
}

/**
 * Stats widget callback: toggles DNS blocking via [PiHoleWidgetProvider].
 */
class StatsToggleCallback : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: androidx.glance.GlanceId,
        parameters: ActionParameters,
    ) {
        val appWidgetId = (glanceId as? AppWidgetId)?.appWidgetId ?: return
        PiHoleWidgetProvider.enqueueWork(
            context,
            appWidgetId,
            WidgetConstants.ACTION_TOGGLE,
        )
    }
}

/**
 * Proportional sizing parameters calculated from widget dimensions.
 */
private data class WidgetSizing(
    val padding: androidx.compose.ui.unit.Dp,
    val cornerRadius: androidx.compose.ui.unit.Dp,
    val buttonSize: Int,
    val buttonIconSize: Int,
    val cardCornerRadius: androidx.compose.ui.unit.Dp,
    val cardPadding: androidx.compose.ui.unit.Dp,
    val cardGap: androidx.compose.ui.unit.Dp,
    val cardLabelFontSize: androidx.compose.ui.unit.TextUnit,
    val cardValueFontSize: androidx.compose.ui.unit.TextUnit,
    val cardIconSize: androidx.compose.ui.unit.Dp,
    val headerSpacing: androidx.compose.ui.unit.Dp,
)

@Composable
private fun WidgetContent(
    state: WidgetState,
    layoutType: WidgetLayoutType,
) {
    val context = LocalContext.current
    val size = LocalSize.current
    val serverName = if (state.serverName.isNotBlank()) {
        state.serverName
    } else {
        context.getString(R.string.widget_unknown_server)
    }

    // Calculate proportional sizes based on widget dimensions
    val minDimension = minOf(size.width.value, size.height.value)
    val sizing = WidgetSizing(
        padding = if (layoutType == WidgetLayoutType.TALL) {
            (minDimension * 0.08f).coerceIn(6f, 10f).dp
        } else {
            (minDimension * 0.06f).coerceIn(10f, 16f).dp
        },
        cornerRadius = (minDimension * 0.08f).coerceIn(12f, 20f).dp,
        buttonSize = (minDimension * 0.18f).coerceIn(32f, 40f).toInt(),
        buttonIconSize = (minDimension * 0.10f).coerceIn(18f, 24f).toInt(),
        cardCornerRadius = (minDimension * 0.06f).coerceIn(10f, 14f).dp,
        cardPadding = (minDimension * 0.04f).coerceIn(6f, 10f).dp,
        cardGap = (minDimension * 0.03f).coerceIn(4f, 8f).dp,
        cardLabelFontSize = (minDimension * 0.08f).coerceIn(9f, 12f).sp,
        cardValueFontSize = (minDimension * 0.11f).coerceIn(12f, 18f).sp,
        cardIconSize = (minDimension * 0.07f).coerceIn(9f, 12f).dp,
        headerSpacing = (minDimension * 0.03f).coerceIn(2f, 6f).dp,
    )

    val openAppAction = actionStartActivity<MainActivity>(
        actionParametersOf(WidgetTheme.ServerIdKey to state.serverId),
    )
    val refreshAction = if (layoutType != WidgetLayoutType.TALL) {
        if (state.status == WidgetStatus.AUTH_REQUIRED) {
            // Auth-required state must open the app so Flutter can refresh SID.
            openAppAction
        } else {
            actionRunCallback<StatsRefreshCallback>()
        }
    } else {
        null
    }
    val toggleAction = if (state.actionsEnabled) {
        // Disable toggle to avoid calls when auth or server data is missing.
        actionRunCallback<StatsToggleCallback>()
    } else {
        null
    }

    val rootModifier = GlanceModifier
        .fillMaxSize()
        .background(R.color.widget_surface)
        .cornerRadius(sizing.cornerRadius)
        .padding(sizing.padding)
        .clickable(openAppAction)

    Column(modifier = rootModifier) {
        WidgetHeader(
            serverName = serverName,
            layoutType = layoutType,
            refreshAction = refreshAction,
            toggleAction = toggleAction,
            status = state.status,
            actionsEnabled = state.actionsEnabled,
            sizing = sizing,
        )

        when (layoutType) {
            WidgetLayoutType.EXTRA_LARGE,
            WidgetLayoutType.LARGE,
            -> {
                Spacer(GlanceModifier.height(sizing.headerSpacing))
                SystemStatsRow(
                    state = state,
                    includeUptime = true,
                    includeTemp = true,
                )
                Spacer(GlanceModifier.height(sizing.headerSpacing))
                LastUpdatedText(state.updatedAt, fontSize = 12.sp)
                Spacer(GlanceModifier.height(sizing.headerSpacing))
                // MetricsGrid fills remaining vertical space
                Box(modifier = GlanceModifier.fillMaxWidth().defaultWeight()) {
                    MetricsGrid(
                        layoutType = layoutType,
                        state = state,
                        sizing = sizing,
                    )
                }
            }
            WidgetLayoutType.MEDIUM -> {
                Spacer(GlanceModifier.height(sizing.headerSpacing))
                SystemStatsRow(
                    state = state,
                    includeUptime = false,
                    includeTemp = false,
                )
                Spacer(GlanceModifier.height(sizing.headerSpacing))
                LastUpdatedText(state.updatedAt, fontSize = 12.sp)
                Spacer(GlanceModifier.height(sizing.headerSpacing))
                // MetricsGrid fills remaining vertical space
                Box(modifier = GlanceModifier.fillMaxWidth().defaultWeight()) {
                    MetricsGrid(
                        layoutType = layoutType,
                        state = state,
                        sizing = sizing,
                    )
                }
            }
            WidgetLayoutType.TALL -> {
                Spacer(GlanceModifier.height(8.dp))
                Text(
                    text = context.getString(R.string.widget_percent_label),
                    style = TextStyle(
                        color = ColorProvider(R.color.widget_text_secondary),
                        fontSize = 11.sp,
                    ),
                )
                Text(
                    text = context.getString(R.string.widget_percent_format, state.percentBlocked),
                    style = TextStyle(
                        color = ColorProvider(R.color.widget_text_primary),
                        fontSize = 20.sp,
                        fontWeight = FontWeight.Bold,
                    ),
                )
                Spacer(GlanceModifier.height(8.dp))
                LastUpdatedText(state.updatedAt, fontSize = 11.sp)
            }
        }
    }
}

@Composable
private fun WidgetHeader(
    serverName: String,
    layoutType: WidgetLayoutType,
    refreshAction: Action?,
    toggleAction: Action?,
    status: WidgetStatus,
    actionsEnabled: Boolean,
    sizing: WidgetSizing,
) {
    val titleSize = if (layoutType == WidgetLayoutType.TALL) 14.sp else 16.sp
    Row(
        modifier = GlanceModifier.fillMaxWidth(),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        Text(
            text = serverName,
            // Weight keeps actions aligned to the trailing edge.
            modifier = GlanceModifier.defaultWeight(),
            maxLines = 1,
            style = TextStyle(
                color = ColorProvider(R.color.widget_text_primary),
                fontSize = titleSize,
                fontWeight = FontWeight.Bold,
            ),
        )

        if (refreshAction != null) {
            ActionIconButton(
                iconRes = R.drawable.widget_icon_refresh,
                contentDescription = LocalContext.current.getString(R.string.widget_refresh),
                backgroundColorRes = R.color.widget_action_button,
                tintColorRes = R.color.widget_text_secondary,
                action = refreshAction,
                enabled = true,
                buttonSize = sizing.buttonSize,
                iconSize = sizing.buttonIconSize,
            )
            Spacer(GlanceModifier.width(6.dp))
        }

        ActionIconButton(
            iconRes = WidgetTheme.toggleIcon(status, actionsEnabled),
            contentDescription = LocalContext.current.getString(R.string.widget_toggle),
            backgroundColorRes = WidgetTheme.toggleBackground(status, actionsEnabled),
            tintColorRes = null,
            action = toggleAction,
            enabled = actionsEnabled,
            buttonSize = sizing.buttonSize,
            iconSize = sizing.buttonIconSize,
        )
    }
}

@Composable
private fun ActionIconButton(
    iconRes: Int,
    contentDescription: String,
    backgroundColorRes: Int,
    tintColorRes: Int?,
    action: Action?,
    enabled: Boolean,
    buttonSize: Int = 36,
    iconSize: Int = 20,
) {
    var modifier = GlanceModifier
        .size(buttonSize.dp)
        .background(backgroundColorRes)
        .cornerRadius(if (buttonSize > 28) 12.dp else 10.dp)
        .padding(if (buttonSize > 28) 8.dp else 6.dp)
    if (enabled && action != null) {
        modifier = modifier.clickable(action)
    }

    Box(modifier = modifier, contentAlignment = Alignment.Center) {
        Image(
            provider = ImageProvider(iconRes),
            contentDescription = contentDescription,
            modifier = GlanceModifier.size(iconSize.dp),
            colorFilter = tintColorRes?.let { ColorFilter.tint(ColorProvider(it)) },
        )
    }
}

@Composable
private fun SystemStatsRow(
    state: WidgetState,
    includeUptime: Boolean,
    includeTemp: Boolean,
) {
    Row(verticalAlignment = Alignment.CenterVertically) {
        if (includeUptime) {
            StatItem(
                iconRes = R.drawable.widget_icon_uptime,
                contentDescription = R.string.widget_uptime,
                value = state.uptime,
            )
            Spacer(GlanceModifier.width(8.dp))
        }
        if (includeTemp) {
            StatItem(
                iconRes = R.drawable.widget_icon_temp,
                contentDescription = R.string.widget_cpu_temp,
                value = state.cpuTemp,
            )
            Spacer(GlanceModifier.width(8.dp))
        }
        StatItem(
            iconRes = R.drawable.widget_icon_cpu,
            contentDescription = R.string.widget_cpu_usage,
            value = state.cpuUsage,
        )
        Spacer(GlanceModifier.width(8.dp))
        StatItem(
            iconRes = R.drawable.widget_icon_memory,
            contentDescription = R.string.widget_memory_usage,
            value = state.memUsage,
        )
    }
}

@Composable
private fun StatItem(
    iconRes: Int,
    contentDescription: Int,
    value: String,
) {
    Row(verticalAlignment = Alignment.CenterVertically) {
        Image(
            provider = ImageProvider(iconRes),
            contentDescription = LocalContext.current.getString(contentDescription),
            modifier = GlanceModifier.size(12.dp),
            colorFilter = ColorFilter.tint(ColorProvider(R.color.widget_text_secondary)),
        )
        Spacer(GlanceModifier.width(4.dp))
        Text(
            text = value,
            style = TextStyle(
                color = ColorProvider(R.color.widget_text_secondary),
                fontSize = 11.sp,
            ),
        )
    }
}

@Composable
private fun LastUpdatedText(updatedAt: String, fontSize: TextUnit) {
    Text(
        text = LocalContext.current.getString(
            R.string.widget_last_updated_format,
            updatedAt,
        ),
        style = TextStyle(
            color = ColorProvider(R.color.widget_text_secondary),
            fontSize = fontSize,
        ),
    )
}

@Composable
private fun MetricsGrid(
    layoutType: WidgetLayoutType,
    state: WidgetState,
    sizing: WidgetSizing,
) {
    val context = LocalContext.current
    val labels = when (layoutType) {
        WidgetLayoutType.EXTRA_LARGE -> MetricLabels(
            total = context.getString(R.string.widget_total_label_long),
            blocked = context.getString(R.string.widget_blocked_label_long),
            percent = context.getString(R.string.widget_percent_label_long),
            domains = context.getString(R.string.widget_domains_label_long),
        )
        WidgetLayoutType.LARGE -> MetricLabels(
            total = context.getString(R.string.widget_total_label),
            blocked = context.getString(R.string.widget_blocked_label),
            percent = context.getString(R.string.widget_percent_label),
            domains = context.getString(R.string.widget_domains_label),
        )
        else -> MetricLabels(
            total = context.getString(R.string.widget_total_label_short),
            blocked = context.getString(R.string.widget_blocked_label_short),
            percent = context.getString(R.string.widget_percent_label_short),
            domains = context.getString(R.string.widget_domains_label_short),
        )
    }

    // Medium layout is space constrained; use compact numbers to prevent clipping.
    val compactNumbers = layoutType == WidgetLayoutType.MEDIUM
    val totalValue = if (compactNumbers) formatCompactNumber(state.totalQueries) else state.totalQueries
    val blockedValue = if (compactNumbers) formatCompactNumber(state.blockedQueries) else state.blockedQueries
    val domainsValue = if (compactNumbers) formatCompactNumber(state.domainsOnAdlists) else state.domainsOnAdlists
    val percentValue = state.percentBlocked

    // Fill remaining space and distribute rows evenly
    Column(modifier = GlanceModifier.fillMaxSize()) {
        Row(modifier = GlanceModifier.fillMaxWidth().defaultWeight()) {
            MetricCard(
                modifier = GlanceModifier.defaultWeight().fillMaxHeight(),
                iconRes = R.drawable.widget_icon_queries,
                iconDescription = context.getString(R.string.widget_total_label),
                label = labels.total,
                value = context.getString(R.string.widget_total_format, totalValue),
                backgroundColorRes = R.color.widget_card_blue,
                compact = compactNumbers,
                cornerRadius = sizing.cardCornerRadius,
                padding = sizing.cardPadding,
                labelFontSize = sizing.cardLabelFontSize,
                valueFontSize = sizing.cardValueFontSize,
                iconSize = sizing.cardIconSize,
            )
            Spacer(GlanceModifier.width(sizing.cardGap))
            MetricCard(
                modifier = GlanceModifier.defaultWeight().fillMaxHeight(),
                iconRes = R.drawable.widget_icon_blocked,
                iconDescription = context.getString(R.string.widget_blocked_label),
                label = labels.blocked,
                value = context.getString(R.string.widget_blocked_format, blockedValue),
                backgroundColorRes = R.color.widget_card_red,
                compact = compactNumbers,
                cornerRadius = sizing.cardCornerRadius,
                padding = sizing.cardPadding,
                labelFontSize = sizing.cardLabelFontSize,
                valueFontSize = sizing.cardValueFontSize,
                iconSize = sizing.cardIconSize,
            )
        }
        Spacer(GlanceModifier.height(sizing.cardGap))
        Row(modifier = GlanceModifier.fillMaxWidth().defaultWeight()) {
            MetricCard(
                modifier = GlanceModifier.defaultWeight().fillMaxHeight(),
                iconRes = R.drawable.widget_icon_percent,
                iconDescription = context.getString(R.string.widget_percent_label),
                label = labels.percent,
                value = context.getString(R.string.widget_percent_format, percentValue),
                backgroundColorRes = R.color.widget_card_orange,
                compact = compactNumbers,
                cornerRadius = sizing.cardCornerRadius,
                padding = sizing.cardPadding,
                labelFontSize = sizing.cardLabelFontSize,
                valueFontSize = sizing.cardValueFontSize,
                iconSize = sizing.cardIconSize,
            )
            Spacer(GlanceModifier.width(sizing.cardGap))
            MetricCard(
                modifier = GlanceModifier.defaultWeight().fillMaxHeight(),
                iconRes = R.drawable.widget_icon_domains,
                iconDescription = context.getString(R.string.widget_domains_label),
                label = labels.domains,
                value = context.getString(R.string.widget_domains_format, domainsValue),
                backgroundColorRes = R.color.widget_card_green,
                compact = compactNumbers,
                cornerRadius = sizing.cardCornerRadius,
                padding = sizing.cardPadding,
                labelFontSize = sizing.cardLabelFontSize,
                valueFontSize = sizing.cardValueFontSize,
                iconSize = sizing.cardIconSize,
            )
        }
    }
}

@Composable
private fun MetricCard(
    modifier: GlanceModifier,
    iconRes: Int,
    iconDescription: String,
    label: String,
    value: String,
    backgroundColorRes: Int,
    compact: Boolean,
    showLabel: Boolean = true,
    cornerRadius: androidx.compose.ui.unit.Dp = 12.dp,
    padding: androidx.compose.ui.unit.Dp = 10.dp,
    labelFontSize: androidx.compose.ui.unit.TextUnit = 12.sp,
    valueFontSize: androidx.compose.ui.unit.TextUnit = 18.sp,
    iconSize: androidx.compose.ui.unit.Dp = 12.dp,
) {
    Column(
        modifier = modifier
            .background(backgroundColorRes)
            .cornerRadius(cornerRadius)
            .padding(padding),
    ) {
        if (showLabel) {
            Row(verticalAlignment = Alignment.CenterVertically) {
                Image(
                    provider = ImageProvider(iconRes),
                    contentDescription = iconDescription,
                    modifier = GlanceModifier.size(iconSize),
                    colorFilter = ColorFilter.tint(ColorProvider(R.color.widget_text_on_card)),
                )
                Spacer(GlanceModifier.width(4.dp))
                Text(
                    text = label,
                    maxLines = if (compact) 1 else Int.MAX_VALUE,
                    style = TextStyle(
                        color = ColorProvider(R.color.widget_text_on_card),
                        fontSize = labelFontSize,
                    ),
                )
            }
        }
        Text(
            text = value,
            maxLines = if (compact) 1 else Int.MAX_VALUE,
            style = TextStyle(
                color = ColorProvider(R.color.widget_text_on_card),
                fontSize = valueFontSize,
                fontWeight = FontWeight.Bold,
            ),
        )
    }
}

private data class MetricLabels(
    val total: String,
    val blocked: String,
    val percent: String,
    val domains: String,
)

// Widget size thresholds (in dp)
private const val WIDGET_WIDTH_4_COLUMNS = 360
private const val WIDGET_WIDTH_3_COLUMNS = 210
private const val WIDGET_WIDTH_2_COLUMNS = 140

private const val WIDGET_HEIGHT_3_ROWS = 180
private const val WIDGET_HEIGHT_2_ROWS = 110

// Layout resolution thresholds
private const val LAYOUT_COLUMNS_EXTRA_LARGE = 4
private const val LAYOUT_COLUMNS_LARGE = 3
private const val LAYOUT_COLUMNS_MEDIUM = 2
private const val LAYOUT_ROWS_REQUIRED = 2

internal enum class WidgetLayoutType {
    EXTRA_LARGE,
    LARGE,
    MEDIUM,
    TALL,
}

internal fun resolveLayoutType(size: DpSize): WidgetLayoutType {
    // Keep the same thresholds as the legacy RemoteViews layout for consistency.
    val columns = estimateColumns(size.width.value.toInt())
    val rows = estimateRows(size.height.value.toInt()).coerceAtMost(LAYOUT_ROWS_REQUIRED)
    return when {
        columns >= LAYOUT_COLUMNS_EXTRA_LARGE && rows >= LAYOUT_ROWS_REQUIRED -> WidgetLayoutType.EXTRA_LARGE
        columns >= LAYOUT_COLUMNS_LARGE && rows >= LAYOUT_ROWS_REQUIRED -> WidgetLayoutType.LARGE
        columns >= LAYOUT_COLUMNS_MEDIUM && rows >= LAYOUT_ROWS_REQUIRED -> WidgetLayoutType.MEDIUM
        else -> WidgetLayoutType.TALL
    }
}

internal fun estimateColumns(sizeDp: Int): Int {
    // Align with widget_info min widths so 3x2 does not collapse to 2x2.
    return when {
        sizeDp >= WIDGET_WIDTH_4_COLUMNS -> 4
        sizeDp >= WIDGET_WIDTH_3_COLUMNS -> 3
        sizeDp >= WIDGET_WIDTH_2_COLUMNS -> 2
        else -> 1
    }
}

internal fun estimateRows(sizeDp: Int): Int {
    return when {
        sizeDp >= WIDGET_HEIGHT_3_ROWS -> 3
        sizeDp >= WIDGET_HEIGHT_2_ROWS -> 2
        else -> 1
    }
}

internal fun formatCompactNumber(value: String): String {
    val cleaned = value.replace(",", "").trim()
    val number = cleaned.toLongOrNull() ?: return value
    return formatCompactNumber(number)
}

internal fun formatCompactNumber(number: Long): String {
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
            String.format(java.util.Locale.US, "%.0f", truncated)
        } else {
            String.format(java.util.Locale.US, "%.1f", truncated)
        }
    }
    return "$formatted$unit"
}

package io.github.tsutsu3.pi_hole_client.widget.ui.compact

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
import androidx.compose.ui.unit.sp
import androidx.datastore.preferences.core.Preferences
import androidx.glance.GlanceId
import androidx.glance.GlanceModifier
import androidx.glance.Image
import androidx.glance.ImageProvider
import androidx.glance.LocalContext
import androidx.glance.LocalSize
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
import androidx.glance.background
import androidx.glance.currentState
import androidx.glance.layout.Alignment
import androidx.glance.layout.Box
import androidx.glance.layout.Column
import androidx.glance.layout.Row
import androidx.glance.layout.Spacer
import androidx.glance.layout.fillMaxHeight
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.height
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.layout.width
import androidx.glance.text.FontWeight
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import androidx.glance.state.PreferencesGlanceStateDefinition
import io.github.tsutsu3.pi_hole_client.MainActivity
import io.github.tsutsu3.pi_hole_client.R
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetTheme
import io.github.tsutsu3.pi_hole_client.widget.data.toWidgetState

/**
 * Glance widget for 2x1 compact Pi-hole display.
 *
 * Left: stats list (server name, total/blocked/percent, and optionally domains when tall enough)
 * Right: large toggleable shield icon (like ToggleGlanceWidget)
 */
class CompactGlanceWidget : GlanceAppWidget() {
    override val sizeMode: SizeMode = SizeMode.Exact
    override val stateDefinition = PreferencesGlanceStateDefinition

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            val prefs = currentState<Preferences>()
            val state = prefs.toWidgetState()
            CompactWidgetContent(state = state)
        }
    }
}

/**
 * Compact widget callback: toggles DNS blocking via [CompactWidgetProvider].
 */
class CompactToggleCallback : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters,
    ) {
        val appWidgetId = (glanceId as? AppWidgetId)?.appWidgetId ?: return
        CompactWidgetProvider.enqueueWork(
            context,
            appWidgetId,
            WidgetConstants.ACTION_TOGGLE,
        )
    }
}

@Composable
private fun CompactWidgetContent(state: WidgetState) {
    val context = LocalContext.current
    val size = LocalSize.current
    val serverName = if (state.serverName.isNotBlank()) {
        state.serverName
    } else {
        context.getString(R.string.widget_unknown_server)
    }

    val openAppAction = actionStartActivity<MainActivity>(
        actionParametersOf(WidgetTheme.ServerIdKey to state.serverId),
    )

    val toggleAction: Action = if (state.actionsEnabled) {
        actionRunCallback<CompactToggleCallback>()
    } else {
        openAppAction
    }

    // Calculate proportional sizes based on widget height
    val widgetHeight = size.height.value
    val shieldSize = (widgetHeight * 0.65f).coerceIn(48f, 72f).dp
    val iconSize = (shieldSize.value * 0.73f).dp
    val padding = (widgetHeight * 0.08f).coerceIn(6f, 12f).dp
    val cornerRadius = (widgetHeight * 0.16f).coerceIn(12f, 20f).dp
    val serverNameFontSize = (widgetHeight * 0.10f).coerceIn(12f, 16f).sp
    val statFontSize = (widgetHeight * 0.10f).coerceIn(12f, 16f).sp
    val statIconSize = (widgetHeight * 0.10f).coerceIn(12f, 16f).dp
    // Show 4 rows (including Domains) when widget is tall enough
    val showFourRows = widgetHeight >= 90f

    Row(
        modifier = GlanceModifier
            .fillMaxSize()
            .background(R.color.widget_surface)
            .cornerRadius(cornerRadius)
            .padding(padding)
            .clickable(openAppAction),
        verticalAlignment = Alignment.CenterVertically,
    ) {
        // Left: Stats column
        Column(
            modifier = GlanceModifier
                .defaultWeight()
                .fillMaxHeight(),
            verticalAlignment = Alignment.CenterVertically,
        ) {
            // Server name
            Text(
                text = serverName,
                maxLines = 1,
                style = TextStyle(
                    color = ColorProvider(R.color.widget_text_primary),
                    fontSize = serverNameFontSize,
                    fontWeight = FontWeight.Medium,
                ),
            )
            Spacer(GlanceModifier.height(4.dp))

            // Stats (compact number format with icons and colors)
            CompactStatRow(
                iconRes = R.drawable.widget_icon_queries,
                value = state.totalQueries,
                color = R.color.widget_card_blue,
                fontSize = statFontSize,
                iconSize = statIconSize,
            )
            CompactStatRow(
                iconRes = R.drawable.widget_icon_blocked,
                value = state.blockedQueries,
                color = R.color.widget_card_red,
                fontSize = statFontSize,
                iconSize = statIconSize,
            )
            CompactStatRow(
                iconRes = R.drawable.widget_icon_percent,
                value = state.percentBlocked,
                color = R.color.widget_card_orange,
                fontSize = statFontSize,
                iconSize = statIconSize,
            )
            // Show Domains row only when there's enough vertical space
            if (showFourRows) {
                CompactStatRow(
                    iconRes = R.drawable.widget_icon_domains,
                    value = state.domainsOnAdlists,
                    color = R.color.widget_card_green,
                    fontSize = statFontSize,
                    iconSize = statIconSize,
                )
            }
        }

        Spacer(GlanceModifier.width(8.dp))

        // Right: Shield icon (clickable for toggle)
        ShieldIconBox(
            status = state.status,
            actionsEnabled = state.actionsEnabled,
            toggleAction = toggleAction,
            boxSize = shieldSize,
            iconSize = iconSize,
        )
    }
}

@Composable
private fun CompactStatRow(
    iconRes: Int,
    value: String,
    color: Int,
    fontSize: androidx.compose.ui.unit.TextUnit,
    iconSize: androidx.compose.ui.unit.Dp,
) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = GlanceModifier.padding(vertical = 1.dp),
    ) {
        Image(
            provider = ImageProvider(iconRes),
            contentDescription = null,
            modifier = GlanceModifier.size(iconSize),
            colorFilter = androidx.glance.ColorFilter.tint(ColorProvider(color)),
        )
        Spacer(GlanceModifier.width(4.dp))
        Text(
            text = value,
            maxLines = 1,
            style = TextStyle(
                color = ColorProvider(color),
                fontSize = fontSize,
                fontWeight = FontWeight.Bold,
            ),
        )
    }
}

@Composable
private fun ShieldIconBox(
    status: WidgetStatus,
    actionsEnabled: Boolean,
    toggleAction: Action,
    boxSize: androidx.compose.ui.unit.Dp = 60.dp,
    iconSize: androidx.compose.ui.unit.Dp = 44.dp,
) {
    val action = if (actionsEnabled) toggleAction else null
    val cornerRadius = (boxSize.value * 0.2f).dp

    var modifier = GlanceModifier
        .size(boxSize)
        .background(WidgetTheme.toggleBackground(status, actionsEnabled))
        .cornerRadius(cornerRadius)
        .padding((boxSize.value * 0.13f).dp)

    if (action != null) {
        modifier = modifier.clickable(action)
    }

    Box(
        modifier = modifier,
        contentAlignment = Alignment.Center,
    ) {
        Image(
            provider = ImageProvider(WidgetTheme.toggleIcon(status, actionsEnabled)),
            contentDescription = LocalContext.current.getString(R.string.widget_toggle),
            modifier = GlanceModifier.size(iconSize),
        )
    }
}


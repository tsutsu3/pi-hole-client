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
 * Left: stats list (server name, total/blocked/percent/domains, timestamp)
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
        val appWidgetId = (glanceId as AppWidgetId).appWidgetId
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

    Row(
        modifier = GlanceModifier
            .fillMaxSize()
            .background(R.color.widget_surface)
            .cornerRadius(16.dp)
            .padding(8.dp)
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
                    fontSize = 12.sp,
                    fontWeight = FontWeight.Medium,
                ),
            )
            Spacer(GlanceModifier.height(4.dp))

            // Stats (compact number format with icons and colors)
            CompactStatRow(
                iconRes = R.drawable.widget_icon_queries,
                value = state.totalQueries.toString(),
                color = R.color.widget_card_blue,
            )
            CompactStatRow(
                iconRes = R.drawable.widget_icon_blocked,
                value = state.blockedQueries.toString(),
                color = R.color.widget_card_red,
            )
            CompactStatRow(
                iconRes = R.drawable.widget_icon_percent,
                value = state.percentBlocked.toString(),
                color = R.color.widget_card_orange,
            )
            CompactStatRow(
                iconRes = R.drawable.widget_icon_domains,
                value = state.domainsOnAdlists.toString(),
                color = R.color.widget_card_green,
            )

            Spacer(GlanceModifier.height(4.dp))
            // Timestamp
            Text(
                text = state.updatedAt,
                style = TextStyle(
                    color = ColorProvider(R.color.widget_text_secondary),
                    fontSize = 10.sp,
                ),
            )
        }

        Spacer(GlanceModifier.width(8.dp))

        // Right: Shield icon (clickable for toggle)
        ShieldIconBox(
            status = state.status,
            actionsEnabled = state.actionsEnabled,
            toggleAction = toggleAction,
        )
    }
}

@Composable
private fun CompactStatRow(
    iconRes: Int,
    value: String,
    color: Int,
) {
    Row(
        verticalAlignment = Alignment.CenterVertically,
        modifier = GlanceModifier.padding(vertical = 1.dp),
    ) {
        Image(
            provider = ImageProvider(iconRes),
            contentDescription = null,
            modifier = GlanceModifier.size(12.dp),
            colorFilter = androidx.glance.ColorFilter.tint(ColorProvider(color)),
        )
        Spacer(GlanceModifier.width(4.dp))
        Text(
            text = value,
            maxLines = 1,
            style = TextStyle(
                color = ColorProvider(color),
                fontSize = 12.sp,
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
) {
    val action = if (actionsEnabled) toggleAction else null

    var modifier = GlanceModifier
        .size(60.dp)
        .background(WidgetTheme.toggleBackground(status, actionsEnabled))
        .cornerRadius(12.dp)
        .padding(8.dp)

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
            modifier = GlanceModifier.size(44.dp),
        )
    }
}


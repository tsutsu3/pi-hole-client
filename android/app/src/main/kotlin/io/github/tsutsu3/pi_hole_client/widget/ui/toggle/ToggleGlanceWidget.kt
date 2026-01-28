package io.github.tsutsu3.pi_hole_client.widget.ui.toggle

import android.content.Context
import androidx.compose.runtime.Composable
import androidx.compose.ui.unit.dp
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
import androidx.glance.layout.fillMaxSize
import androidx.glance.layout.padding
import androidx.glance.layout.size
import androidx.glance.text.Text
import androidx.glance.text.TextStyle
import androidx.glance.unit.ColorProvider
import androidx.compose.ui.graphics.Color
import androidx.compose.ui.unit.sp
import androidx.glance.text.FontWeight
import androidx.glance.state.PreferencesGlanceStateDefinition
import io.github.tsutsu3.pi_hole_client.MainActivity
import io.github.tsutsu3.pi_hole_client.R
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.common.ToggleWidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetTheme
import io.github.tsutsu3.pi_hole_client.widget.data.toToggleWidgetState

/**
 * Glance widget for the 1x1 Pi-hole blocking toggle.
 *
 * Displays a colored shield icon (green = blocking ON, red = OFF) styled to
 * resemble a regular launcher icon.  A small Pi-hole client logo badge sits
 * in the bottom-end corner.
 *
 * Tap toggles blocking; long-press opens the system reconfigure menu.
 */
class ToggleGlanceWidget : GlanceAppWidget() {
    override val sizeMode: SizeMode = SizeMode.Exact

    override val stateDefinition = PreferencesGlanceStateDefinition

    override suspend fun provideGlance(context: Context, id: GlanceId) {
        provideContent {
            val prefs = currentState<Preferences>()
            val state = prefs.toToggleWidgetState()
            ToggleWidgetContent(state = state)
        }
    }
}

/**
 * Toggle widget callback: toggles DNS blocking via [ToggleWidgetProvider].
 */
class ToggleToggleCallback : ActionCallback {
    override suspend fun onAction(
        context: Context,
        glanceId: GlanceId,
        parameters: ActionParameters,
    ) {
        val appWidgetId = (glanceId as AppWidgetId).appWidgetId
        ToggleWidgetProvider.enqueueWork(
            context,
            appWidgetId,
            WidgetConstants.ACTION_TOGGLE,
        )
    }
}

@Composable
private fun ToggleWidgetContent(state: ToggleWidgetState) {
    val context = LocalContext.current
    val size = LocalSize.current

    val openAppAction: Action = actionStartActivity<MainActivity>(
        actionParametersOf(WidgetTheme.ServerIdKey to state.serverId),
    )

    val toggleAction: Action = if (state.actionsEnabled) {
        actionRunCallback<ToggleToggleCallback>()
    } else {
        openAppAction
    }

    val label = state.serverName.ifEmpty { "Pi-hole" }

    // Calculate proportional sizes based on the smaller dimension (typically width for 1x1)
    val minDimension = minOf(size.width.value, size.height.value)
    val outerBoxSize = (minDimension * 0.75f).coerceIn(56f, 80f).dp
    val circleSize = (outerBoxSize.value * 0.88f).dp
    val iconSize = (circleSize.value * 0.73f).dp
    val badgeSize = (outerBoxSize.value * 0.35f).coerceIn(20f, 28f).dp
    val labelFontSize = (minDimension * 0.15f).coerceIn(12f, 20f).sp

    // Vertical layout: circular icon + text label below
    Column(
        modifier = GlanceModifier
            .fillMaxSize()
            .padding(2.dp),
        horizontalAlignment = Alignment.CenterHorizontally,
        verticalAlignment = Alignment.CenterVertically,
    ) {
        // Outer box: holds circular icon + badge overlay (badge outside circle)
        Box(
            modifier = GlanceModifier.size(outerBoxSize),
            contentAlignment = Alignment.Center,
        ) {
            // Circular icon container (clickable here to avoid black rectangle ripple)
            Box(
                modifier = GlanceModifier
                    .size(circleSize)
                    .background(WidgetTheme.toggleBackground(state.status, state.actionsEnabled))
                    .cornerRadius(circleSize / 2)
                    .clickable(toggleAction),
                contentAlignment = Alignment.Center,
            ) {
                // Shield icon (2dp upward via bottom padding)
                Image(
                    provider = ImageProvider(WidgetTheme.toggleIcon(state.status, state.actionsEnabled)),
                    contentDescription = context.getString(R.string.widget_toggle),
                    modifier = GlanceModifier
                        .size(iconSize)
                        .padding(bottom = 2.dp),
                )
            }

            // Pi-hole client logo badge (positioned on outer box, not clipped by circle)
            Box(
                modifier = GlanceModifier.fillMaxSize(),
                contentAlignment = Alignment.BottomEnd,
            ) {
                Image(
                    provider = ImageProvider(R.mipmap.ic_launcher),
                    contentDescription = null,
                    modifier = GlanceModifier.size(badgeSize),
                )
            }
        }

        // Text label with shadow effect
        Box(
            modifier = GlanceModifier.padding(top = 2.dp),
            contentAlignment = Alignment.Center,
        ) {
            // Shadow layer (dark, slightly offset down)
            Text(
                text = label,
                style = TextStyle(
                    fontSize = labelFontSize,
                    fontWeight = FontWeight.Medium,
                    color = ColorProvider(Color(0x80000000)),
                ),
                modifier = GlanceModifier.padding(top = 1.dp),
                maxLines = 1,
            )
            // Foreground layer (white)
            Text(
                text = label,
                style = TextStyle(
                    fontSize = labelFontSize,
                    fontWeight = FontWeight.Medium,
                    color = ColorProvider(R.color.widget_toggle_text),
                ),
                maxLines = 1,
            )
        }
    }
}

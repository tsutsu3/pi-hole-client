package io.github.tsutsu3.pi_hole_client.widget.common

import androidx.glance.action.ActionParameters
import io.github.tsutsu3.pi_hole_client.R

/**
 * Shared visual mappings for widget toggle controls.
 *
 * Centralises the status-to-resource resolution so all three widget types
 * (stats, compact, toggle) render a consistent shield icon and background color.
 */
object WidgetTheme {

    /**
     * Action parameter key shared by all widget callbacks to identify the server
     * associated with the current widget instance.
     */
    val ServerIdKey = ActionParameters.Key<String>("serverId")

    /**
     * Returns the background color resource for the toggle button.
     *
     * Disabled widgets always use a neutral grey regardless of blocking status,
     * because a disabled widget cannot respond to taps.
     */
    fun toggleBackground(status: WidgetStatus, enabled: Boolean): Int {
        if (!enabled) {
            return R.color.widget_action_button_disabled
        }
        return when (status) {
            WidgetStatus.BLOCKING_ON -> R.color.widget_action_button_on
            WidgetStatus.BLOCKING_OFF -> R.color.widget_action_button_off
            WidgetStatus.AUTH_REQUIRED -> R.color.widget_action_button_disabled
            WidgetStatus.ERROR -> R.color.widget_action_button_disabled
        }
    }

    /**
     * Returns the shield icon drawable resource based on blocking status.
     *
     * The icon conveys a clear visual distinction between on/off/error states
     * so the user can assess status at a glance without reading text.
     */
    fun toggleIcon(status: WidgetStatus, enabled: Boolean): Int {
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
}

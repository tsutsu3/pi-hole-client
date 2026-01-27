package io.github.tsutsu3.pi_hole_client.widget.data

import androidx.datastore.preferences.core.MutablePreferences
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import io.github.tsutsu3.pi_hole_client.widget.common.ToggleWidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.parseWidgetStatus

/**
 * Preference keys for per-widget Glance state of the toggle widget.
 */
internal object ToggleGlanceStateKeys {
    val serverId = stringPreferencesKey("toggle_server_id")
    val serverName = stringPreferencesKey("toggle_server_name")
    val status = stringPreferencesKey("toggle_status")
    val actionsEnabled = booleanPreferencesKey("toggle_actions_enabled")
}

/**
 * Build a [ToggleWidgetState] from stored preferences, applying safe fallbacks.
 */
internal fun Preferences.toToggleWidgetState(): ToggleWidgetState {
    return ToggleWidgetState(
        serverId = this[ToggleGlanceStateKeys.serverId].orEmpty(),
        serverName = this[ToggleGlanceStateKeys.serverName].orEmpty(),
        status = parseWidgetStatus(this[ToggleGlanceStateKeys.status]),
        actionsEnabled = this[ToggleGlanceStateKeys.actionsEnabled] ?: false,
    )
}

/**
 * Persist a [ToggleWidgetState] into preferences for Glance to render.
 */
internal fun MutablePreferences.updateFromToggle(state: ToggleWidgetState) {
    this[ToggleGlanceStateKeys.serverId] = state.serverId
    this[ToggleGlanceStateKeys.serverName] = state.serverName
    this[ToggleGlanceStateKeys.status] = state.status.name
    this[ToggleGlanceStateKeys.actionsEnabled] = state.actionsEnabled
}

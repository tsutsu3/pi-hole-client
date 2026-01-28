package io.github.tsutsu3.pi_hole_client.widget.data

import androidx.datastore.preferences.core.MutablePreferences
import androidx.datastore.preferences.core.Preferences
import androidx.datastore.preferences.core.booleanPreferencesKey
import androidx.datastore.preferences.core.stringPreferencesKey
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetState
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.common.parseWidgetStatus

// Widget text placeholders stay consistent across layouts.
private const val DEFAULT_TEXT = "--"

/**
 * Preference keys for per-widget Glance state.
 */
internal object WidgetGlanceStateKeys {
    val serverId = stringPreferencesKey("server_id")
    val serverName = stringPreferencesKey("server_name")
    val status = stringPreferencesKey("status")
    val totalQueries = stringPreferencesKey("total_queries")
    val blockedQueries = stringPreferencesKey("blocked_queries")
    val percentBlocked = stringPreferencesKey("percent_blocked")
    val domainsOnAdlists = stringPreferencesKey("domains_on_adlists")
    val uptime = stringPreferencesKey("uptime")
    val cpuTemp = stringPreferencesKey("cpu_temp")
    val cpuUsage = stringPreferencesKey("cpu_usage")
    val memUsage = stringPreferencesKey("mem_usage")
    val updatedAt = stringPreferencesKey("updated_at")
    val actionsEnabled = booleanPreferencesKey("actions_enabled")
}

/**
 * Build a WidgetState from stored preferences, applying safe fallbacks.
 */
internal fun Preferences.toWidgetState(): WidgetState {
    return WidgetState(
        serverId = this[WidgetGlanceStateKeys.serverId].orEmpty(),
        serverName = this[WidgetGlanceStateKeys.serverName].orEmpty(),
        status = parseWidgetStatus(this[WidgetGlanceStateKeys.status]),
        totalQueries = this[WidgetGlanceStateKeys.totalQueries] ?: DEFAULT_TEXT,
        blockedQueries = this[WidgetGlanceStateKeys.blockedQueries] ?: DEFAULT_TEXT,
        percentBlocked = this[WidgetGlanceStateKeys.percentBlocked] ?: DEFAULT_TEXT,
        domainsOnAdlists = this[WidgetGlanceStateKeys.domainsOnAdlists] ?: DEFAULT_TEXT,
        uptime = this[WidgetGlanceStateKeys.uptime] ?: DEFAULT_TEXT,
        cpuTemp = this[WidgetGlanceStateKeys.cpuTemp] ?: DEFAULT_TEXT,
        cpuUsage = this[WidgetGlanceStateKeys.cpuUsage] ?: DEFAULT_TEXT,
        memUsage = this[WidgetGlanceStateKeys.memUsage] ?: DEFAULT_TEXT,
        updatedAt = this[WidgetGlanceStateKeys.updatedAt] ?: DEFAULT_TEXT,
        actionsEnabled = this[WidgetGlanceStateKeys.actionsEnabled] ?: false,
    )
}

/**
 * Persist a WidgetState into preferences for Glance to render.
 */
internal fun MutablePreferences.updateFrom(state: WidgetState) {
    this[WidgetGlanceStateKeys.serverId] = state.serverId
    this[WidgetGlanceStateKeys.serverName] = state.serverName
    this[WidgetGlanceStateKeys.status] = state.status.name
    this[WidgetGlanceStateKeys.totalQueries] = state.totalQueries
    this[WidgetGlanceStateKeys.blockedQueries] = state.blockedQueries
    this[WidgetGlanceStateKeys.percentBlocked] = state.percentBlocked
    this[WidgetGlanceStateKeys.domainsOnAdlists] = state.domainsOnAdlists
    this[WidgetGlanceStateKeys.uptime] = state.uptime
    this[WidgetGlanceStateKeys.cpuTemp] = state.cpuTemp
    this[WidgetGlanceStateKeys.cpuUsage] = state.cpuUsage
    this[WidgetGlanceStateKeys.memUsage] = state.memUsage
    this[WidgetGlanceStateKeys.updatedAt] = state.updatedAt
    this[WidgetGlanceStateKeys.actionsEnabled] = state.actionsEnabled
}


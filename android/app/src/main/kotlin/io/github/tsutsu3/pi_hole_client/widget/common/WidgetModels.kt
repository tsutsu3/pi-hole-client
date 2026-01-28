package io.github.tsutsu3.pi_hole_client.widget.common

/**
 * Widget status derived from Pi-hole blocking and auth state.
 *
 * - [BLOCKING_ON]: Pi-hole is actively filtering DNS queries.
 * - [BLOCKING_OFF]: Filtering is paused; all queries pass through.
 * - [BLOCKING_FAILURE]: Pi-hole reported that the blocking subsystem failed
 *   (e.g. DNS not available). The server **is** reachable but blocking is not active.
 * - [AUTH_REQUIRED]: The cached SID is expired or missing; the user must open the app.
 * - [ERROR]: Communication with the Pi-hole server failed or returned unexpected data.
 */
enum class WidgetStatus {
    BLOCKING_ON,
    BLOCKING_OFF,
    BLOCKING_FAILURE,
    AUTH_REQUIRED,
    ERROR,
}

/**
 * Immutable view-state for the full stats and compact widgets.
 *
 * All metric values are pre-formatted strings (e.g. "1,234") so the
 * Glance composable layer does not need formatting logic.
 *
 * @property serverId Identifier written by Flutter's server list and persisted via [WidgetPrefs].
 * @property serverName Human-readable alias from Flutter's server config; displayed as the widget title.
 * @property status Derived from the Pi-hole `/api/padd` response or set to an error/auth sentinel by the worker.
 * @property actionsEnabled `false` when the SID is invalid or missing, because the widget
 *   cannot re-authenticate -- Flutter owns the auth lifecycle.
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
 * Minimal view-state for the 1x1 toggle widget.
 *
 * Unlike the full [WidgetState], this only tracks blocking status and server
 * identity -- no query counts, system stats, or timestamps -- to keep the
 * toggle worker lightweight.
 *
 * @property serverId Identifier written by Flutter's server list and persisted via [WidgetPrefs].
 * @property serverName Human-readable alias from Flutter's server config; shown as tooltip/label.
 * @property status Derived from the Pi-hole `/api/dns/blocking` response or set to an error/auth sentinel.
 * @property actionsEnabled `false` when the SID is invalid or missing, because the widget
 *   cannot re-authenticate -- Flutter owns the auth lifecycle.
 */
data class ToggleWidgetState(
    val serverId: String,
    val serverName: String,
    val status: WidgetStatus,
    val actionsEnabled: Boolean,
)

/**
 * Restores a [WidgetStatus] from its serialised [WidgetStatus.name] string.
 *
 * Defaults to [WidgetStatus.ERROR] for unknown values to avoid showing a
 * misleading healthy state when data is corrupt or missing.
 */
fun parseWidgetStatus(raw: String?): WidgetStatus {
    return WidgetStatus.entries.find { it.name == raw } ?: WidgetStatus.ERROR
}

/**
 * Converts the Pi-hole API blocking field into a [WidgetStatus].
 *
 * Pi-hole v6 may return `"failure"` when the blocking subsystem cannot
 * initialise (e.g. DNS service unavailable on Azure App Service). This is
 * distinct from a widget communication error; the server **is** reachable.
 */
fun parseBlockingStatus(value: String): WidgetStatus = when (value) {
    "enabled" -> WidgetStatus.BLOCKING_ON
    "disabled" -> WidgetStatus.BLOCKING_OFF
    "failure" -> WidgetStatus.BLOCKING_FAILURE
    else -> WidgetStatus.ERROR
}

package io.github.tsutsu3.pi_hole_client.widget

/**
 * Shared keys and intent actions for the Home Widget flow.
 *
 * This keeps widget storage and broadcast wiring stable across the provider,
 * worker, and Flutter hand-off points.
 */
object WidgetConstants {
    const val PREFS_NAME = "pihole_widget_prefs"

    const val KEY_ACTIVE_SERVER_PREFIX = "active_server_id_widget_"
    const val KEY_SID_PREFIX = "sid_"
    const val KEY_SID_VALID_PREFIX = "sid_valid_"
    const val KEY_SERVER_ALIAS_PREFIX = "server_alias_"
    const val KEY_SERVER_ADDRESS_PREFIX = "server_address_"
    const val KEY_SERVER_API_VERSION_PREFIX = "server_api_version_"
    const val KEY_SERVER_ALLOW_SELF_SIGNED_PREFIX = "server_allow_self_signed_"
    const val KEY_SERVER_IGNORE_CERT_ERRORS_PREFIX = "server_ignore_cert_errors_"
    const val KEY_SERVER_PINNED_CERT_SHA256_PREFIX = "server_pinned_cert_sha256_"
    const val KEY_SERVERS_JSON = "servers_json"

    const val EXTRA_ACTION = "extra_action"

    const val ACTION_REFRESH = "io.github.tsutsu3.pi_hole_client.widget.REFRESH"
    const val ACTION_TOGGLE = "io.github.tsutsu3.pi_hole_client.widget.TOGGLE"
}

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
    const val KEY_SERVERS_JSON = "servers_json"

    const val EXTRA_APP_WIDGET_ID = "extra_app_widget_id"
    const val EXTRA_ACTION = "extra_action"

    const val ACTION_REFRESH = "io.github.tsutsu3.pi_hole_client.widget.REFRESH"
    const val ACTION_TOGGLE = "io.github.tsutsu3.pi_hole_client.widget.TOGGLE"
    const val ACTION_OPEN_APP = "io.github.tsutsu3.pi_hole_client.widget.OPEN_APP"
    const val ACTION_CONFIGURE = "io.github.tsutsu3.pi_hole_client.widget.CONFIGURE"
}

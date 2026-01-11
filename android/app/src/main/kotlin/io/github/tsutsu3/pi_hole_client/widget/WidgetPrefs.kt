package io.github.tsutsu3.pi_hole_client.widget

import android.content.Context
import android.content.SharedPreferences
import org.json.JSONArray
import org.json.JSONObject

/**
 * Snapshot of a server entry as stored for widget use.
 *
 * Flutter owns the authoritative server list and writes it into shared prefs;
 * the widget only reads these values to avoid duplicating auth or server logic.
 */
data class WidgetServer(
    val serverId: String,
    val alias: String,
    val address: String,
    val apiVersion: String,
    val allowSelfSignedCert: Boolean,
)

/**
 * SharedPreferences wrapper for widget-only state.
 *
 * The widget process reads cached server metadata and SID values written by
 * Flutter, and never performs account or credential management itself.
 */
class WidgetPrefs(context: Context) {
    private val prefs: SharedPreferences =
        context.getSharedPreferences(WidgetConstants.PREFS_NAME, Context.MODE_PRIVATE)

    /**
     * Persist the selected server id for a specific widget instance.
     */
    fun setServerForWidget(widgetId: Int, serverId: String) {
        prefs.edit().putString(keyForWidget(widgetId), serverId).apply()
    }

    /**
     * Returns the selected server id for a widget instance, if any.
     */
    fun getServerForWidget(widgetId: Int): String? {
        return prefs.getString(keyForWidget(widgetId), null)
    }

    /**
     * Clears widget selection when the instance is removed.
     */
    fun clearWidget(widgetId: Int) {
        prefs.edit().remove(keyForWidget(widgetId)).apply()
    }

    /**
     * Stores SID received from Flutter-authenticated sessions.
     */
    fun saveSid(serverId: String, sid: String) {
        prefs.edit().putString(keyForSid(serverId), sid).apply()
    }

    /**
     * Returns SID cached by Flutter, if present.
     */
    fun getSid(serverId: String): String? {
        return prefs.getString(keyForSid(serverId), null)
    }

    /**
     * Tracks SID validity after widget-side API calls detect auth failures.
     */
    fun setSidValid(serverId: String, valid: Boolean) {
        prefs.edit().putBoolean(keyForSidValid(serverId), valid).apply()
    }

    /**
     * Returns whether the cached SID is still considered valid.
     */
    fun isSidValid(serverId: String): Boolean {
        return prefs.getBoolean(keyForSidValid(serverId), false)
    }

    /**
     * Saves server metadata exported by Flutter for widget display and selection.
     */
    fun saveServers(servers: List<WidgetServer>) {
        val jsonArray = JSONArray()
        servers.forEach { server ->
            val obj = JSONObject()
            obj.put("serverId", server.serverId)
            obj.put("alias", server.alias)
            obj.put("address", server.address)
            obj.put("apiVersion", server.apiVersion)
            obj.put("allowSelfSignedCert", server.allowSelfSignedCert)
            jsonArray.put(obj)
        }
        prefs.edit().putString(WidgetConstants.KEY_SERVERS_JSON, jsonArray.toString()).apply()
        servers.forEach { server ->
            // Store denormalized fields for quick per-server lookups.
            prefs.edit()
                .putString(keyForAlias(server.serverId), server.alias)
                .putString(keyForAddress(server.serverId), server.address)
                .putString(keyForApiVersion(server.serverId), server.apiVersion)
                .putBoolean(keyForAllowSelfSigned(server.serverId), server.allowSelfSignedCert)
                .apply()
        }
    }

    /**
     * Removes all cached data for a deleted server entry.
     */
    fun removeServer(serverId: String) {
        prefs.edit()
            .remove(keyForSid(serverId))
            .remove(keyForSidValid(serverId))
            .remove(keyForAlias(serverId))
            .remove(keyForAddress(serverId))
            .remove(keyForApiVersion(serverId))
            .remove(keyForAllowSelfSigned(serverId))
            .apply()
    }

    /**
     * Returns the cached server list for widget configuration UI.
     */
    fun getServers(): List<WidgetServer> {
        val raw = prefs.getString(WidgetConstants.KEY_SERVERS_JSON, null) ?: return emptyList()
        val list = mutableListOf<WidgetServer>()
        val array = JSONArray(raw)
        for (i in 0 until array.length()) {
            val obj = array.getJSONObject(i)
            list.add(
                WidgetServer(
                    serverId = obj.optString("serverId"),
                    alias = obj.optString("alias"),
                    address = obj.optString("address"),
                    apiVersion = obj.optString("apiVersion"),
                    allowSelfSignedCert = obj.optBoolean("allowSelfSignedCert", false),
                ),
            )
        }
        return list
    }

    /**
     * Returns a single server entry from cached fields.
     */
    fun getServerInfo(serverId: String): WidgetServer? {
        val alias = prefs.getString(keyForAlias(serverId), null) ?: return null
        val address = prefs.getString(keyForAddress(serverId), null) ?: return null
        val apiVersion = prefs.getString(keyForApiVersion(serverId), "v6") ?: "v6"
        val allowSelfSigned = prefs.getBoolean(keyForAllowSelfSigned(serverId), false)
        return WidgetServer(
            serverId = serverId,
            alias = alias,
            address = address,
            apiVersion = apiVersion,
            allowSelfSignedCert = allowSelfSigned,
        )
    }

    /**
     * Filters widget ids that are bound to the given server id.
     */
    fun getWidgetIdsForServer(appWidgetIds: IntArray, serverId: String): IntArray {
        return appWidgetIds.filter { widgetId ->
            getServerForWidget(widgetId) == serverId
        }.toIntArray()
    }

    private fun keyForWidget(widgetId: Int) =
        "${WidgetConstants.KEY_ACTIVE_SERVER_PREFIX}$widgetId"

    private fun keyForSid(serverId: String) = "${WidgetConstants.KEY_SID_PREFIX}$serverId"

    private fun keyForSidValid(serverId: String) =
        "${WidgetConstants.KEY_SID_VALID_PREFIX}$serverId"

    private fun keyForAlias(serverId: String) =
        "${WidgetConstants.KEY_SERVER_ALIAS_PREFIX}$serverId"

    private fun keyForAddress(serverId: String) =
        "${WidgetConstants.KEY_SERVER_ADDRESS_PREFIX}$serverId"

    private fun keyForApiVersion(serverId: String) =
        "${WidgetConstants.KEY_SERVER_API_VERSION_PREFIX}$serverId"

    private fun keyForAllowSelfSigned(serverId: String) =
        "${WidgetConstants.KEY_SERVER_ALLOW_SELF_SIGNED_PREFIX}$serverId"
}

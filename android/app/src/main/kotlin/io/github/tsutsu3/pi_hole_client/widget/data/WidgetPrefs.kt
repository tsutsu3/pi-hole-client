package io.github.tsutsu3.pi_hole_client.widget.data

import android.content.Context
import android.content.SharedPreferences
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
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
    val ignoreCertificateErrors: Boolean,
    val pinnedCertificateSha256: String?,
)

/**
 * SharedPreferences wrapper for widget-only state.
 *
 * The widget process reads cached server metadata and SID values written by
 * Flutter, and never performs account or credential management itself.
 *
 * Security note:
 * - SID values are treated as sensitive session tokens.
 * - This wrapper prefers `EncryptedSharedPreferences` when available and falls back to
 *   regular `SharedPreferences` only if encryption cannot be initialized on the device.
 * - A one-time migration copies legacy plaintext values into the encrypted store and
 *   clears the legacy file to reduce exposure on disk.
 *
 * Performance note:
 * - This class uses a singleton pattern to avoid repeatedly initializing
 *   EncryptedSharedPreferences and MasterKey (50-200ms on Samsung/Knox devices).
 * - Call [getInstance] instead of the constructor.
 */
class WidgetPrefs private constructor(context: Context) {
    private val prefs: SharedPreferences = run {
        val encrypted = buildEncryptedPrefs(context)
        if (encrypted != null) {
            migrateLegacyPrefsIfNeeded(context, encrypted)
            encrypted
        } else {
            context.getSharedPreferences(WidgetConstants.PREFS_NAME, Context.MODE_PRIVATE)
        }
    }

    companion object {
        @Volatile
        private var instance: WidgetPrefs? = null

        /**
         * Returns the singleton instance of WidgetPrefs.
         *
         * Thread-safe with double-checked locking. Uses applicationContext to
         * avoid memory leaks.
         */
        fun getInstance(context: Context): WidgetPrefs {
            return instance ?: synchronized(this) {
                instance ?: WidgetPrefs(context.applicationContext).also { instance = it }
            }
        }
    }

    /**
     * Builds encrypted preferences storage for widget state.
     *
     * Returns `null` when encryption cannot be initialized (e.g. platform/provider issues),
     * in which case the caller must fall back to regular SharedPreferences.
     */
    private fun buildEncryptedPrefs(context: Context): SharedPreferences? {
        return try {
            val masterKey = MasterKey.Builder(context)
                .setKeyScheme(MasterKey.KeyScheme.AES256_GCM)
                .build()
            EncryptedSharedPreferences.create(
                context,
                "${WidgetConstants.PREFS_NAME}_encrypted",
                masterKey,
                EncryptedSharedPreferences.PrefKeyEncryptionScheme.AES256_SIV,
                EncryptedSharedPreferences.PrefValueEncryptionScheme.AES256_GCM,
            )
        } catch (_: Exception) {
            null
        }
    }

    /**
     * Migrates legacy plaintext widget prefs into the encrypted store (one-time).
     *
     * This reduces the chance of session tokens being left on disk unencrypted after upgrade.
     */
    private fun migrateLegacyPrefsIfNeeded(context: Context, encryptedPrefs: SharedPreferences) {
        val markerKey = "__migrated_v1"
        if (encryptedPrefs.getBoolean(markerKey, false)) return

        val legacyPrefs = context.getSharedPreferences(WidgetConstants.PREFS_NAME, Context.MODE_PRIVATE)
        val legacyAll = legacyPrefs.all

        val editor = encryptedPrefs.edit()
        legacyAll.forEach { (key, value) ->
            when (value) {
                is String -> editor.putString(key, value)
                is Boolean -> editor.putBoolean(key, value)
                is Int -> editor.putInt(key, value)
                is Long -> editor.putLong(key, value)
                is Float -> editor.putFloat(key, value)
                is Set<*> -> {
                    @Suppress("UNCHECKED_CAST")
                    editor.putStringSet(key, value as Set<String>)
                }
            }
        }
        editor.putBoolean(markerKey, true)
        editor.apply()

        if (legacyAll.isNotEmpty()) {
            legacyPrefs.edit().clear().apply()
        }
    }

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
            obj.put("ignoreCertificateErrors", server.ignoreCertificateErrors)
            if (server.pinnedCertificateSha256 != null) {
                obj.put("pinnedCertificateSha256", server.pinnedCertificateSha256)
            }
            jsonArray.put(obj)
        }
        val editor = prefs.edit()
        editor.putString(WidgetConstants.KEY_SERVERS_JSON, jsonArray.toString())
        servers.forEach { server ->
            // Store denormalized fields for quick per-server lookups.
            editor
                .putString(keyForAlias(server.serverId), server.alias)
                .putString(keyForAddress(server.serverId), server.address)
                .putString(keyForApiVersion(server.serverId), server.apiVersion)
                .putBoolean(keyForAllowSelfSigned(server.serverId), server.allowSelfSignedCert)
                .putBoolean(keyForIgnoreCertErrors(server.serverId), server.ignoreCertificateErrors)
            if (server.pinnedCertificateSha256 != null) {
                editor.putString(keyForPinnedCertSha256(server.serverId), server.pinnedCertificateSha256)
            } else {
                editor.remove(keyForPinnedCertSha256(server.serverId))
            }
        }
        editor.apply()
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
            .remove(keyForIgnoreCertErrors(serverId))
            .remove(keyForPinnedCertSha256(serverId))
            .apply()
    }

    /**
     * Returns the cached server list for widget configuration UI.
     */
    fun getServers(): List<WidgetServer> {
        val raw = prefs.getString(WidgetConstants.KEY_SERVERS_JSON, null) ?: return emptyList()
        return try {
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
                        ignoreCertificateErrors = obj.optBoolean("ignoreCertificateErrors", false),
                        pinnedCertificateSha256 = obj.optString("pinnedCertificateSha256").ifEmpty { null },
                    ),
                )
            }
            list
        } catch (e: org.json.JSONException) {
            android.util.Log.w("WidgetPrefs", "Invalid JSON in getServers: ${e.message}, raw=$raw")
            emptyList()
        }
    }

    /**
     * Returns a single server entry from cached fields.
     */
    fun getServerInfo(serverId: String): WidgetServer? {
        val alias = prefs.getString(keyForAlias(serverId), null) ?: return null
        val address = prefs.getString(keyForAddress(serverId), null) ?: return null
        val apiVersion = prefs.getString(keyForApiVersion(serverId), "v6") ?: "v6"
        val allowSelfSigned = prefs.getBoolean(keyForAllowSelfSigned(serverId), false)
        val ignoreCertErrors = prefs.getBoolean(keyForIgnoreCertErrors(serverId), false)
        val pinnedCertSha256 = prefs.getString(keyForPinnedCertSha256(serverId), null)
        return WidgetServer(
            serverId = serverId,
            alias = alias,
            address = address,
            apiVersion = apiVersion,
            allowSelfSignedCert = allowSelfSigned,
            ignoreCertificateErrors = ignoreCertErrors,
            pinnedCertificateSha256 = pinnedCertSha256,
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

    private fun keyForIgnoreCertErrors(serverId: String) =
        "${WidgetConstants.KEY_SERVER_IGNORE_CERT_ERRORS_PREFIX}$serverId"

    private fun keyForPinnedCertSha256(serverId: String) =
        "${WidgetConstants.KEY_SERVER_PINNED_CERT_SHA256_PREFIX}$serverId"
}

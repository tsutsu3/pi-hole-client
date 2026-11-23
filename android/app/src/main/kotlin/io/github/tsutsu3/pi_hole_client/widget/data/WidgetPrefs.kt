package io.github.tsutsu3.pi_hole_client.widget.data

import android.appwidget.AppWidgetManager
import android.content.ComponentName
import android.content.Context
import android.content.SharedPreferences
import android.util.Log
import androidx.annotation.VisibleForTesting
import androidx.security.crypto.EncryptedSharedPreferences
import androidx.security.crypto.MasterKey
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetDebugConfig
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.ui.compact.CompactWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.stats.PiHoleWidgetProvider
import io.github.tsutsu3.pi_hole_client.widget.ui.toggle.ToggleWidgetProvider
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
    val allowUntrustedCert: Boolean,
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
        private const val TAG = "WidgetPrefs"

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

        /** Drops the cached singleton so each test starts from a clean store. */
        @VisibleForTesting
        internal fun clearInstanceForTest() {
            synchronized(this) { instance = null }
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
        } catch (e: Exception) {
            // Log encryption failure in debug builds for troubleshooting.
            // Falls back to unencrypted storage - not ideal but ensures widget functionality.
            if (WidgetDebugConfig.DEBUG) {
                Log.w(TAG, "Failed to initialize encrypted prefs: ${e.javaClass.simpleName}")
            }
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
     * How long a disable from a widget lasts, in seconds; 0 = indefinitely.
     * Set in the app (Advanced settings > Disable timers).
     */
    var widgetDisableDuration: Long
        get() = prefs.getLong(WidgetConstants.KEY_WIDGET_DISABLE_DURATION, 0L).coerceAtLeast(0L)
        set(value) {
            prefs.edit().putLong(WidgetConstants.KEY_WIDGET_DISABLE_DURATION, value.coerceAtLeast(0L)).apply()
        }

    /**
     * Disable limit: Pi-hole can be disabled at most once in this many
     * seconds (0 = no limit). Applies to the app and the widgets.
     */
    var disableCooldown: Long
        get() = prefs.getLong(WidgetConstants.KEY_DISABLE_COOLDOWN, 0L).coerceAtLeast(0L)
        set(value) {
            prefs.edit().putLong(WidgetConstants.KEY_DISABLE_COOLDOWN, value.coerceAtLeast(0L)).apply()
        }

    /** Records that Pi-hole on [serverId] was just disabled (app or widget). */
    fun recordDisable(serverId: String, nowMs: Long = System.currentTimeMillis()) {
        prefs.edit().putLong("${WidgetConstants.KEY_LAST_DISABLE_AT_PREFIX}$serverId", nowMs).apply()
    }

    /** Milliseconds before Pi-hole on [serverId] can be disabled again; 0 when allowed. */
    fun disableCooldownRemainingMs(serverId: String, nowMs: Long = System.currentTimeMillis()): Long {
        val cooldownMs = disableCooldown * 1000L
        val last = prefs.getLong("${WidgetConstants.KEY_LAST_DISABLE_AT_PREFIX}$serverId", 0L)
        if (cooldownMs == 0L || last <= 0L) return 0L
        val elapsed = (nowMs - last).coerceAtLeast(0L)
        return (cooldownMs - elapsed).coerceAtLeast(0L)
    }

    /**
     * Remembers the last blocking status shown by the widgets, so a tap can
     * be checked against the disable limit without asking Pi-hole first
     * (also when it can't be reached). Errors keep the previous value.
     */
    fun rememberBlockingStatus(serverId: String, status: WidgetStatus) {
        val enabled = when (status) {
            WidgetStatus.BLOCKING_ON -> true
            WidgetStatus.BLOCKING_OFF -> false
            else -> return
        }
        prefs.edit().putBoolean("${WidgetConstants.KEY_LAST_BLOCKING_ENABLED_PREFIX}$serverId", enabled).apply()
    }

    /** Last known blocking status: true = enabled, false = disabled, null = unknown. */
    fun lastKnownBlockingEnabled(serverId: String): Boolean? {
        val key = "${WidgetConstants.KEY_LAST_BLOCKING_ENABLED_PREFIX}$serverId"
        return if (prefs.contains(key)) prefs.getBoolean(key, true) else null
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
     * Stores a fresh SID pushed by Flutter and marks it valid, atomically with
     * respect to [invalidateSidIfCurrent].
     */
    @Synchronized
    fun updateSession(serverId: String, sid: String) {
        prefs.edit()
            .putString(keyForSid(serverId), sid)
            .putBoolean(keyForSidValid(serverId), true)
            .apply()
    }

    /**
     * Marks the SID invalid only if it is still [usedSid], the one a worker
     * sent to Pi-hole and got an auth failure for.
     *
     * Without this check a worker still running with an expired SID could mark
     * invalid the new SID the app pushed in the meantime, leaving the widgets
     * stuck on "authentication required" until the app renews the session again.
     *
     * @return `true` if the SID was invalidated. `false` if the stored SID
     *   changed meanwhile (a new SID or a removed server). Whoever changed it
     *   already queued a refresh, so the caller just stops.
     */
    @Synchronized
    fun invalidateSidIfCurrent(serverId: String, usedSid: String?): Boolean {
        if (getSid(serverId) != usedSid) return false
        setSidValid(serverId, false)
        return true
    }

    /**
     * Returns whether the cached SID is still considered valid.
     */
    fun isSidValid(serverId: String): Boolean {
        return prefs.getBoolean(keyForSidValid(serverId), false)
    }

    /**
     * Returns true when Flutter has pushed a session and it is still valid.
     *
     * An empty SID is a real value: a password-less v6 server has no session
     * token, so Flutter pushes "". Only a missing key means "never pushed".
     */
    fun hasUsableSession(serverId: String): Boolean {
        return getSid(serverId) != null && isSidValid(serverId)
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
            obj.put("allowUntrustedCert", server.allowUntrustedCert)
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
                .putBoolean(keyForAllowUntrustedCert(server.serverId), server.allowUntrustedCert)
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
            .remove(keyForAllowUntrustedCert(serverId))
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
                        allowUntrustedCert = obj.optBoolean("allowUntrustedCert", false),
                        ignoreCertificateErrors = obj.optBoolean("ignoreCertificateErrors", false),
                        pinnedCertificateSha256 = obj.optString("pinnedCertificateSha256").ifEmpty { null },
                    ),
                )
            }
            list
        } catch (e: org.json.JSONException) {
            if (WidgetDebugConfig.DEBUG) {
                // Only log exception message, never raw data (may contain server addresses)
                Log.w(TAG, "Invalid JSON in getServers: ${e.message}")
            }
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
        val allowUntrustedCert = prefs.getBoolean(keyForAllowUntrustedCert(serverId), false)
        val ignoreCertErrors = prefs.getBoolean(keyForIgnoreCertErrors(serverId), false)
        val pinnedCertSha256 = prefs.getString(keyForPinnedCertSha256(serverId), null)
        return WidgetServer(
            serverId = serverId,
            alias = alias,
            address = address,
            apiVersion = apiVersion,
            allowUntrustedCert = allowUntrustedCert,
            ignoreCertificateErrors = ignoreCertErrors,
            pinnedCertificateSha256 = pinnedCertSha256,
        )
    }

    /**
     * Returns the set of server ids that have at least one widget bound to them.
     *
     * Enumerates all widget instances across the three widget types and maps each
     * to its configured server id. Used by [WidgetSyncPeriodicWorker] to trigger
     * a per-server refresh without knowing widget ids in advance.
     */
    fun getBoundServerIds(context: Context): Set<String> {
        val manager = AppWidgetManager.getInstance(context)
        return listOf(
            PiHoleWidgetProvider::class.java,
            CompactWidgetProvider::class.java,
            ToggleWidgetProvider::class.java,
        ).flatMap { type ->
            manager.getAppWidgetIds(ComponentName(context, type)).toList()
                .mapNotNull { getServerForWidget(it) }
        }.toSet()
    }

    /**
     * Returns the ids of all placed widget instances across the three widget types.
     */
    fun getAllWidgetIds(context: Context): IntArray {
        val manager = AppWidgetManager.getInstance(context)
        return listOf(
            PiHoleWidgetProvider::class.java,
            CompactWidgetProvider::class.java,
            ToggleWidgetProvider::class.java,
        ).flatMap { type ->
            manager.getAppWidgetIds(ComponentName(context, type)).toList()
        }.toIntArray()
    }

    /**
     * Filters widget ids that are bound to the given server id.
     */
    fun getWidgetIdsForServer(appWidgetIds: IntArray, serverId: String): IntArray {
        return appWidgetIds.filter { widgetId ->
            getServerForWidget(widgetId) == serverId
        }.toIntArray()
    }

    /**
     * Moves widgets bound to [oldServerId] over to [newServerId].
     *
     * The server id is the server address, so editing the address in the app
     * gives the same server a new id.
     */
    fun remapServer(appWidgetIds: IntArray, oldServerId: String, newServerId: String) {
        getWidgetIdsForServer(appWidgetIds, oldServerId).forEach { widgetId ->
            setServerForWidget(widgetId, newServerId)
        }
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

    private fun keyForAllowUntrustedCert(serverId: String) =
        "${WidgetConstants.KEY_SERVER_ALLOW_UNTRUSTED_CERT_PREFIX}$serverId"

    private fun keyForIgnoreCertErrors(serverId: String) =
        "${WidgetConstants.KEY_SERVER_IGNORE_CERT_ERRORS_PREFIX}$serverId"

    private fun keyForPinnedCertSha256(serverId: String) =
        "${WidgetConstants.KEY_SERVER_PINNED_CERT_SHA256_PREFIX}$serverId"
}

package io.github.tsutsu3.pi_hole_client

import android.content.Intent
import android.os.Bundle
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.github.tsutsu3.pi_hole_client.widget.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.WidgetServer
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper

class MainActivity : FlutterFragmentActivity() {
    private var pendingServerId: String? = null
    private lateinit var widgetChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        widgetChannel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "pihole/widget")
        widgetChannel.setMethodCallHandler { call, result ->
            val prefs = WidgetPrefs(this)
            when (call.method) {
                "sidUpdated" -> {
                    val serverId = requireServerId(call, result) ?: return@setMethodCallHandler
                    val sid = call.argument<String>("sid").orEmpty()
                    prefs.saveSid(serverId, sid)
                    prefs.setSidValid(serverId, true)
                    WidgetUpdateHelper.refreshWidgetsForServer(this, serverId)
                    result.success(null)
                }

                "sidInvalidated" -> {
                    val serverId = requireServerId(call, result) ?: return@setMethodCallHandler
                    prefs.setSidValid(serverId, false)
                    WidgetUpdateHelper.refreshWidgetsForServer(this, serverId)
                    result.success(null)
                }

                "serversUpdated" -> {
                    val raw = call.argument<List<Map<String, Any>>>("servers") ?: emptyList()
                    val servers = raw.mapNotNull { item ->
                        val serverId = item["serverId"] as? String ?: return@mapNotNull null
                        val alias = item["alias"] as? String ?: serverId
                        val address = item["address"] as? String ?: serverId
                        val apiVersion = item["apiVersion"] as? String ?: "v6"
                        val allowSelfSigned = item["allowSelfSignedCert"] as? Boolean ?: false
                        WidgetServer(
                            serverId = serverId,
                            alias = alias,
                            address = address,
                            apiVersion = apiVersion,
                            allowSelfSignedCert = allowSelfSigned,
                        )
                    }
                    prefs.saveServers(servers)
                    WidgetUpdateHelper.refreshAllWidgets(this)
                    result.success(null)
                }

                "serverRemoved" -> {
                    val serverId = requireServerId(call, result) ?: return@setMethodCallHandler
                    prefs.removeServer(serverId)
                    WidgetUpdateHelper.refreshAllWidgets(this)
                    result.success(null)
                }

                "blockingUpdated" -> {
                    val serverId = requireServerId(call, result) ?: return@setMethodCallHandler
                    WidgetUpdateHelper.refreshWidgetsForServer(this, serverId)
                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }

        pendingServerId?.let { serverId ->
            sendOpenServer(serverId)
            pendingServerId = null
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        handleIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        handleIntent(intent)
    }

    private fun handleIntent(intent: Intent?) {
        val serverId = intent?.getStringExtra("serverId")
        if (serverId.isNullOrEmpty()) return

        if (this::widgetChannel.isInitialized) {
            sendOpenServer(serverId)
        } else {
            pendingServerId = serverId
        }
    }

    private fun sendOpenServer(serverId: String) {
        widgetChannel.invokeMethod(
            "openServer",
            mapOf("serverId" to serverId),
        )
    }

    /**
     * Extracts a required `serverId` argument from a widget MethodChannel call.
     *
     * Returns `null` and reports an error to Flutter when the argument is missing/blank.
     */
    private fun requireServerId(call: MethodCall, result: MethodChannel.Result): String? {
        val serverId = call.argument<String>("serverId")
        if (serverId.isNullOrEmpty()) {
            result.error("invalid_args", "serverId is required", null)
            return null
        }
        return serverId
    }
}

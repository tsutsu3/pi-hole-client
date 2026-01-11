package io.github.tsutsu3.pi_hole_client.widget

import android.app.Activity
import android.appwidget.AppWidgetManager
import android.content.Intent
import android.os.Bundle
import android.widget.Button
import android.widget.ListView
import android.widget.TextView
import androidx.appcompat.app.AppCompatActivity
import androidx.core.content.ContextCompat
import io.github.tsutsu3.pi_hole_client.R

/**
 * Configuration activity shown when a widget is added.
 *
 * It reads the server list saved by Flutter and writes the selected server id
 * for the widget instance; it never performs network calls directly.
 */
class PiHoleWidgetConfigureActivity : AppCompatActivity() {
    private var appWidgetId: Int = AppWidgetManager.INVALID_APPWIDGET_ID

    /**
     * Loads server list and returns the selected server id to the host.
     */
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.pihole_widget_configure)

        // Default result is canceled until a server is selected.
        setResult(Activity.RESULT_CANCELED)

        appWidgetId = intent?.extras?.getInt(
            AppWidgetManager.EXTRA_APPWIDGET_ID,
            AppWidgetManager.INVALID_APPWIDGET_ID,
        ) ?: AppWidgetManager.INVALID_APPWIDGET_ID

        if (appWidgetId == AppWidgetManager.INVALID_APPWIDGET_ID) {
            finish()
            return
        }

        val prefs = WidgetPrefs(this)
        val servers = prefs.getServers()
        val listView = findViewById<ListView>(R.id.widget_server_list)
        val emptyView = findViewById<TextView>(R.id.widget_server_empty)
        if (servers.isEmpty()) {
            // No cached servers means Flutter has not provided widget data yet.
            listView.emptyView = emptyView
            return
        }

        val titleColor = ContextCompat.getColor(this, R.color.widget_text_primary)
        val subtitleColor = ContextCompat.getColor(this, R.color.widget_text_secondary)
        val adapter = object : android.widget.BaseAdapter() {
            override fun getCount(): Int = servers.size

            override fun getItem(position: Int): Any = servers[position]

            override fun getItemId(position: Int): Long = position.toLong()

            override fun getView(
                position: Int,
                convertView: android.view.View?,
                parent: android.view.ViewGroup,
            ): android.view.View {
                val view = convertView ?: layoutInflater.inflate(
                    R.layout.widget_server_item,
                    parent,
                    false,
                )
                val server = servers[position]
                val isSupported = server.apiVersion == "v6"
                val title = view.findViewById<TextView>(R.id.widget_server_item_title)
                val subtitle = view.findViewById<TextView>(R.id.widget_server_item_subtitle)
                val button = view.findViewById<Button>(R.id.widget_server_item_select)
                val root = view.findViewById<android.view.View>(R.id.widget_server_item_root)
                val icon = view.findViewById<android.widget.ImageView>(R.id.widget_server_item_icon)

                title.text = server.address
                subtitle.text = server.alias
                button.isEnabled = isSupported
                button.alpha = if (isSupported) 1.0f else 0.4f
                root.isEnabled = isSupported
                root.background = ContextCompat.getDrawable(
                    this@PiHoleWidgetConfigureActivity,
                    R.drawable.widget_config_card,
                )
                icon.setImageResource(
                    if (isSupported) {
                        R.drawable.widget_server_icon
                    } else {
                        R.drawable.widget_server_icon_off
                    },
                )
                title.setTextColor(titleColor)
                subtitle.setTextColor(subtitleColor)

                val selectAction = android.view.View.OnClickListener {
                    if (!isSupported) {
                        return@OnClickListener
                    }
                    // Persist the mapping and trigger an immediate refresh.
                    prefs.setServerForWidget(appWidgetId, server.serverId)
                    PiHoleWidgetProvider().onUpdate(
                        this@PiHoleWidgetConfigureActivity,
                        AppWidgetManager.getInstance(this@PiHoleWidgetConfigureActivity),
                        intArrayOf(appWidgetId),
                    )
                    val resultValue = Intent().putExtra(
                        AppWidgetManager.EXTRA_APPWIDGET_ID,
                        appWidgetId,
                    )
                    setResult(Activity.RESULT_OK, resultValue)
                    finish()
                }

                button.setOnClickListener(selectAction)
                root.setOnClickListener(null)

                return view
            }
        }
        listView.adapter = adapter
    }
}

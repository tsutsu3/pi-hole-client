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
     * ViewHolder for the server selection ListView.
     *
     * Remote widget config can list multiple servers; caching view references avoids
     * repeated `findViewById` calls during ListView recycling.
     */
    private data class ServerItemViewHolder(
        val title: TextView,
        val subtitle: TextView,
        val button: Button,
        val root: android.view.View,
        val icon: android.widget.ImageView,
    )

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
                ).apply {
                    tag = ServerItemViewHolder(
                        title = findViewById(R.id.widget_server_item_title),
                        subtitle = findViewById(R.id.widget_server_item_subtitle),
                        button = findViewById(R.id.widget_server_item_select),
                        root = findViewById(R.id.widget_server_item_root),
                        icon = findViewById(R.id.widget_server_item_icon),
                    )
                }
                val holder = view.tag as ServerItemViewHolder
                val server = servers[position]
                val isSupported = server.apiVersion == "v6"

                holder.title.text = server.address
                holder.subtitle.text = server.alias
                holder.button.isEnabled = isSupported
                holder.button.alpha = if (isSupported) 1.0f else 0.4f
                holder.root.isEnabled = isSupported
                holder.root.background = ContextCompat.getDrawable(
                    this@PiHoleWidgetConfigureActivity,
                    R.drawable.widget_config_card,
                )
                holder.icon.setImageResource(
                    if (isSupported) {
                        R.drawable.widget_server_icon
                    } else {
                        R.drawable.widget_server_icon_off
                    },
                )
                holder.title.setTextColor(titleColor)
                holder.subtitle.setTextColor(subtitleColor)

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

                holder.button.setOnClickListener(selectAction)
                holder.root.setOnClickListener(null)

                return view
            }
        }
        listView.adapter = adapter
    }
}

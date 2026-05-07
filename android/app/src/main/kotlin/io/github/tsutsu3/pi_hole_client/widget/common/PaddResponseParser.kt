package io.github.tsutsu3.pi_hole_client.widget.common

import org.json.JSONObject
import java.text.NumberFormat
import java.time.LocalDateTime
import java.time.format.DateTimeFormatter
import java.util.Locale

/**
 * Shared parsing utilities for the Pi-hole `/api/padd` response.
 *
 * Extracted from the old per-widget worker so that all per-server workers
 * can reuse the same formatting logic without duplication.
 */
object PaddResponseParser {

    /**
     * Parses the full `/api/padd` JSON body into a [WidgetState] ready for display.
     */
    fun parse(serverId: String, serverName: String, paddBody: String): WidgetState {
        val paddJson = JSONObject(paddBody)
        val numberFormat = NumberFormat.getIntegerInstance()

        val queries = paddJson.optJSONObject("queries")
        val total = if (queries?.has("total") == true) {
            numberFormat.format(queries.optLong("total"))
        } else {
            "--"
        }
        val blocked = if (queries?.has("blocked") == true) {
            numberFormat.format(queries.optLong("blocked"))
        } else {
            "--"
        }
        val percent = if (queries?.has("percent_blocked") == true) {
            queries.optDouble("percent_blocked")
        } else {
            null
        }
        val percentText = if (percent != null) {
            String.format(Locale.getDefault(), "%.1f%%", percent)
        } else {
            "--"
        }
        val domainsOnAdlists = if (paddJson.has("gravity_size")) {
            numberFormat.format(paddJson.optLong("gravity_size"))
        } else {
            "--"
        }

        val system = paddJson.optJSONObject("system")
        val uptime = if (system?.has("uptime") == true) {
            formatUptime(system.optLong("uptime"))
        } else {
            "--"
        }
        val cpuUsage = system?.optJSONObject("cpu")
        val cpuUsageText = if (cpuUsage?.has("%cpu") == true) {
            String.format(Locale.getDefault(), "%.1f%%", cpuUsage.optDouble("%cpu"))
        } else {
            "--"
        }
        val memUsage = system?.optJSONObject("memory")?.optJSONObject("ram")
        val memUsageText = if (memUsage?.has("%used") == true) {
            String.format(Locale.getDefault(), "%.1f%%", memUsage.optDouble("%used"))
        } else {
            "--"
        }
        val sensors = paddJson.optJSONObject("sensors")
        val tempUnit = sensors?.optString("unit").orEmpty()
        val tempText = if (sensors?.has("cpu_temp") == true) {
            val temp = sensors.optDouble("cpu_temp")
            String.format(Locale.getDefault(), "%.1f°%s", temp, tempUnit)
        } else {
            "--"
        }

        val blocking = paddJson.optString("blocking")
        val status = parseBlockingStatus(blocking)

        return WidgetState(
            serverId = serverId,
            serverName = serverName,
            status = status,
            totalQueries = total,
            blockedQueries = blocked,
            percentBlocked = percentText,
            domainsOnAdlists = domainsOnAdlists,
            uptime = uptime,
            cpuTemp = tempText,
            cpuUsage = cpuUsageText,
            memUsage = memUsageText,
            updatedAt = nowString(),
            actionsEnabled = true,
        )
    }

    /**
     * Builds a minimal placeholder state for error/auth/missing data cases.
     */
    fun placeholderState(
        serverId: String,
        serverName: String,
        status: WidgetStatus,
        actionsEnabled: Boolean,
    ): WidgetState = WidgetState(
        serverId = serverId,
        serverName = serverName,
        status = status,
        totalQueries = "--",
        blockedQueries = "--",
        percentBlocked = "--",
        domainsOnAdlists = "--",
        uptime = "--",
        cpuTemp = "--",
        cpuUsage = "--",
        memUsage = "--",
        updatedAt = nowString(),
        actionsEnabled = actionsEnabled,
    )

    fun formatUptime(seconds: Long): String {
        if (seconds <= 0) return "--"
        val days = seconds / 86400
        val hours = (seconds % 86400) / 3600
        val minutes = (seconds % 3600) / 60
        return when {
            days > 0 -> "${days}d"
            hours > 0 -> "${hours}h"
            minutes > 0 -> "${minutes}m"
            else -> "${seconds}s"
        }
    }

    private val FORMATTER: DateTimeFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss")

    fun nowString(): String = LocalDateTime.now().format(FORMATTER)
}

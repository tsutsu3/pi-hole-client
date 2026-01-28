package io.github.tsutsu3.pi_hole_client.widget.common

import org.junit.Assert.assertEquals
import org.junit.Test

class WidgetModelsTest {

    @Test
    fun parseWidgetStatus_validValues() {
        // Test all valid WidgetStatus enum values
        assertEquals(WidgetStatus.BLOCKING_ON, parseWidgetStatus("BLOCKING_ON"))
        assertEquals(WidgetStatus.BLOCKING_OFF, parseWidgetStatus("BLOCKING_OFF"))
        assertEquals(WidgetStatus.AUTH_REQUIRED, parseWidgetStatus("AUTH_REQUIRED"))
        assertEquals(WidgetStatus.ERROR, parseWidgetStatus("ERROR"))
    }

    @Test
    fun parseWidgetStatus_invalidValue_returnsError() {
        // Invalid or unknown string should default to ERROR
        assertEquals(WidgetStatus.ERROR, parseWidgetStatus("INVALID_STATUS"))
        assertEquals(WidgetStatus.ERROR, parseWidgetStatus(""))
        assertEquals(WidgetStatus.ERROR, parseWidgetStatus("random_string"))
    }

    @Test
    fun parseWidgetStatus_nullValue_returnsError() {
        // Null value should default to ERROR
        assertEquals(WidgetStatus.ERROR, parseWidgetStatus(null))
    }

    @Test
    fun parseBlockingStatus_enabled() {
        // "enabled" should map to BLOCKING_ON
        assertEquals(WidgetStatus.BLOCKING_ON, parseBlockingStatus("enabled"))
    }

    @Test
    fun parseBlockingStatus_disabled() {
        // "disabled" should map to BLOCKING_OFF
        assertEquals(WidgetStatus.BLOCKING_OFF, parseBlockingStatus("disabled"))
    }

    @Test
    fun parseBlockingStatus_unknown_returnsError() {
        // Unknown values should default to ERROR
        assertEquals(WidgetStatus.ERROR, parseBlockingStatus("unknown"))
        assertEquals(WidgetStatus.ERROR, parseBlockingStatus(""))
        assertEquals(WidgetStatus.ERROR, parseBlockingStatus("invalid"))
    }

    @Test
    fun widgetState_construction() {
        // Test that WidgetState can be constructed with all fields
        val state = WidgetState(
            serverId = "test-server-1",
            serverName = "Test Server",
            status = WidgetStatus.BLOCKING_ON,
            totalQueries = "50,000",
            blockedQueries = "10,000",
            percentBlocked = "20.0%",
            domainsOnAdlists = "100,000",
            uptime = "1d 0h",
            cpuTemp = "45°C",
            cpuUsage = "10%",
            memUsage = "50%",
            updatedAt = "2026-01-28 10:00:00",
            actionsEnabled = true
        )

        assertEquals("test-server-1", state.serverId)
        assertEquals("Test Server", state.serverName)
        assertEquals(WidgetStatus.BLOCKING_ON, state.status)
        assertEquals("50,000", state.totalQueries)
        assertEquals("10,000", state.blockedQueries)
        assertEquals("20.0%", state.percentBlocked)
        assertEquals("100,000", state.domainsOnAdlists)
        assertEquals("1d 0h", state.uptime)
        assertEquals("45°C", state.cpuTemp)
        assertEquals("10%", state.cpuUsage)
        assertEquals("50%", state.memUsage)
        assertEquals("2026-01-28 10:00:00", state.updatedAt)
        assertEquals(true, state.actionsEnabled)
    }

    @Test
    fun toggleWidgetState_construction() {
        // Test that ToggleWidgetState can be constructed with all fields
        val state = ToggleWidgetState(
            serverId = "test-server-1",
            serverName = "Test Server",
            status = WidgetStatus.BLOCKING_ON,
            actionsEnabled = true
        )

        assertEquals("test-server-1", state.serverId)
        assertEquals("Test Server", state.serverName)
        assertEquals(WidgetStatus.BLOCKING_ON, state.status)
        assertEquals(true, state.actionsEnabled)
    }
}

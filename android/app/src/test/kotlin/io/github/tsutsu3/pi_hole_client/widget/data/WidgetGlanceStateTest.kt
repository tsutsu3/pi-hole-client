package io.github.tsutsu3.pi_hole_client.widget.data

import androidx.datastore.preferences.core.mutablePreferencesOf
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.testutils.TestData
import org.junit.Assert.assertEquals
import org.junit.Test

class WidgetGlanceStateTest {

    @Test
    fun toWidgetState_withCompleteData() {
        // Create preferences with complete data
        val prefs = mutablePreferencesOf(
            WidgetGlanceStateKeys.serverId to "server-123",
            WidgetGlanceStateKeys.serverName to "Production Pi-hole",
            WidgetGlanceStateKeys.status to "BLOCKING_ON",
            WidgetGlanceStateKeys.totalQueries to "75,432",
            WidgetGlanceStateKeys.blockedQueries to "12,345",
            WidgetGlanceStateKeys.percentBlocked to "16.4%",
            WidgetGlanceStateKeys.domainsOnAdlists to "200,000",
            WidgetGlanceStateKeys.uptime to "5d 12h",
            WidgetGlanceStateKeys.cpuTemp to "52°C",
            WidgetGlanceStateKeys.cpuUsage to "15%",
            WidgetGlanceStateKeys.memUsage to "65%",
            WidgetGlanceStateKeys.updatedAt to "2026-01-28 15:30:00",
            WidgetGlanceStateKeys.actionsEnabled to true
        )

        val state = prefs.toWidgetState()

        assertEquals("server-123", state.serverId)
        assertEquals("Production Pi-hole", state.serverName)
        assertEquals(WidgetStatus.BLOCKING_ON, state.status)
        assertEquals("75,432", state.totalQueries)
        assertEquals("12,345", state.blockedQueries)
        assertEquals("16.4%", state.percentBlocked)
        assertEquals("200,000", state.domainsOnAdlists)
        assertEquals("5d 12h", state.uptime)
        assertEquals("52°C", state.cpuTemp)
        assertEquals("15%", state.cpuUsage)
        assertEquals("65%", state.memUsage)
        assertEquals("2026-01-28 15:30:00", state.updatedAt)
        assertEquals(true, state.actionsEnabled)
    }

    @Test
    fun toWidgetState_withMissingFields_usesDefaults() {
        // Create preferences with only minimal data
        val prefs = mutablePreferencesOf(
            WidgetGlanceStateKeys.serverId to "server-456",
            WidgetGlanceStateKeys.serverName to "Test Server"
            // All other fields are missing
        )

        val state = prefs.toWidgetState()

        // Check that defaults are applied
        assertEquals("server-456", state.serverId)
        assertEquals("Test Server", state.serverName)
        assertEquals(WidgetStatus.ERROR, state.status) // null status defaults to ERROR
        assertEquals("--", state.totalQueries) // DEFAULT_TEXT
        assertEquals("--", state.blockedQueries)
        assertEquals("--", state.percentBlocked)
        assertEquals("--", state.domainsOnAdlists)
        assertEquals("--", state.uptime)
        assertEquals("--", state.cpuTemp)
        assertEquals("--", state.cpuUsage)
        assertEquals("--", state.memUsage)
        assertEquals("--", state.updatedAt)
        assertEquals(false, state.actionsEnabled) // Default boolean is false
    }

    @Test
    fun toWidgetState_withEmptyPreferences_usesDefaults() {
        // Empty preferences
        val prefs = mutablePreferencesOf()

        val state = prefs.toWidgetState()

        // Check that all fields use defaults
        assertEquals("", state.serverId) // orEmpty() returns ""
        assertEquals("", state.serverName)
        assertEquals(WidgetStatus.ERROR, state.status)
        assertEquals("--", state.totalQueries)
        assertEquals("--", state.blockedQueries)
        assertEquals("--", state.percentBlocked)
        assertEquals("--", state.domainsOnAdlists)
        assertEquals("--", state.uptime)
        assertEquals("--", state.cpuTemp)
        assertEquals("--", state.cpuUsage)
        assertEquals("--", state.memUsage)
        assertEquals("--", state.updatedAt)
        assertEquals(false, state.actionsEnabled)
    }

    @Test
    fun updateFrom_roundTripSerialization() {
        // Create a WidgetState
        val originalState = TestData.createWidgetState(
            serverId = "server-789",
            serverName = "Round Trip Server",
            status = WidgetStatus.BLOCKING_OFF,
            totalQueries = "100,000",
            blockedQueries = "25,000",
            percentBlocked = "25.0%",
            domainsOnAdlists = "150,000",
            uptime = "3d 6h",
            cpuTemp = "48°C",
            cpuUsage = "12%",
            memUsage = "55%",
            updatedAt = "2026-01-28 12:00:00",
            actionsEnabled = true
        )

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFrom(originalState)

        // Deserialize back to WidgetState
        val roundTripState = prefs.toWidgetState()

        // Verify all fields match
        assertEquals(originalState.serverId, roundTripState.serverId)
        assertEquals(originalState.serverName, roundTripState.serverName)
        assertEquals(originalState.status, roundTripState.status)
        assertEquals(originalState.totalQueries, roundTripState.totalQueries)
        assertEquals(originalState.blockedQueries, roundTripState.blockedQueries)
        assertEquals(originalState.percentBlocked, roundTripState.percentBlocked)
        assertEquals(originalState.domainsOnAdlists, roundTripState.domainsOnAdlists)
        assertEquals(originalState.uptime, roundTripState.uptime)
        assertEquals(originalState.cpuTemp, roundTripState.cpuTemp)
        assertEquals(originalState.cpuUsage, roundTripState.cpuUsage)
        assertEquals(originalState.memUsage, roundTripState.memUsage)
        assertEquals(originalState.updatedAt, roundTripState.updatedAt)
        assertEquals(originalState.actionsEnabled, roundTripState.actionsEnabled)
    }

    @Test
    fun updateFrom_withErrorState() {
        // Create an error state
        val errorState = TestData.createErrorWidgetState("Error Server")

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFrom(errorState)

        // Deserialize back
        val roundTripState = prefs.toWidgetState()

        // Verify error state is preserved
        assertEquals(WidgetStatus.ERROR, roundTripState.status)
        assertEquals(false, roundTripState.actionsEnabled)
        assertEquals("Error Server", roundTripState.serverName)
    }

    @Test
    fun updateFrom_withAuthRequiredState() {
        // Create an auth required state
        val authState = TestData.createAuthRequiredWidgetState("Auth Server")

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFrom(authState)

        // Deserialize back
        val roundTripState = prefs.toWidgetState()

        // Verify auth required state is preserved
        assertEquals(WidgetStatus.AUTH_REQUIRED, roundTripState.status)
        assertEquals(false, roundTripState.actionsEnabled)
        assertEquals("Auth Server", roundTripState.serverName)
    }

    @Test
    fun toWidgetState_withInvalidStatus_defaultsToError() {
        // Create preferences with invalid status string
        val prefs = mutablePreferencesOf(
            WidgetGlanceStateKeys.serverId to "server-invalid",
            WidgetGlanceStateKeys.serverName to "Invalid Status Server",
            WidgetGlanceStateKeys.status to "INVALID_STATUS_VALUE"
        )

        val state = prefs.toWidgetState()

        // Invalid status should default to ERROR via parseWidgetStatus
        assertEquals(WidgetStatus.ERROR, state.status)
    }
}

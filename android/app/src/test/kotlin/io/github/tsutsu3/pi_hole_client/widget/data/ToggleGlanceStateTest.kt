package io.github.tsutsu3.pi_hole_client.widget.data

import androidx.datastore.preferences.core.mutablePreferencesOf
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.testutils.TestData
import org.junit.Assert.assertEquals
import org.junit.Test

class ToggleGlanceStateTest {

    @Test
    fun toToggleWidgetState_withCompleteData() {
        // Create preferences with complete data
        val prefs = mutablePreferencesOf(
            ToggleGlanceStateKeys.serverId to "toggle-server-123",
            ToggleGlanceStateKeys.serverName to "Production Toggle",
            ToggleGlanceStateKeys.status to "BLOCKING_ON",
            ToggleGlanceStateKeys.actionsEnabled to true
        )

        val state = prefs.toToggleWidgetState()

        assertEquals("toggle-server-123", state.serverId)
        assertEquals("Production Toggle", state.serverName)
        assertEquals(WidgetStatus.BLOCKING_ON, state.status)
        assertEquals(true, state.actionsEnabled)
    }

    @Test
    fun toToggleWidgetState_withMissingFields_usesDefaults() {
        // Create preferences with only minimal data
        val prefs = mutablePreferencesOf(
            ToggleGlanceStateKeys.serverId to "toggle-server-456"
            // serverName, status, actionsEnabled are missing
        )

        val state = prefs.toToggleWidgetState()

        // Check that defaults are applied
        assertEquals("toggle-server-456", state.serverId)
        assertEquals("", state.serverName) // orEmpty() returns ""
        assertEquals(WidgetStatus.ERROR, state.status) // null status defaults to ERROR
        assertEquals(false, state.actionsEnabled) // Default boolean is false
    }

    @Test
    fun toToggleWidgetState_withEmptyPreferences_usesDefaults() {
        // Empty preferences
        val prefs = mutablePreferencesOf()

        val state = prefs.toToggleWidgetState()

        // Check that all fields use defaults
        assertEquals("", state.serverId)
        assertEquals("", state.serverName)
        assertEquals(WidgetStatus.ERROR, state.status)
        assertEquals(false, state.actionsEnabled)
    }

    @Test
    fun updateFromToggle_roundTripSerialization() {
        // Create a ToggleWidgetState
        val originalState = TestData.createToggleWidgetState(
            serverId = "toggle-789",
            serverName = "Round Trip Toggle",
            status = WidgetStatus.BLOCKING_OFF,
            actionsEnabled = true
        )

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFromToggle(originalState)

        // Deserialize back to ToggleWidgetState
        val roundTripState = prefs.toToggleWidgetState()

        // Verify all fields match
        assertEquals(originalState.serverId, roundTripState.serverId)
        assertEquals(originalState.serverName, roundTripState.serverName)
        assertEquals(originalState.status, roundTripState.status)
        assertEquals(originalState.actionsEnabled, roundTripState.actionsEnabled)
    }

    @Test
    fun updateFromToggle_withErrorState() {
        // Create an error state
        val errorState = TestData.createErrorToggleWidgetState("Error Toggle")

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFromToggle(errorState)

        // Deserialize back
        val roundTripState = prefs.toToggleWidgetState()

        // Verify error state is preserved
        assertEquals(WidgetStatus.ERROR, roundTripState.status)
        assertEquals(false, roundTripState.actionsEnabled)
        assertEquals("Error Toggle", roundTripState.serverName)
    }

    @Test
    fun updateFromToggle_withAuthRequiredState() {
        // Create an auth required state
        val authState = TestData.createAuthRequiredToggleWidgetState("Auth Toggle")

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFromToggle(authState)

        // Deserialize back
        val roundTripState = prefs.toToggleWidgetState()

        // Verify auth required state is preserved
        assertEquals(WidgetStatus.AUTH_REQUIRED, roundTripState.status)
        assertEquals(false, roundTripState.actionsEnabled)
        assertEquals("Auth Toggle", roundTripState.serverName)
    }

    @Test
    fun updateFromToggle_withBlockingOnState() {
        // Create a blocking on state
        val blockingOnState = TestData.createToggleWidgetState(
            serverId = "toggle-on",
            serverName = "Blocking On",
            status = WidgetStatus.BLOCKING_ON,
            actionsEnabled = true
        )

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFromToggle(blockingOnState)

        // Deserialize back
        val roundTripState = prefs.toToggleWidgetState()

        // Verify blocking on state is preserved
        assertEquals(WidgetStatus.BLOCKING_ON, roundTripState.status)
        assertEquals(true, roundTripState.actionsEnabled)
        assertEquals("Blocking On", roundTripState.serverName)
    }

    @Test
    fun updateFromToggle_withBlockingOffState() {
        // Create a blocking off state
        val blockingOffState = TestData.createToggleWidgetState(
            serverId = "toggle-off",
            serverName = "Blocking Off",
            status = WidgetStatus.BLOCKING_OFF,
            actionsEnabled = true
        )

        // Serialize to preferences
        val prefs = mutablePreferencesOf()
        prefs.updateFromToggle(blockingOffState)

        // Deserialize back
        val roundTripState = prefs.toToggleWidgetState()

        // Verify blocking off state is preserved
        assertEquals(WidgetStatus.BLOCKING_OFF, roundTripState.status)
        assertEquals(true, roundTripState.actionsEnabled)
        assertEquals("Blocking Off", roundTripState.serverName)
    }

    @Test
    fun toToggleWidgetState_withInvalidStatus_defaultsToError() {
        // Create preferences with invalid status string
        val prefs = mutablePreferencesOf(
            ToggleGlanceStateKeys.serverId to "toggle-invalid",
            ToggleGlanceStateKeys.serverName to "Invalid Status Toggle",
            ToggleGlanceStateKeys.status to "INVALID_STATUS_VALUE"
        )

        val state = prefs.toToggleWidgetState()

        // Invalid status should default to ERROR via parseWidgetStatus
        assertEquals(WidgetStatus.ERROR, state.status)
    }
}

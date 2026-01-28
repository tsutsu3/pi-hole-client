package io.github.tsutsu3.pi_hole_client.widget.ui.toggle

import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.testutils.TestData
import org.junit.Assert.assertEquals
import org.junit.Test

class ToggleGlanceWidgetTest {

    @Test
    fun toggleWidgetState_construction() {
        val state = TestData.createToggleWidgetState(
            serverId = "toggle-1",
            serverName = "Test Toggle",
            status = WidgetStatus.BLOCKING_ON,
            actionsEnabled = true
        )

        assertEquals("toggle-1", state.serverId)
        assertEquals("Test Toggle", state.serverName)
        assertEquals(WidgetStatus.BLOCKING_ON, state.status)
        assertEquals(true, state.actionsEnabled)
    }

    @Test
    fun toggleWidgetState_errorState_disablesActions() {
        val errorState = TestData.createErrorToggleWidgetState("Error Toggle")

        assertEquals(WidgetStatus.ERROR, errorState.status)
        assertEquals(false, errorState.actionsEnabled)
        assertEquals("Error Toggle", errorState.serverName)
    }

    @Test
    fun toggleWidgetState_authRequiredState_disablesActions() {
        val authState = TestData.createAuthRequiredToggleWidgetState("Auth Toggle")

        assertEquals(WidgetStatus.AUTH_REQUIRED, authState.status)
        assertEquals(false, authState.actionsEnabled)
        assertEquals("Auth Toggle", authState.serverName)
    }

    @Test
    fun toggleWidgetState_blockingOnState() {
        val blockingOnState = TestData.createToggleWidgetState(
            serverName = "Blocking On",
            status = WidgetStatus.BLOCKING_ON,
            actionsEnabled = true
        )

        assertEquals(WidgetStatus.BLOCKING_ON, blockingOnState.status)
        assertEquals(true, blockingOnState.actionsEnabled)
    }

    @Test
    fun toggleWidgetState_blockingOffState() {
        val blockingOffState = TestData.createToggleWidgetState(
            serverName = "Blocking Off",
            status = WidgetStatus.BLOCKING_OFF,
            actionsEnabled = true
        )

        assertEquals(WidgetStatus.BLOCKING_OFF, blockingOffState.status)
        assertEquals(true, blockingOffState.actionsEnabled)
    }
}

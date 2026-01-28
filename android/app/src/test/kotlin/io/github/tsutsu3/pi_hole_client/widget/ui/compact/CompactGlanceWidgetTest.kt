package io.github.tsutsu3.pi_hole_client.widget.ui.compact

import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import io.github.tsutsu3.pi_hole_client.widget.testutils.TestData
import org.junit.Assert.assertEquals
import org.junit.Test

class CompactGlanceWidgetTest {

    @Test
    fun compactWidgetState_construction() {
        val state = TestData.createWidgetState(
            serverId = "compact-1",
            serverName = "Compact Server",
            status = WidgetStatus.BLOCKING_ON,
            totalQueries = "50,000",
            blockedQueries = "10,000",
            percentBlocked = "20.0%",
            actionsEnabled = true
        )

        assertEquals("compact-1", state.serverId)
        assertEquals("Compact Server", state.serverName)
        assertEquals(WidgetStatus.BLOCKING_ON, state.status)
        assertEquals("50,000", state.totalQueries)
        assertEquals("10,000", state.blockedQueries)
        assertEquals("20.0%", state.percentBlocked)
        assertEquals(true, state.actionsEnabled)
    }

    @Test
    fun compactWidgetState_errorState() {
        val errorState = TestData.createErrorWidgetState("Error Compact")

        assertEquals(WidgetStatus.ERROR, errorState.status)
        assertEquals(false, errorState.actionsEnabled)
        assertEquals("Error Compact", errorState.serverName)
    }

    @Test
    fun compactWidgetState_authRequiredState() {
        val authState = TestData.createAuthRequiredWidgetState("Auth Compact")

        assertEquals(WidgetStatus.AUTH_REQUIRED, authState.status)
        assertEquals(false, authState.actionsEnabled)
        assertEquals("Auth Compact", authState.serverName)
    }

    @Test
    fun compactWidgetState_blockingOffState() {
        val blockingOffState = TestData.createBlockingOffWidgetState("Blocking Off Compact")

        assertEquals(WidgetStatus.BLOCKING_OFF, blockingOffState.status)
        assertEquals("Blocking Off Compact", blockingOffState.serverName)
    }

    @Test
    fun compactWidgetState_withMetrics() {
        val state = TestData.createWidgetState(
            serverName = "Metrics Server",
            totalQueries = "100,000",
            blockedQueries = "25,000",
            percentBlocked = "25.0%",
            domainsOnAdlists = "150,000",
            uptime = "5d 12h"
        )

        assertEquals("100,000", state.totalQueries)
        assertEquals("25,000", state.blockedQueries)
        assertEquals("25.0%", state.percentBlocked)
        assertEquals("150,000", state.domainsOnAdlists)
        assertEquals("5d 12h", state.uptime)
    }
}

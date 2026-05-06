package io.github.tsutsu3.pi_hole_client.widget.worker

import io.github.tsutsu3.pi_hole_client.widget.common.PaddResponseParser
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import org.junit.Assert.assertEquals
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class PaddResponseParserTest {

    // formatUptime tests
    @Test
    fun formatUptime_lessThanMinute() {
        assertEquals("45s", PaddResponseParser.formatUptime(45))
        assertEquals("30s", PaddResponseParser.formatUptime(30))
        assertEquals("1s", PaddResponseParser.formatUptime(1))
    }

    @Test
    fun formatUptime_minutes() {
        assertEquals("1m", PaddResponseParser.formatUptime(60))
        assertEquals("5m", PaddResponseParser.formatUptime(300))
        assertEquals("30m", PaddResponseParser.formatUptime(1800))
        assertEquals("59m", PaddResponseParser.formatUptime(3599))
    }

    @Test
    fun formatUptime_hours() {
        assertEquals("1h", PaddResponseParser.formatUptime(3600))
        assertEquals("5h", PaddResponseParser.formatUptime(18000))
        assertEquals("12h", PaddResponseParser.formatUptime(43200))
        assertEquals("23h", PaddResponseParser.formatUptime(82800))
    }

    @Test
    fun formatUptime_days() {
        assertEquals("1d", PaddResponseParser.formatUptime(86400))
        assertEquals("5d", PaddResponseParser.formatUptime(432000))
        assertEquals("30d", PaddResponseParser.formatUptime(2592000))
        assertEquals("365d", PaddResponseParser.formatUptime(31536000))
    }

    @Test
    fun formatUptime_zero() {
        assertEquals("--", PaddResponseParser.formatUptime(0))
    }

    @Test
    fun formatUptime_negative() {
        assertEquals("--", PaddResponseParser.formatUptime(-100))
    }

    @Test
    fun formatUptime_edgeCases() {
        assertEquals("1m", PaddResponseParser.formatUptime(60))
        assertEquals("59m", PaddResponseParser.formatUptime(3599))
        assertEquals("1h", PaddResponseParser.formatUptime(3600))
        assertEquals("23h", PaddResponseParser.formatUptime(86399))
        assertEquals("1d", PaddResponseParser.formatUptime(86400))
    }

    // placeholderState tests
    @Test
    fun placeholderState_construction() {
        val state = PaddResponseParser.placeholderState(
            serverId = "server-123",
            serverName = "Test Server",
            status = WidgetStatus.ERROR,
            actionsEnabled = false,
        )

        assertEquals("server-123", state.serverId)
        assertEquals("Test Server", state.serverName)
        assertEquals(WidgetStatus.ERROR, state.status)
        assertEquals("--", state.totalQueries)
        assertEquals("--", state.blockedQueries)
        assertEquals("--", state.percentBlocked)
        assertEquals("--", state.domainsOnAdlists)
        assertEquals("--", state.uptime)
        assertEquals("--", state.cpuTemp)
        assertEquals("--", state.cpuUsage)
        assertEquals("--", state.memUsage)
        assertEquals(false, state.actionsEnabled)
        assert(state.updatedAt.isNotEmpty())
    }

    @Test
    fun placeholderState_withDifferentStatus() {
        val authRequiredState = PaddResponseParser.placeholderState(
            serverId = "server-456",
            serverName = "Auth Server",
            status = WidgetStatus.AUTH_REQUIRED,
            actionsEnabled = false,
        )

        assertEquals(WidgetStatus.AUTH_REQUIRED, authRequiredState.status)
        assertEquals("Auth Server", authRequiredState.serverName)

        val blockingOnState = PaddResponseParser.placeholderState(
            serverId = "server-789",
            serverName = "Blocking Server",
            status = WidgetStatus.BLOCKING_ON,
            actionsEnabled = true,
        )

        assertEquals(WidgetStatus.BLOCKING_ON, blockingOnState.status)
        assertEquals(true, blockingOnState.actionsEnabled)
    }

    @Test
    fun placeholderState_allFieldsAreDefault() {
        val state = PaddResponseParser.placeholderState(
            serverId = "empty-server",
            serverName = "Empty",
            status = WidgetStatus.ERROR,
            actionsEnabled = false,
        )

        assertEquals("--", state.totalQueries)
        assertEquals("--", state.blockedQueries)
        assertEquals("--", state.percentBlocked)
        assertEquals("--", state.domainsOnAdlists)
        assertEquals("--", state.uptime)
        assertEquals("--", state.cpuTemp)
        assertEquals("--", state.cpuUsage)
        assertEquals("--", state.memUsage)
    }
}

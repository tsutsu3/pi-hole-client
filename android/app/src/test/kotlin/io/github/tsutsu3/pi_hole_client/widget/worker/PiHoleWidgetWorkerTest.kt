package io.github.tsutsu3.pi_hole_client.widget.worker

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import androidx.work.ListenableWorker
import androidx.work.testing.TestListenableWorkerBuilder
import io.github.tsutsu3.pi_hole_client.widget.common.WidgetStatus
import org.junit.Assert.assertEquals
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class PiHoleWidgetWorkerTest {

    private lateinit var context: Context
    private lateinit var worker: PiHoleWidgetWorker

    @Before
    fun setUp() {
        context = ApplicationProvider.getApplicationContext()
        worker = TestListenableWorkerBuilder<PiHoleWidgetWorker>(context).build()
    }

    // formatUptime tests
    @Test
    fun formatUptime_lessThanMinute() {
        assertEquals("45s", worker.formatUptime(45))
        assertEquals("30s", worker.formatUptime(30))
        assertEquals("1s", worker.formatUptime(1))
    }

    @Test
    fun formatUptime_minutes() {
        assertEquals("1m", worker.formatUptime(60))
        assertEquals("5m", worker.formatUptime(300))
        assertEquals("30m", worker.formatUptime(1800))
        assertEquals("59m", worker.formatUptime(3599))
    }

    @Test
    fun formatUptime_hours() {
        assertEquals("1h", worker.formatUptime(3600))
        assertEquals("5h", worker.formatUptime(18000))
        assertEquals("12h", worker.formatUptime(43200))
        assertEquals("23h", worker.formatUptime(82800))
    }

    @Test
    fun formatUptime_days() {
        assertEquals("1d", worker.formatUptime(86400))
        assertEquals("5d", worker.formatUptime(432000))
        assertEquals("30d", worker.formatUptime(2592000))
        assertEquals("365d", worker.formatUptime(31536000))
    }

    @Test
    fun formatUptime_zero() {
        assertEquals("--", worker.formatUptime(0))
    }

    @Test
    fun formatUptime_negative() {
        assertEquals("--", worker.formatUptime(-100))
    }

    @Test
    fun formatUptime_edgeCases() {
        // Exactly 1 minute
        assertEquals("1m", worker.formatUptime(60))
        // Just under 1 hour (59 minutes 59 seconds)
        assertEquals("59m", worker.formatUptime(3599))
        // Exactly 1 hour
        assertEquals("1h", worker.formatUptime(3600))
        // Just under 1 day (23 hours 59 minutes 59 seconds)
        assertEquals("23h", worker.formatUptime(86399))
        // Exactly 1 day
        assertEquals("1d", worker.formatUptime(86400))
    }

    // placeholderState tests
    @Test
    fun placeholderState_construction() {
        val state = worker.placeholderState(
            serverId = "server-123",
            serverName = "Test Server",
            status = WidgetStatus.ERROR,
            actionsEnabled = false
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
        // updatedAt is set to nowString(), so we can't check exact value
        // but we can verify it's not empty
        assert(state.updatedAt.isNotEmpty())
    }

    @Test
    fun placeholderState_withDifferentStatus() {
        val authRequiredState = worker.placeholderState(
            serverId = "server-456",
            serverName = "Auth Server",
            status = WidgetStatus.AUTH_REQUIRED,
            actionsEnabled = false
        )

        assertEquals(WidgetStatus.AUTH_REQUIRED, authRequiredState.status)
        assertEquals("Auth Server", authRequiredState.serverName)

        val blockingOnState = worker.placeholderState(
            serverId = "server-789",
            serverName = "Blocking Server",
            status = WidgetStatus.BLOCKING_ON,
            actionsEnabled = true
        )

        assertEquals(WidgetStatus.BLOCKING_ON, blockingOnState.status)
        assertEquals(true, blockingOnState.actionsEnabled)
    }

    @Test
    fun placeholderState_allFieldsAreDefault() {
        val state = worker.placeholderState(
            serverId = "empty-server",
            serverName = "Empty",
            status = WidgetStatus.ERROR,
            actionsEnabled = false
        )

        // Verify all metric fields are "--"
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

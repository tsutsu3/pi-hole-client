package io.github.tsutsu3.pi_hole_client.widget.worker

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import androidx.work.testing.TestListenableWorkerBuilder
import androidx.work.workDataOf
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetPrefs
import io.github.tsutsu3.pi_hole_client.widget.data.WidgetServer
import io.mockk.every
import io.mockk.mockkObject
import io.mockk.unmockkAll
import io.mockk.unmockkObject
import io.mockk.verify
import kotlinx.coroutines.runBlocking
import okhttp3.mockwebserver.Dispatcher
import okhttp3.mockwebserver.MockResponse
import okhttp3.mockwebserver.MockWebServer
import okhttp3.mockwebserver.RecordedRequest
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class ServerBlockingStatusWorkerTest {

    private lateinit var server: MockWebServer
    private lateinit var prefs: WidgetPrefs
    private lateinit var serverId: String

    @Before
    fun setUp() {
        server = MockWebServer()
        server.start()
        serverId = server.url("/").toString().trimEnd('/')
        prefs = mockWidgetPrefs(serverId)
    }

    @After
    fun tearDown() {
        server.shutdown()
        unmockkAll()
        WidgetPrefs.clearInstanceForTest()
    }

    private fun testServer(id: String) = WidgetServer(
        serverId = id,
        alias = "test",
        address = id,
        apiVersion = "v6",
        allowUntrustedCert = false,
        ignoreCertificateErrors = false,
        pinnedCertificateSha256 = null,
    )

    private fun mockWidgetPrefs(id: String): WidgetPrefs {
        val mock = io.mockk.mockk<WidgetPrefs>(relaxed = true)
        every { mock.getServerInfo(id) } returns testServer(id)
        every { mock.getWidgetIdsForServer(any(), any()) } returns IntArray(0)
        mockkObject(WidgetPrefs.Companion)
        every { WidgetPrefs.getInstance(any()) } returns mock
        return mock
    }

    private fun runWorker() = runBlocking {
        TestListenableWorkerBuilder<ServerBlockingStatusWorker>(
            ApplicationProvider.getApplicationContext<Context>(),
        )
            .setInputData(workDataOf(WidgetConstants.EXTRA_SERVER_ID to serverId))
            .build()
            .doWork()
    }

    /** Switches to a real [WidgetPrefs] that holds the server and the SID "old". */
    private fun useRealPrefs() {
        unmockkObject(WidgetPrefs.Companion)
        WidgetPrefs.clearInstanceForTest()
        prefs = WidgetPrefs.getInstance(ApplicationProvider.getApplicationContext<Context>())
        prefs.saveServers(listOf(testServer(serverId)))
        prefs.updateSession(serverId, "old")
    }

    /** Answers 401. With [renewFirst], the app pushes the SID "new" before the answer. */
    private fun authFailure(renewFirst: Boolean) = object : Dispatcher() {
        override fun dispatch(request: RecordedRequest): MockResponse {
            if (renewFirst) prefs.updateSession(serverId, "new")
            return MockResponse().setResponseCode(401)
        }
    }

    private fun assertSession(sid: String, usable: Boolean) {
        assertEquals(sid, prefs.getSid(serverId))
        assertEquals(usable, prefs.hasUsableSession(serverId))
    }

    @Test
    fun noRequestWhenSidWasNeverPushed() {
        every { prefs.hasUsableSession(serverId) } returns false

        runWorker()

        assertEquals(0, server.requestCount)
    }

    @Test
    fun emptySidSendsRequestWithoutSidHeader() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))

        runWorker()

        assertEquals(1, server.requestCount)
        assertNull(server.takeRequest().getHeader("X-FTL-SID"))
    }

    @Test
    fun realSidIsSentAsHeader() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns "abc123"
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))

        runWorker()

        assertEquals("abc123", server.takeRequest().getHeader("X-FTL-SID"))
    }

    @Test
    fun noRequestWhenEmptySidIsMarkedInvalid() {
        every { prefs.hasUsableSession(serverId) } returns false
        every { prefs.getSid(serverId) } returns ""

        runWorker()

        assertEquals(0, server.requestCount)
    }

    @Test
    fun removedServerUnbindsItsWidgets() {
        every { prefs.getServerInfo(serverId) } returns null
        every { prefs.getWidgetIdsForServer(any(), serverId) } returns intArrayOf(42)

        runWorker()

        verify { prefs.clearWidget(42) }
        assertEquals(0, server.requestCount)
    }

    @Test
    fun knownServerKeepsItsWidgets() {
        every { prefs.getWidgetIdsForServer(any(), serverId) } returns intArrayOf(42)
        every { prefs.hasUsableSession(serverId) } returns false

        runWorker()

        verify(exactly = 0) { prefs.clearWidget(any()) }
    }

    // 1. The widget holds an expired SID "old".
    // 2. The toggle widget refreshes and sends a request with "old".
    // 3. Pi-hole answers 401.
    // 4. The app does nothing.
    // Expected: "old" becomes invalid.
    @Test
    fun authFailureInvalidatesTheSidItUsed() {
        useRealPrefs()
        server.dispatcher = authFailure(renewFirst = false)

        runWorker()

        assertSession(sid = "old", usable = false)
    }

    // 1. The widget holds an expired SID "old".
    // 2. The toggle widget refreshes and sends a request with "old".
    // 3. Before the 401 arrives, the user opens the app. The app logs in again
    //    and pushes the new SID "new" to the widget.
    // 4. The widget gets the 401.
    // Expected: "new" stays valid.
    @Test
    fun authFailureKeepsASidRenewedMeanwhile() {
        useRealPrefs()
        server.dispatcher = authFailure(renewFirst = true)

        runWorker()

        assertSession(sid = "new", usable = true)
    }
}

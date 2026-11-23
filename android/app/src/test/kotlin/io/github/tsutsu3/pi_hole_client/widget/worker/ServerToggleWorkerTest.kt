package io.github.tsutsu3.pi_hole_client.widget.worker

import android.content.Context
import androidx.test.core.app.ApplicationProvider
import androidx.work.testing.TestListenableWorkerBuilder
import androidx.work.workDataOf
import io.github.tsutsu3.pi_hole_client.widget.WidgetConstants
import io.github.tsutsu3.pi_hole_client.widget.WidgetUpdateHelper
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
import org.json.JSONObject
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class ServerToggleWorkerTest {

    private lateinit var server: MockWebServer
    private lateinit var prefs: WidgetPrefs
    private lateinit var serverId: String

    @Before
    fun setUp() {
        server = MockWebServer()
        server.start()
        serverId = server.url("/").toString().trimEnd('/')

        val mock = io.mockk.mockk<WidgetPrefs>(relaxed = true)
        every { mock.getServerInfo(serverId) } returns testServer(serverId)
        every { mock.getWidgetIdsForServer(any(), any()) } returns IntArray(0)
        mockkObject(WidgetPrefs.Companion)
        every { WidgetPrefs.getInstance(any()) } returns mock
        prefs = mock

        // The follow-up PADD refresh needs a real WorkManager; not under test.
        mockkObject(WidgetUpdateHelper)
        every { WidgetUpdateHelper.enqueueServerPadd(any(), any(), any()) } returns Unit
        every { WidgetUpdateHelper.refreshWidgetsForServer(any(), any(), any(), any(), any()) } returns Unit
        every { WidgetUpdateHelper.scheduleDelayedRefresh(any(), any(), any()) } returns Unit
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

    private fun runWorker() = runBlocking {
        TestListenableWorkerBuilder<ServerToggleWorker>(
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

    /**
     * Answers 401 to [method] and 200 to the other one. With [renewFirst], the
     * app pushes the SID "new" before the 401.
     */
    private fun authFailureOn(method: String, renewFirst: Boolean) = object : Dispatcher() {
        override fun dispatch(request: RecordedRequest): MockResponse {
            if (request.method != method) {
                return MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}""")
            }
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
    fun emptySidSendsBothRequestsWithoutSidHeader() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))
        server.enqueue(MockResponse().setResponseCode(200).setBody("{}"))

        runWorker()

        assertEquals(2, server.requestCount)
        val get = server.takeRequest()
        assertEquals("GET", get.method)
        assertNull(get.getHeader("X-FTL-SID"))
        val post = server.takeRequest()
        assertEquals("POST", post.method)
        assertNull(post.getHeader("X-FTL-SID"))
    }

    @Test
    fun disableHasNoTimerByDefault() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        every { prefs.widgetDisableDuration } returns 0L
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))
        server.enqueue(MockResponse().setResponseCode(200).setBody("{}"))

        runWorker()

        server.takeRequest()
        val body = JSONObject(server.takeRequest().body.readUtf8())
        assertEquals(false, body.getBoolean("blocking"))
        assertTrue(body.isNull("timer"))
        verify(exactly = 0) { WidgetUpdateHelper.scheduleDelayedRefresh(any(), any(), any()) }
    }

    @Test
    fun disableUsesTheWidgetDisableDuration() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        every { prefs.widgetDisableDuration } returns 3600L
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))
        server.enqueue(MockResponse().setResponseCode(200).setBody("{}"))

        runWorker()

        server.takeRequest()
        val body = JSONObject(server.takeRequest().body.readUtf8())
        assertEquals(false, body.getBoolean("blocking"))
        assertEquals(3600L, body.getLong("timer"))
        verify { WidgetUpdateHelper.scheduleDelayedRefresh(any(), serverId, 3600L) }
    }

    @Test
    fun enableNeverHasATimer() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        every { prefs.widgetDisableDuration } returns 3600L
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"disabled"}"""))
        server.enqueue(MockResponse().setResponseCode(200).setBody("{}"))

        runWorker()

        server.takeRequest()
        val body = JSONObject(server.takeRequest().body.readUtf8())
        assertEquals(true, body.getBoolean("blocking"))
        assertTrue(body.isNull("timer"))
    }

    @Test
    fun authFailureOnTheStatusGetInvalidatesTheSession() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        every { prefs.invalidateSidIfCurrent(serverId, "") } returns true
        server.enqueue(MockResponse().setResponseCode(401))

        runWorker()

        verify { prefs.invalidateSidIfCurrent(serverId, "") }
    }

    @Test
    fun authFailureWithANewerSidStopsWithoutRefreshing() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns "old"
        // The app pushed a new SID while the request was in flight.
        every { prefs.invalidateSidIfCurrent(serverId, "old") } returns false
        server.enqueue(MockResponse().setResponseCode(401))

        runWorker()

        // sidUpdated has already queued a refresh with the new SID.
        verify(exactly = 0) { WidgetUpdateHelper.refreshWidgetsForServer(any(), any(), any(), any(), any()) }
        verify(exactly = 0) { prefs.setSidValid(serverId, false) }
        // The worker must stop here: no widget state is published (broadcast
        // looks up the bound widgets first), so no "auth required" flicker.
        verify(exactly = 0) { prefs.getWidgetIdsForServer(any(), any()) }
        assertEquals(1, server.requestCount)
    }

    @Test
    fun authFailureOnTheTogglePostInvalidatesTheSession() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))
        server.enqueue(MockResponse().setResponseCode(401))
        every { prefs.invalidateSidIfCurrent(serverId, "") } returns true

        runWorker()

        verify { prefs.invalidateSidIfCurrent(serverId, "") }
    }

    @Test
    fun removedServerHandsResetToRefreshWorkers() {
        every { prefs.getServerInfo(serverId) } returns null

        runWorker()

        verify { WidgetUpdateHelper.refreshWidgetsForServer(any(), serverId, any(), any(), any()) }
        assertEquals(0, server.requestCount)
    }

    // 1. The widget holds an expired SID "old".
    // 2. The user taps the toggle. The widget sends the status GET with "old".
    // 3. Pi-hole answers 401.
    // 4. The app does nothing.
    // Expected: "old" becomes invalid.
    @Test
    fun authFailureOnTheStatusGetInvalidatesTheSidItUsed() {
        useRealPrefs()
        server.dispatcher = authFailureOn("GET", renewFirst = false)

        runWorker()

        assertSession(sid = "old", usable = false)
    }

    // 1. The widget holds an expired SID "old".
    // 2. The user taps the toggle. The widget sends the status GET with "old".
    // 3. Before the 401 arrives, the user opens the app. The app logs in again
    //    and pushes the new SID "new" to the widget.
    // 4. The widget gets the 401.
    // Expected: "new" stays valid.
    @Test
    fun authFailureOnTheStatusGetKeepsASidRenewedMeanwhile() {
        useRealPrefs()
        server.dispatcher = authFailureOn("GET", renewFirst = true)

        runWorker()

        assertSession(sid = "new", usable = true)
    }

    // 1. The widget holds the SID "old".
    // 2. The user taps the toggle. The status GET with "old" succeeds.
    // 3. The widget sends the toggle POST with "old". Pi-hole answers 401.
    // 4. The app does nothing.
    // Expected: "old" becomes invalid.
    @Test
    fun authFailureOnTheTogglePostInvalidatesTheSidItUsed() {
        useRealPrefs()
        server.dispatcher = authFailureOn("POST", renewFirst = false)

        runWorker()

        assertSession(sid = "old", usable = false)
    }

    // 1. The widget holds the SID "old".
    // 2. The user taps the toggle. The status GET with "old" succeeds.
    // 3. The widget sends the toggle POST with "old".
    // 4. Before the 401 arrives, the user opens the app. The app logs in again
    //    and pushes the new SID "new" to the widget.
    // 5. The widget gets the 401.
    // Expected: "new" stays valid.
    @Test
    fun authFailureOnTheTogglePostKeepsASidRenewedMeanwhile() {
        useRealPrefs()
        server.dispatcher = authFailureOn("POST", renewFirst = true)

        runWorker()

        assertSession(sid = "new", usable = true)
    }
}

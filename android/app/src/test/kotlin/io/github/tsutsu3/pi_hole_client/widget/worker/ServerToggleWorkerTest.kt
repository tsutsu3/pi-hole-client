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
import io.mockk.verify
import kotlinx.coroutines.runBlocking
import okhttp3.mockwebserver.MockResponse
import okhttp3.mockwebserver.MockWebServer
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNull
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
        every { mock.getServerInfo(serverId) } returns WidgetServer(
            serverId = serverId,
            alias = "test",
            address = serverId,
            apiVersion = "v6",
            allowUntrustedCert = false,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = null,
        )
        every { mock.getWidgetIdsForServer(any(), any()) } returns IntArray(0)
        mockkObject(WidgetPrefs.Companion)
        every { WidgetPrefs.getInstance(any()) } returns mock
        prefs = mock

        // The follow-up PADD refresh needs a real WorkManager; not under test.
        mockkObject(WidgetUpdateHelper)
        every { WidgetUpdateHelper.enqueueServerPadd(any(), any(), any()) } returns Unit
    }

    @After
    fun tearDown() {
        server.shutdown()
        unmockkAll()
    }

    private fun runWorker() = runBlocking {
        TestListenableWorkerBuilder<ServerToggleWorker>(
            ApplicationProvider.getApplicationContext<Context>(),
        )
            .setInputData(workDataOf(WidgetConstants.EXTRA_SERVER_ID to serverId))
            .build()
            .doWork()
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
    fun authFailureOnTheStatusGetInvalidatesTheSession() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        server.enqueue(MockResponse().setResponseCode(401))

        runWorker()

        verify { prefs.setSidValid(serverId, false) }
    }

    @Test
    fun authFailureOnTheTogglePostInvalidatesTheSession() {
        every { prefs.hasUsableSession(serverId) } returns true
        every { prefs.getSid(serverId) } returns ""
        server.enqueue(MockResponse().setResponseCode(200).setBody("""{"blocking":"enabled"}"""))
        server.enqueue(MockResponse().setResponseCode(401))

        runWorker()

        verify { prefs.setSidValid(serverId, false) }
    }
}

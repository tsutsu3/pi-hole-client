package io.github.tsutsu3.pi_hole_client.widget.common

import okhttp3.mockwebserver.MockResponse
import okhttp3.mockwebserver.MockWebServer
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test
import org.junit.runner.RunWith
import org.robolectric.RobolectricTestRunner

@RunWith(RobolectricTestRunner::class)
class PiHoleApiClientTest {

    private lateinit var server: MockWebServer
    private lateinit var client: PiHoleApiClient

    @Before
    fun setUp() {
        server = MockWebServer()
        server.start()

        // Default client with standard TLS validation
        client = PiHoleApiClient(
            allowSelfSigned = false,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = null
        )
    }

    @After
    fun tearDown() {
        server.shutdown()
    }

    @Test
    fun get_includesSidHeader() {
        // Enqueue a mock response
        server.enqueue(MockResponse().setBody("{\"status\":\"enabled\"}"))

        // Execute GET request with SID
        val url = server.url("/api/status").toString()
        val response = client.get(url, "test-sid-123")

        // Verify request includes X-FTL-SID header
        val request = server.takeRequest()
        assertEquals("GET", request.method)
        assertEquals("test-sid-123", request.getHeader("X-FTL-SID"))
        assertEquals("application/json", request.getHeader("Content-Type"))
    }

    @Test
    fun get_withoutSid_noSidHeader() {
        // Enqueue a mock response
        server.enqueue(MockResponse().setBody("{\"status\":\"enabled\"}"))

        // Execute GET request without SID
        val url = server.url("/api/status").toString()
        val response = client.get(url, null)

        // Verify request does not include X-FTL-SID header
        val request = server.takeRequest()
        assertEquals("GET", request.method)
        assertEquals(null, request.getHeader("X-FTL-SID"))
    }

    @Test
    fun post_sendsJsonBody() {
        // Enqueue a mock response
        server.enqueue(MockResponse().setBody("{\"success\":true}"))

        // Execute POST request with JSON body
        val url = server.url("/api/toggle").toString()
        val requestBody = "{\"blocking\":\"disabled\"}"
        val response = client.post(url, "test-sid-456", requestBody)

        // Verify request includes body and headers
        val request = server.takeRequest()
        assertEquals("POST", request.method)
        assertEquals("test-sid-456", request.getHeader("X-FTL-SID"))
        assertEquals("application/json", request.getHeader("Content-Type"))
        assertEquals(requestBody, request.body.readUtf8())
    }

    @Test
    fun post_withoutSid_noSidHeader() {
        // Enqueue a mock response
        server.enqueue(MockResponse().setBody("{\"success\":true}"))

        // Execute POST request without SID
        val url = server.url("/api/toggle").toString()
        val requestBody = "{\"blocking\":\"enabled\"}"
        val response = client.post(url, null, requestBody)

        // Verify request does not include X-FTL-SID header
        val request = server.takeRequest()
        assertEquals("POST", request.method)
        assertEquals(null, request.getHeader("X-FTL-SID"))
        assertEquals(requestBody, request.body.readUtf8())
    }

    @Test
    fun isAuthFailure_with401() {
        // 401 should be detected as auth failure
        assertTrue(PiHoleApiClient.isAuthFailure(401, ""))
    }

    @Test
    fun isAuthFailure_with403() {
        // 403 should be detected as auth failure
        assertTrue(PiHoleApiClient.isAuthFailure(403, ""))
    }

    @Test
    fun isAuthFailure_withUnauthorizedInBody() {
        // 200 with "unauthorized" in body should be detected as auth failure
        assertTrue(PiHoleApiClient.isAuthFailure(200, "Error: unauthorized access"))
        assertTrue(PiHoleApiClient.isAuthFailure(200, "Unauthorized request"))
        assertTrue(PiHoleApiClient.isAuthFailure(200, "UNAUTHORIZED"))
    }

    @Test
    fun isAuthFailure_withForbiddenInBody() {
        // 200 with "forbidden" in body should be detected as auth failure
        assertTrue(PiHoleApiClient.isAuthFailure(200, "Error: forbidden resource"))
        assertTrue(PiHoleApiClient.isAuthFailure(200, "Forbidden access"))
        assertTrue(PiHoleApiClient.isAuthFailure(200, "FORBIDDEN"))
    }

    @Test
    fun isAuthFailure_withSuccessResponse() {
        // 200 with normal body should not be detected as auth failure
        assertFalse(PiHoleApiClient.isAuthFailure(200, "{\"status\":\"enabled\"}"))
        assertFalse(PiHoleApiClient.isAuthFailure(200, "success"))
    }

    @Test
    fun canConnect_withHttpUrl_alwaysReturnsTrue() {
        // HTTP URLs should always be allowed (no certificate validation)
        val httpClient = PiHoleApiClient(
            allowSelfSigned = false,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = null
        )
        assertTrue(httpClient.canConnect("http://pihole.local"))
        assertTrue(httpClient.canConnect("HTTP://PIHOLE.LOCAL"))
    }

    @Test
    fun canConnect_withIgnoreCertErrors_alwaysReturnsTrue() {
        // Client with ignoreCertificateErrors should always allow connection
        val ignoreCertClient = PiHoleApiClient(
            allowSelfSigned = false,
            ignoreCertificateErrors = true,
            pinnedCertificateSha256 = null
        )
        assertTrue(ignoreCertClient.canConnect("https://pihole.local"))
        assertTrue(ignoreCertClient.canConnect("https://self-signed.example.com"))
    }

    @Test
    fun canConnect_withSelfSignedAndPin_returnsTrue() {
        // Client with self-signed allowed and pinned cert should allow connection
        val pinnedClient = PiHoleApiClient(
            allowSelfSigned = true,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = "abc123def456"
        )
        assertTrue(pinnedClient.canConnect("https://pihole.local"))
    }

    @Test
    fun canConnect_withSelfSignedButNoPinnedCert_returnsFalse() {
        // Client with self-signed allowed but no pinned cert should reject
        val noPinClient = PiHoleApiClient(
            allowSelfSigned = true,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = null
        )
        assertFalse(noPinClient.canConnect("https://pihole.local"))

        // Empty pin should also reject
        val emptyPinClient = PiHoleApiClient(
            allowSelfSigned = true,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = ""
        )
        assertFalse(emptyPinClient.canConnect("https://pihole.local"))
    }

    @Test
    fun canConnect_withStandardTls_returnsTrue() {
        // Standard TLS client should allow connection
        val standardClient = PiHoleApiClient(
            allowSelfSigned = false,
            ignoreCertificateErrors = false,
            pinnedCertificateSha256 = null
        )
        assertTrue(standardClient.canConnect("https://pihole.local"))
    }

    @Test
    fun responseBody_parsedCorrectly() {
        // Enqueue a mock response with JSON body
        val responseBody = "{\"status\":\"enabled\",\"queries\":50000}"
        server.enqueue(MockResponse()
            .setResponseCode(200)
            .setBody(responseBody))

        // Execute GET request
        val url = server.url("/api/status").toString()
        val response = client.get(url, "test-sid")

        // Verify response is parsed correctly
        assertEquals(200, response.statusCode)
        assertEquals(responseBody, response.body)
    }

    @Test
    fun responseBody_errorResponse_parsedCorrectly() {
        // Enqueue a 404 error response
        val errorBody = "{\"error\":\"Not found\"}"
        server.enqueue(MockResponse()
            .setResponseCode(404)
            .setBody(errorBody))

        // Execute GET request
        val url = server.url("/api/invalid").toString()
        val response = client.get(url, "test-sid")

        // Verify error response is parsed correctly
        assertEquals(404, response.statusCode)
        assertEquals(errorBody, response.body)
    }

    @Test
    fun responseBody_emptyErrorStream_handledGracefully() {
        // Enqueue a 500 error with no body
        server.enqueue(MockResponse()
            .setResponseCode(500)
            .setBody(""))

        // Execute GET request
        val url = server.url("/api/error").toString()
        val response = client.get(url, "test-sid")

        // Verify empty error is handled gracefully
        assertEquals(500, response.statusCode)
        assertEquals("", response.body)
    }

    @Test
    fun get_withSuccessResponse_returnsCorrectData() {
        // Enqueue a successful response with data
        val jsonResponse = "{\"dns_queries_today\":50000,\"ads_blocked_today\":10000,\"ads_percentage_today\":20.0}"
        server.enqueue(MockResponse()
            .setResponseCode(200)
            .setBody(jsonResponse))

        // Execute GET request
        val url = server.url("/api/padd").toString()
        val response = client.get(url, "valid-sid")

        // Verify response
        assertEquals(200, response.statusCode)
        assertEquals(jsonResponse, response.body)
        assertFalse(PiHoleApiClient.isAuthFailure(response.statusCode, response.body))
    }

    @Test
    fun post_withSuccessResponse_returnsCorrectData() {
        // Enqueue a successful toggle response
        val jsonResponse = "{\"blocking\":\"disabled\"}"
        server.enqueue(MockResponse()
            .setResponseCode(200)
            .setBody(jsonResponse))

        // Execute POST request
        val url = server.url("/api/dns/blocking").toString()
        val response = client.post(url, "valid-sid", "{\"blocking\":\"disabled\"}")

        // Verify response
        assertEquals(200, response.statusCode)
        assertEquals(jsonResponse, response.body)
    }

    @Test
    fun get_withAuthFailure_returns401() {
        // Enqueue an auth failure response
        server.enqueue(MockResponse()
            .setResponseCode(401)
            .setBody("Unauthorized"))

        // Execute GET request
        val url = server.url("/api/padd").toString()
        val response = client.get(url, "invalid-sid")

        // Verify auth failure is detected
        assertEquals(401, response.statusCode)
        assertTrue(PiHoleApiClient.isAuthFailure(response.statusCode, response.body))
    }
}

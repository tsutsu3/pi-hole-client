package io.github.tsutsu3.pi_hole_client.widget

import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import javax.net.ssl.HostnameVerifier
import javax.net.ssl.HttpsURLConnection
import javax.net.ssl.SSLContext
import javax.net.ssl.TrustManager
import javax.net.ssl.X509TrustManager

/**
 * Minimal HTTP response payload for widget usage.
 *
 * Widgets avoid heavier networking stacks to keep dependencies small.
 */
data class ApiResponse(val statusCode: Int, val body: String)

/**
 * Lightweight HTTP client for widget polling and toggling.
 *
 * Authentication is handled by Flutter; this client only attaches a provided SID.
 */
class PiHoleApiClient(private val allowSelfSigned: Boolean) {
    /**
     * Executes a GET request to the Pi-hole API.
     */
    fun get(url: String, sid: String?): ApiResponse {
        val connection = openConnection(url)
        connection.requestMethod = "GET"
        connection.setRequestProperty("Content-Type", "application/json")
        if (!sid.isNullOrEmpty()) {
            connection.setRequestProperty("X-FTL-SID", sid)
        }
        return readResponse(connection)
    }

    /**
     * Executes a POST request to the Pi-hole API.
     */
    fun post(url: String, sid: String?, body: String): ApiResponse {
        val connection = openConnection(url)
        connection.requestMethod = "POST"
        connection.doOutput = true
        connection.setRequestProperty("Content-Type", "application/json")
        if (!sid.isNullOrEmpty()) {
            connection.setRequestProperty("X-FTL-SID", sid)
        }
        connection.outputStream.use { output ->
            output.write(body.toByteArray())
        }
        return readResponse(connection)
    }

    /**
     * Opens an HTTP connection and configures TLS when self-signed certs are allowed.
     */
    private fun openConnection(url: String): HttpURLConnection {
        val connection = URL(url).openConnection() as HttpURLConnection
        if (connection is HttpsURLConnection && allowSelfSigned) {
            // Widgets may connect to local Pi-hole instances with self-signed certs.
            val trustAll = arrayOf<TrustManager>(
                object : X509TrustManager {
                    override fun checkClientTrusted(chain: Array<java.security.cert.X509Certificate>, authType: String) {}
                    override fun checkServerTrusted(chain: Array<java.security.cert.X509Certificate>, authType: String) {}
                    override fun getAcceptedIssuers(): Array<java.security.cert.X509Certificate> = emptyArray()
                },
            )
            val sslContext = SSLContext.getInstance("TLS")
            sslContext.init(null, trustAll, java.security.SecureRandom())
            connection.sslSocketFactory = sslContext.socketFactory
            connection.hostnameVerifier = HostnameVerifier { _, _ -> true }
        }
        // Keep timeouts short to avoid blocking widget refresh.
        connection.connectTimeout = 10000
        connection.readTimeout = 10000
        return connection
    }

    /**
     * Reads the response body and normalizes empty error streams.
     */
    private fun readResponse(connection: HttpURLConnection): ApiResponse {
        val statusCode = connection.responseCode
        val stream = if (statusCode in 200..299) {
            connection.inputStream
        } else {
            connection.errorStream
        }
        val body = if (stream != null) {
            BufferedReader(InputStreamReader(stream)).use { it.readText() }
        } else {
            ""
        }
        connection.disconnect()
        return ApiResponse(statusCode, body)
    }
}

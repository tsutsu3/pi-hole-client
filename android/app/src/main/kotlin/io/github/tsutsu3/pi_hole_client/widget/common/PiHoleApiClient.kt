package io.github.tsutsu3.pi_hole_client.widget.common

import android.util.Log
import java.io.BufferedReader
import java.io.InputStreamReader
import java.net.HttpURLConnection
import java.net.URL
import java.security.MessageDigest
import java.security.cert.CertificateException
import java.security.cert.X509Certificate
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
 * Uses [HttpURLConnection] intentionally instead of OkHttp or Retrofit to avoid
 * pulling heavy networking dependencies into the widget. Widgets run in a
 * restricted WorkManager context where APK size and class-loading overhead matter,
 * and the widget only makes two simple calls (GET stats, POST toggle).
 *
 * Authentication is handled by Flutter; this client only attaches a provided SID.
 *
 * ## TLS certificate validation modes
 *
 * | ignoreCertErrors | allowSelfSigned | pinnedSha256 | Behaviour               |
 * |------------------|-----------------|--------------|-------------------------|
 * | true             | any             | any          | Skip all TLS validation |
 * | false            | true            | non-null     | Verify SHA-256 pin      |
 * | false            | true            | null         | Reject (pin required)   |
 * | false            | false           | any          | Standard TLS            |
 */
class PiHoleApiClient(
    private val allowSelfSigned: Boolean,
    private val ignoreCertificateErrors: Boolean,
    private val pinnedCertificateSha256: String?,
) {

    companion object {
        private const val TAG = "PiHoleApiClient"

        /**
         * Detects auth failures from either HTTP status code or body content.
         *
         * Pi-hole v6 returns 401/403 for expired or invalid SIDs, but some
         * proxy setups may wrap the error in a 200 body instead.
         */
        fun isAuthFailure(statusCode: Int, body: String): Boolean {
            if (statusCode == 401 || statusCode == 403) return true
            return body.contains("unauthorized", ignoreCase = true) ||
                body.contains("forbidden", ignoreCase = true)
        }
    }

    /**
     * Whether this client can actually connect given the current TLS settings.
     *
     * Returns `false` when self-signed certs are allowed but no pinned
     * fingerprint is configured — the widget refuses to trust arbitrary
     * certificates and requires the user to pin one via the app.
     *
     * For HTTP URLs, always returns `true` since certificate validation
     * is not applicable to cleartext traffic.
     */
    fun canConnect(serverAddress: String): Boolean {
        // HTTP doesn't use certificates, so always allow connection
        if (serverAddress.startsWith("http://", ignoreCase = true)) {
            return true
        }

        // HTTPS certificate validation logic
        if (ignoreCertificateErrors) return true
        if (allowSelfSigned && pinnedCertificateSha256.isNullOrEmpty()) return false
        return true
    }

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
     * Opens an HTTP connection and configures TLS based on the server's
     * certificate validation mode.
     */
    private fun openConnection(url: String): HttpURLConnection {
        Log.d(TAG, "Opening connection to: $url")
        val connection = URL(url).openConnection() as HttpURLConnection
        Log.d(TAG, "Connection type: ${connection.javaClass.simpleName}")
        if (connection is HttpsURLConnection) {
            configureTls(connection)
        }
        // Keep timeouts short to avoid blocking widget refresh.
        connection.connectTimeout = 10000
        connection.readTimeout = 10000
        return connection
    }

    /**
     * Applies the appropriate TLS configuration to an HTTPS connection.
     *
     * Priority order matches Flutter's `createHttpClient()`:
     * 1. `ignoreCertificateErrors` — trust everything (legacy / explicit opt-in)
     * 2. `allowSelfSigned` with pin — verify SHA-256 fingerprint
     * 3. default — standard platform TLS validation
     *
     * Note: `allowSelfSigned` without a pin is rejected before reaching this
     * method (see [canConnect]).
     */
    private fun configureTls(connection: HttpsURLConnection) {
        when {
            ignoreCertificateErrors -> {
                // Skip all validation. Used by legacy users (pre-v9 migration)
                // and users who explicitly enable "Don't check SSL certificate".
                val trustAll = arrayOf<TrustManager>(TrustAllManager())
                val sslContext = SSLContext.getInstance("TLS")
                sslContext.init(null, trustAll, java.security.SecureRandom())
                connection.sslSocketFactory = sslContext.socketFactory
                connection.hostnameVerifier = HostnameVerifier { _, _ -> true }
            }

            allowSelfSigned && !pinnedCertificateSha256.isNullOrEmpty() -> {
                // Accept only if the server certificate's SHA-256 fingerprint
                // matches the pinned value configured in the app.
                val pinningManager = CertificatePinningTrustManager(pinnedCertificateSha256)
                val sslContext = SSLContext.getInstance("TLS")
                sslContext.init(null, arrayOf<TrustManager>(pinningManager), java.security.SecureRandom())
                connection.sslSocketFactory = sslContext.socketFactory
                // Hostname verification is relaxed because the certificate is
                // pinned by fingerprint, not by CN/SAN — self-signed certs
                // typically lack a matching hostname entry.
                connection.hostnameVerifier = HostnameVerifier { _, _ -> true }
            }

            // else: standard platform TLS — no custom configuration needed.
        }
    }

    /**
     * Reads the response body and normalizes empty error streams.
     */
    private fun readResponse(connection: HttpURLConnection): ApiResponse {
        return try {
            val statusCode = connection.responseCode
            Log.d(TAG, "Response code: $statusCode")
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
            ApiResponse(statusCode, body)
        } catch (e: Exception) {
            Log.e(TAG, "Connection failed", e)
            // Return error response with detailed exception info
            ApiResponse(-1, "Connection error: ${e.javaClass.simpleName}: ${e.message}")
        }
    }

    /**
     * TrustManager that accepts all certificates without validation.
     *
     * Only used when [ignoreCertificateErrors] is true.
     */
    private class TrustAllManager : X509TrustManager {
        override fun checkClientTrusted(chain: Array<X509Certificate>, authType: String) {}
        override fun checkServerTrusted(chain: Array<X509Certificate>, authType: String) {}
        override fun getAcceptedIssuers(): Array<X509Certificate> = emptyArray()
    }

    /**
     * TrustManager that validates the server certificate against a pinned
     * SHA-256 fingerprint.
     *
     * Rejects the connection if the leaf certificate's fingerprint does not
     * match [pinnedSha256].
     */
    private class CertificatePinningTrustManager(
        private val pinnedSha256: String,
    ) : X509TrustManager {

        override fun checkClientTrusted(chain: Array<X509Certificate>, authType: String) {}

        override fun checkServerTrusted(chain: Array<X509Certificate>, authType: String) {
            if (chain.isEmpty()) {
                throw CertificateException("Empty certificate chain")
            }
            val leaf = chain[0]
            val digest = MessageDigest.getInstance("SHA-256")
            val sha256Bytes = digest.digest(leaf.encoded)
            val certFingerprint = sha256Bytes.joinToString("") { "%02x".format(it) }
            val normalizedPin = pinnedSha256.replace(":", "").lowercase().trim()

            if (certFingerprint != normalizedPin) {
                Log.w(TAG, "Certificate pin mismatch: expected=$normalizedPin actual=$certFingerprint")
                throw CertificateException(
                    "Certificate fingerprint mismatch: expected $normalizedPin but got $certFingerprint",
                )
            }
        }

        override fun getAcceptedIssuers(): Array<X509Certificate> = emptyArray()
    }
}

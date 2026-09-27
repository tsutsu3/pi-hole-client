package io.github.tsutsu3.pi_hole_client.widget.common

import org.junit.Assert.assertEquals
import org.junit.Test

class ServerUrlTest {

    @Test
    fun `appends the path to an address without a subroute`() {
        assertEquals("http://pi.hole/api/padd", piholeUrl("http://pi.hole", "/api/padd"))
    }

    @Test
    fun `keeps the subroute`() {
        assertEquals(
            "https://example.com:8443/pihole/api/padd",
            piholeUrl("https://example.com:8443/pihole", "/api/padd"),
        )
    }

    @Test
    fun `ignores a trailing slash on the address`() {
        assertEquals(
            "http://pi.hole/pihole/api/padd",
            piholeUrl("http://pi.hole/pihole/", "/api/padd"),
        )
    }

    @Test
    fun `removes a trailing admin segment from the subroute`() {
        assertEquals("http://pi.hole/api/padd", piholeUrl("http://pi.hole/admin", "/api/padd"))
        assertEquals(
            "http://pi.hole/pihole/api/padd",
            piholeUrl("http://pi.hole/pihole/admin", "/api/padd"),
        )
    }

    @Test
    fun `keeps a host named admin`() {
        assertEquals("http://admin/api/padd", piholeUrl("http://admin", "/api/padd"))
    }
}

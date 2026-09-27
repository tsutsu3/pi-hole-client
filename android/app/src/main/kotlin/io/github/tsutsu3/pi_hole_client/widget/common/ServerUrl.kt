package io.github.tsutsu3.pi_hole_client.widget.common

private const val ADMIN_SEGMENT = "/admin"

/**
 * Builds a Pi-hole URL from a server [address] and an absolute Pi-hole [path]
 * such as `/api/padd`.
 *
 * The subroute in [address] is kept, so `http://host/pihole` and `/api/padd`
 * give `http://host/pihole/api/padd`.
 *
 * A trailing `/admin` in the subroute is removed. Older docs told users to
 * enter the web panel path as the subroute. This matches `buildPiholeUri` on
 * the Flutter side.
 */
fun piholeUrl(address: String, path: String): String {
    val base = address.trimEnd('/')
    val pathStart = base.indexOf('/', base.indexOf("://") + 3)
    val hasAdminSegment = pathStart >= 0 && base.endsWith(ADMIN_SEGMENT)

    return (if (hasAdminSegment) base.removeSuffix(ADMIN_SEGMENT) else base) + path
}

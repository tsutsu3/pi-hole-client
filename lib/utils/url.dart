/// Compares two server URLs ignoring scheme/host case, a trailing slash and a
/// scheme's default port.
///
/// Re-deriving the URL from the form fields lower-cases the host (via
/// [Uri.parse]), so a plain string compare against the stored address would
/// report a false "address changed" for an alias-only edit and wrongly take the
/// destructive replace path. This normalises both sides.
bool isSameEndpoint(String a, String b) {
  String normalize(String url) {
    final uri = Uri.parse(url);
    var path = uri.path == '/' ? '' : uri.path;
    if (path.endsWith('/')) {
      path = path.substring(0, path.length - 1);
    }
    // [Uri.port] resolves the scheme's default (80/443), so an explicit default
    // port and an omitted one normalise to the same endpoint.
    // (e.g. https://pi.hole == https://pi.hole:443).
    final port = uri.port != 0 ? ':${uri.port}' : '';
    return '${uri.scheme.toLowerCase()}://${uri.host.toLowerCase()}$port$path';
  }

  try {
    return normalize(a) == normalize(b);
  } catch (_) {
    return a == b;
  }
}

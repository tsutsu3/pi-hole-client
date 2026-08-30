/// Builds a server URL from its component parts.
String buildServerUrl({
  required String scheme,
  required String host,
  String port = '',
  String subroute = '',
}) {
  final portSegment = port != '' ? ':$port' : '';
  return '$scheme://$host$portSegment$subroute';
}

/// Compares two server URLs ignoring scheme/host case and a trailing slash.
///
/// Re-deriving the URL from the form fields lower-cases the host (via
/// [Uri.parse]), so a plain string comparison against the stored address would
/// report a false "address changed" for an alias-only edit and wrongly take the
/// destructive replace path.
///
/// Explicit ports are preserved, including scheme defaults such as :80 and
/// :443.
bool isSameEndpoint(String a, String b) {
  String normalize(String url) {
    final uri = Uri.parse(url);
    final splitted = url.split(':');

    var path = uri.path == '/' ? '' : uri.path;
    if (path.endsWith('/')) {
      path = path.substring(0, path.length - 1);
    }

    // Uri normalizes explicit default ports such as :80 and :443, so preserve
    // the port from the original URL instead.
    // e.g.) http://localhost != http://localhost:80
    final port = splitted.length > 2 ? ':${splitted[2].split('/')[0]}' : '';

    return '${uri.scheme.toLowerCase()}://${uri.host.toLowerCase()}$port$path';
  }

  try {
    return normalize(a) == normalize(b);
  } catch (_) {
    return a == b;
  }
}

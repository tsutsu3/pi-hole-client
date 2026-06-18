// Pure form-field validators for the add/edit server screen.
//
// These hold only the format rules. The widget keeps the error messages and
// state updates; it calls these to decide whether a value is valid.

final _ipAddress = RegExp(r'^((25[0-5]|(2[0-4]|1\d|[1-9]|)\d)(\.(?!$)|$)){4}$');
final _domain = RegExp(r'^(([a-z0-9|-]+\.)*[a-z0-9|-]+\.[a-z]+)|((\w|-)+)$');
final _subroute = RegExp(r'^\/\b([A-Za-z0-9_\-~/]*)[^\/|\.|\:]$');

/// Whether [value] is a valid IPv4 address or host/domain name.
bool isValidServerAddress(String value) =>
    _ipAddress.hasMatch(value) || _domain.hasMatch(value);

/// Whether [value] is a valid port number (an integer in 0..65535).
bool isValidPort(String value) {
  final port = int.tryParse(value);
  return port != null && port >= 0 && port <= 65535;
}

/// Whether [value] is a valid subroute (leading slash, allowed characters,
/// no trailing slash/dot/colon).
bool isValidSubroute(String value) => _subroute.hasMatch(value);

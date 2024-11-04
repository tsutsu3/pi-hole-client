import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/models/server.dart';
import '../../models/api/auth.dart';

/// Exception thrown when the API version is not supported
class UnsupportedApiVersionException implements Exception {
  final String message;
  UnsupportedApiVersionException(this.message);

  @override
  String toString() => 'UnsupportedApiVersionException: $message';
}

/// Check if the basic auth is valid
///
/// Returns `true` if the username and password are not null or empty
bool checkBasicAuth(String? usernamae, String? password) {
  if (usernamae != null &&
      usernamae.isNotEmpty &&
      password != null &&
      password.isNotEmpty) {
    return true;
  }

  return false;
}

/// Check if the API version is v5
///
/// Returns `true` if the API version is v5
Future<bool> checkApiVersionIsV5(Server server) async {
  try {
    final response = await httpClient(
      method: 'get',
      url: '${server.address}/admin/api.php?versions',
    );

    if (response.statusCode != 200) return false;

    final body = jsonDecode(response.body);

    if (body['web_current'] == null) return false;

    if (body['web_current'].startsWith('v5.')) return true;

    return false;
  } on http.ClientException {
    return false;
  } catch (e) {
    return false;
  }
}

/// Check if the API version is v6
///
/// Returns `true` if the API version is v6
Future<bool> checkApiVersionIsV6(Server server) async {
  try {
    final response = await httpClient(
      method: 'get',
      url: '${server.address}/api/info/version',
    );

    if (response.statusCode != 200) return false;

    final body = jsonDecode(response.body);

    if (body['version'] == null) return false;
    if (body['version']['web'] == null) return false;
    if (body['version']['web']['local'] == null) return false;
    if (body['version']['web']['local']['version'] == null) return false;

    if (body['web_current'].startsWith('v6.')) return true;

    return false;
  } on http.ClientException {
    return false;
  } catch (e) {
    return false;
  }
}

/// Get pi-hole API version
///
/// Returns the API version of the pi-hole [v5, v6]
Future<String> getApiVersion(Server server) async {
  if (await checkApiVersionIsV5(server)) {
    return 'v5';
  } else if (await checkApiVersionIsV6(server)) {
    return 'v6';
  }

  throw UnsupportedApiVersionException('Unsupported API version');
}

/// Http Client
///
/// Sends an HTTP request to the specified URL with the specified method, headers, and body.
///
/// Authentication methods include API key, session ID, and basic authentication.
/// Use API key and basic authentication for v5 and session ID for v6.
Future<Response> httpClient({
  /// The URL to send the request to
  required String url,

  /// The HTTP method to use
  required String method,

  /// The timeout for the request. Default is 10 seconds
  int timeout = 10,

  /// The headers to send with the request
  Map<String, String>? headers,

  /// The body of the request
  Map<String, dynamic>? body,

  /// The API key to use for authentication. Use v5 only
  String? apiKey,

  /// The basic authentication credentials to use for authentication. Use v5 only
  BasicAuth? basicAuth,

  /// The session ID to use for authentication. Use v6 only
  String? sid,
}) async {
  final Map<String, String> authHeaders = headers != null ? {...headers} : {};

  if (sid != null) {
    authHeaders['X-FTL-SID'] = sid;
  }

  if (basicAuth != null &&
      checkBasicAuth(basicAuth.username, basicAuth.password)) {
    final String encodedAuth = base64Encode(
        utf8.encode('${basicAuth.username}:${basicAuth.password}'));
    authHeaders['Authorization'] = 'Basic $encodedAuth';
  }

  switch (method.toUpperCase()) {
    case 'GET':
      return await http
          .get(
            Uri.parse(url),
            headers: authHeaders,
          )
          .timeout(Duration(seconds: timeout));
    case 'POST':
      return await http
          .post(
            Uri.parse(url),
            headers: authHeaders,
            body: json.encode(body),
          )
          .timeout(Duration(seconds: timeout));
    case 'PUT':
      return await http
          .put(
            Uri.parse(url),
            headers: authHeaders,
            body: json.encode(body),
          )
          .timeout(Duration(seconds: timeout));
    case 'DELETE':
      return await http
          .delete(
            Uri.parse(url),
            headers: authHeaders,
          )
          .timeout(Duration(seconds: timeout));
    default:
      throw Exception('Invalid HTTP method');
  }
}

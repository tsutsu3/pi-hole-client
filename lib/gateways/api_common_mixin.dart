import 'dart:async';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:pi_hole_client/functions/encode_basic_auth.dart';

/// A mixin that provides common API functionalities.
///
/// This mixin can be used to share common methods and properties
/// related to API interactions across multiple classes.
mixin ApiCommonMixin {
  /// Checks if both the username and password are non-null and non-empty.
  ///
  /// Parameters:
  ///   - username: The username to check.
  ///   - password: The password to check.
  ///
  /// Returns:
  /// - `true` if both the username and password are provided and not empty,
  /// `false` otherwise.
  bool checkBasicAuth(String? username, String? password) {
    if (username != null &&
        password != null &&
        username != '' &&
        password != '') {
      return true;
    } else {
      return false;
    }
  }

  /// Sends an HTTP request using the specified method and parameters.
  ///
  /// Parameters:
  /// - [method] The HTTP method to use (e.g., 'GET', 'POST').
  /// - [apiKey] The API key to use for authentication. Use v5 only.
  /// - [url] The URL to send the request to.
  /// - [headers] The headers to send with the request.
  /// - [body] The body of the request.
  /// - [timeout] The timeout for the request in seconds. Default is 10 seconds.
  /// - [basicAuth] Basic authentication `username` and `password`.
  ///
  /// Returns
  /// - A `Response` object containing the response from the server.
  ///
  /// Exceptions:
  /// - Throws a `TimeoutException` if the request times out.
  Future<Response> httpClient({
    /// The HTTP method to use
    required String method,

    /// The API key to use for authentication. Use v5 only
    String? apiKey,

    /// The URL to send the request to
    required String url,

    /// The headers to send with the request
    Map<String, String>? headers,

    /// The body of the request
    Map<String, dynamic>? body,

    /// The timeout for the request. Default is 10 seconds
    int timeout = 10,

    /// The basic authentication credentials to use for authentication
    Map<String, dynamic>? basicAuth,
  }) async {
    final Map<String, String> authHeaders = headers != null ? {...headers} : {};

    if (basicAuth != null &&
        checkBasicAuth(basicAuth['username'], basicAuth['password'])) {
      authHeaders['Authorization'] =
          'Basic ${encodeBasicAuth(basicAuth['username'], basicAuth['password'])}';
    }

    switch (method.toUpperCase()) {
      case 'POST':
        return await http
            .post(Uri.parse(url), headers: authHeaders, body: body)
            .timeout(Duration(seconds: timeout));

      case 'GET':
      default:
        return await http
            .get(Uri.parse(url), headers: authHeaders)
            .timeout(Duration(seconds: timeout));
    }
  }
}

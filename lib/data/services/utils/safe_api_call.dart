import 'dart:async';
import 'dart:io';

import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';

/// Executes the given asynchronous API call safely, catching and converting known exceptions into [Failure].
///
/// This method wraps API requests and converts common exceptions such as [SocketException],
/// [TimeoutException], [HandshakeException], [FormatException], and [HttpStatusCodeException]
/// into a unified [Failure] form. It returns [Success] if the call completes normally.
///
/// Use this to simplify error handling in service methods and provide consistent error behavior.
///
/// Returns:
/// - `Success<T>` if the API call completes successfully.
/// - `Failure<HttpStatusCodeException>` if an expected or unexpected error occurs.
///
/// ### Example – Usage inside a service method
/// ```dart
/// Future<Result<UserProfile>> getUserProfile() {
///   return safeApiCall(() async {
///     final response = await _client.get(Uri.parse('$baseUrl/example'));
///     if (response.statusCode == 200) {
///       return UserProfile.fromJson(jsonDecode(response.body));
///     }
///     throw HttpStatusCodeException(response.statusCode, response.body);
///   });
/// }
/// ```
Future<Result<T>> safeApiCall<T extends Object>(
  Future<T> Function() apiCall,
) async {
  try {
    final result = await apiCall();
    return Success(result);
  } on HttpStatusCodeException catch (e) {
    logger.e('HTTP error occurred: ${e.message}');
    return Failure(e);
  } on SocketException catch (e) {
    final msg = 'Network connection failed. ${e.message}';
    logger.e(msg);
    return Failure(HttpStatusCodeException(503, msg));
  } on TimeoutException catch (e) {
    final msg = 'Request timed out. ${e.message}';
    logger.e(msg);
    return Failure(HttpStatusCodeException(504, msg));
  } on HandshakeException catch (e) {
    final msg = 'SSL handshake failed. ${e.message}';
    logger.e(msg);
    return Failure(HttpStatusCodeException(495, msg));
  } on FormatException catch (e) {
    final msg = 'Response format is invalid. ${e.message}';
    logger.e(msg);
    return Failure(HttpStatusCodeException(422, msg));
  } catch (e, st) {
    final msg = 'Unexpected error occurred. $e\n$st';
    logger.e(msg);
    return Failure(HttpStatusCodeException(500, msg));
  }
}

/// Executes the given streaming API call safely, yielding results as they are received.
///
/// This method wraps streaming API requests and converts common exceptions such as [SocketException],
/// [TimeoutException], [HandshakeException], [FormatException], and [HttpStatusCodeException]
/// into a unified [Failure] form. It yields [Success] for each successful result received.
///
/// Use this to simplify error handling in streaming service methods and provide consistent error behavior.
///
/// Returns:
/// - `Success<T>` for each successful result received from the stream.
/// - `Failure<HttpStatusCodeException>` if an expected or unexpected error occurs.
///
/// ### Example – Usage inside a service method
/// ```dart
/// Stream<Result<UserActivity>> getUserActivity() async* {
///   yield* safeApiCallStream<List<String>>(() async* {
///     final resp =
///         await _client.send(http.Request('GET', Uri.parse('$baseUrl/activity')));
///     if (resp.statusCode == 200) {
///       yield UserActivity.fromJson(jsonDecode(response.body));
///     }
///     throw HttpStatusCodeException(response.statusCode, response.body);
///   });
/// }
/// ```
Stream<Result<T>> safeApiCallStream<T extends Object>(
  Stream<T> Function() apiCall,
) async* {
  try {
    await for (final result in apiCall()) {
      yield Success(result);
    }
  } on HttpStatusCodeException catch (e) {
    logger.e('HTTP error occurred: ${e.message}');
    yield Failure(e);
  } on SocketException catch (e) {
    final msg = 'Network connection failed. ${e.message}';
    logger.e(msg);
    yield Failure(HttpStatusCodeException(503, msg));
  } on TimeoutException catch (e) {
    final msg = 'Request timed out. ${e.message}';
    logger.e(msg);
    yield Failure(HttpStatusCodeException(504, msg));
  } on HandshakeException catch (e) {
    final msg = 'SSL handshake failed. ${e.message}';
    logger.e(msg);
    yield Failure(HttpStatusCodeException(495, msg));
  } on FormatException catch (e) {
    final msg = 'Response format is invalid. ${e.message}';
    logger.e(msg);
    yield Failure(HttpStatusCodeException(422, msg));
  } catch (e, st) {
    final msg = 'Unexpected error occurred. $e\n$st';
    logger.e(msg);
    yield Failure(HttpStatusCodeException(500, msg));
  }
}

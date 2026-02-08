import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:result_dart/result_dart.dart';

/// Executes a Dio-based API call safely, catching and converting
/// exceptions into [Failure<ApiException>].
///
/// This is the Dio counterpart of [safeApiCall] (which handles the
/// http-package based legacy client). It wraps calls to the OpenAPI-generated
/// v6 API client.
///
/// ### Example
/// ```dart
/// Future<Result<GetDomains200Response>> getDomains() {
///   return safeDioCall(() async {
///     final response = await _domainApi.getDomains(...);
///     return response.data!;
///   });
/// }
/// ```
Future<Result<T>> safeDioCall<T extends Object>(
  Future<T> Function() apiCall,
) async {
  try {
    final result = await apiCall();
    return Success(result);
  } on DioException catch (e) {
    final exception = ApiException.fromDioException(e);
    logger.e('Dio error: ${exception.message}');
    return Failure(exception);
  } on SocketException catch (e) {
    final exception = ApiException(
      message: 'Network connection failed. ${e.message}',
      statusCode: 503,
    );
    logger.e(exception.message);
    return Failure(exception);
  } on TimeoutException catch (e) {
    final exception = ApiException(
      message: 'Request timed out. ${e.message}',
      statusCode: 504,
    );
    logger.e(exception.message);
    return Failure(exception);
  } catch (e, st) {
    final exception = ApiException.unknown('Unexpected error: $e\n$st');
    logger.e(exception.message);
    return Failure(exception);
  }
}

/// Streaming variant of [safeDioCall] for long-running API calls
/// such as gravity updates.
Stream<Result<T>> safeDioCallStream<T extends Object>(
  Stream<T> Function() apiCall,
) async* {
  try {
    await for (final result in apiCall()) {
      yield Success(result);
    }
  } on DioException catch (e) {
    final exception = ApiException.fromDioException(e);
    logger.e('Dio stream error: ${exception.message}');
    yield Failure(exception);
  } on SocketException catch (e) {
    final exception = ApiException(
      message: 'Network connection failed. ${e.message}',
      statusCode: 503,
    );
    logger.e(exception.message);
    yield Failure(exception);
  } on TimeoutException catch (e) {
    final exception = ApiException(
      message: 'Request timed out. ${e.message}',
      statusCode: 504,
    );
    logger.e(exception.message);
    yield Failure(exception);
  } catch (e, st) {
    final exception = ApiException.unknown('Unexpected error: $e\n$st');
    logger.e(exception.message);
    yield Failure(exception);
  }
}

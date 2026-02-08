import 'package:dio/dio.dart';

/// Exception representing an API error from Dio-based API calls.
///
/// Provides structured error information including HTTP status code,
/// human-readable message, and optional error code from the Pi-hole API
/// response body.
class ApiException implements Exception {
  ApiException({required this.message, this.statusCode, this.errorCode});

  /// Creates an [ApiException] from a [DioException].
  ///
  /// Attempts to extract structured error information from the response body.
  /// Pi-hole v6 API returns errors in the format:
  /// ```json
  /// { "error": { "key": "unauthorized", "message": "..." } }
  /// ```
  factory ApiException.fromDioException(DioException e) {
    final response = e.response;
    String? errorCode;
    String message;

    if (response?.data is Map<String, dynamic>) {
      final data = response!.data as Map<String, dynamic>;
      final error = data['error'];
      if (error is Map<String, dynamic>) {
        errorCode = error['key'] as String?;
        message = error['message'] as String? ?? e.message ?? 'Unknown error';
      } else {
        message = e.message ?? 'Unknown error';
      }
    } else {
      message = e.message ?? 'Unknown error';
    }

    return ApiException(
      message: message,
      statusCode: response?.statusCode,
      errorCode: errorCode,
    );
  }

  factory ApiException.unknown(String message) =>
      ApiException(message: message);

  final String message;
  final int? statusCode;
  final String? errorCode;

  @override
  String toString() =>
      'ApiException(statusCode: $statusCode, message: $message, errorCode: $errorCode)';
}

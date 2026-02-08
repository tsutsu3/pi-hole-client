import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';

void main() {
  group('ApiException', () {
    group('fromDioException', () {
      test('extracts Pi-hole structured error from response body', () {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          response: Response(
            statusCode: 401,
            data: {
              'error': {
                'key': 'unauthorized',
                'message': 'Session is invalid',
              },
            },
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );

        final exception = ApiException.fromDioException(dioException);

        expect(exception.statusCode, 401);
        expect(exception.errorCode, 'unauthorized');
        expect(exception.message, 'Session is invalid');
      });

      test('uses DioException message when error map has no message', () {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          message: 'Bad Response',
          response: Response(
            statusCode: 400,
            data: {
              'error': {'key': 'bad_request'},
            },
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );

        final exception = ApiException.fromDioException(dioException);

        expect(exception.statusCode, 400);
        expect(exception.errorCode, 'bad_request');
        expect(exception.message, 'Bad Response');
      });

      test('handles response data without error map', () {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          message: 'Something went wrong',
          response: Response(
            statusCode: 500,
            data: {'status': 'error'},
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );

        final exception = ApiException.fromDioException(dioException);

        expect(exception.statusCode, 500);
        expect(exception.errorCode, isNull);
        expect(exception.message, 'Something went wrong');
      });

      test('handles non-map response data', () {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          message: 'Server error',
          response: Response(
            statusCode: 502,
            data: 'Bad Gateway',
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );

        final exception = ApiException.fromDioException(dioException);

        expect(exception.statusCode, 502);
        expect(exception.errorCode, isNull);
        expect(exception.message, 'Server error');
      });

      test('handles null response', () {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          message: 'Connection refused',
          type: DioExceptionType.connectionError,
        );

        final exception = ApiException.fromDioException(dioException);

        expect(exception.statusCode, isNull);
        expect(exception.errorCode, isNull);
        expect(exception.message, 'Connection refused');
      });

      test('uses Unknown error when no message available', () {
        final dioException = DioException(
          requestOptions: RequestOptions(),
          response: Response(
            statusCode: 500,
            data: null,
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );

        final exception = ApiException.fromDioException(dioException);

        expect(exception.statusCode, 500);
        expect(exception.message, 'Unknown error');
      });
    });

    group('unknown', () {
      test('creates exception with message only', () {
        final exception = ApiException.unknown('Something unexpected');

        expect(exception.message, 'Something unexpected');
        expect(exception.statusCode, isNull);
        expect(exception.errorCode, isNull);
      });
    });

    group('toString', () {
      test('includes all fields', () {
        final exception = ApiException(
          message: 'Unauthorized',
          statusCode: 401,
          errorCode: 'unauthorized',
        );

        expect(
          exception.toString(),
          'ApiException(statusCode: 401, message: Unauthorized, errorCode: unauthorized)',
        );
      });

      test('shows null for missing fields', () {
        final exception = ApiException(message: 'Error');

        expect(
          exception.toString(),
          'ApiException(statusCode: null, message: Error, errorCode: null)',
        );
      });
    });
  });
}

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';
import 'package:pi_hole_client/data/services/api/utils/safe_dio_call.dart';

void main() {
  group('safeDioCall', () {
    test('returns Success on successful call', () async {
      final result = await safeDioCall(() async => 'hello');

      expect(result.isSuccess(), true);
      expect(result.getOrNull(), 'hello');
    });

    test('returns Failure with ApiException on DioException', () async {
      final result = await safeDioCall<String>(() async {
        throw DioException(
          requestOptions: RequestOptions(),
          response: Response(
            statusCode: 401,
            data: {
              'error': {'key': 'unauthorized', 'message': 'Session expired'},
            },
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );
      });

      expect(result.isError(), true);
      final error = result.exceptionOrNull()! as ApiException;
      expect(error.statusCode, 401);
      expect(error.errorCode, 'unauthorized');
      expect(error.message, 'Session expired');
    });

    test('returns Failure with statusCode 503 on SocketException', () async {
      final result = await safeDioCall<String>(() async {
        throw const SocketException('Connection refused');
      });

      expect(result.isError(), true);
      final error = result.exceptionOrNull()! as ApiException;
      expect(error.statusCode, 503);
      expect(error.message, contains('Network connection failed'));
      expect(error.message, contains('Connection refused'));
    });

    test('returns Failure with statusCode 504 on TimeoutException', () async {
      final result = await safeDioCall<String>(() async {
        throw TimeoutException('Request took too long');
      });

      expect(result.isError(), true);
      final error = result.exceptionOrNull()! as ApiException;
      expect(error.statusCode, 504);
      expect(error.message, contains('Request timed out'));
    });

    test('returns Failure on unknown exception', () async {
      final result = await safeDioCall<String>(() async {
        throw FormatException('bad data');
      });

      expect(result.isError(), true);
      final error = result.exceptionOrNull()! as ApiException;
      expect(error.statusCode, isNull);
      expect(error.message, contains('Unexpected error'));
      expect(error.message, contains('bad data'));
    });
  });

  group('safeDioCallStream', () {
    test('yields Success for each emitted value', () async {
      final results = await safeDioCallStream<String>(() async* {
        yield 'first';
        yield 'second';
        yield 'third';
      }).toList();

      expect(results.length, 3);
      expect(results[0].getOrNull(), 'first');
      expect(results[1].getOrNull(), 'second');
      expect(results[2].getOrNull(), 'third');
    });

    test('yields Failure on DioException during stream', () async {
      final results = await safeDioCallStream<String>(() async* {
        yield 'ok';
        throw DioException(
          requestOptions: RequestOptions(),
          response: Response(
            statusCode: 500,
            data: {
              'error': {'key': 'server_error', 'message': 'Internal error'},
            },
            requestOptions: RequestOptions(),
          ),
          type: DioExceptionType.badResponse,
        );
      }).toList();

      expect(results.length, 2);
      expect(results[0].isSuccess(), true);
      expect(results[0].getOrNull(), 'ok');
      expect(results[1].isError(), true);
      final error = results[1].exceptionOrNull()! as ApiException;
      expect(error.statusCode, 500);
      expect(error.message, 'Internal error');
    });

    test('yields Failure on SocketException during stream', () async {
      final results = await safeDioCallStream<String>(() async* {
        throw const SocketException('No route to host');
      }).toList();

      expect(results.length, 1);
      expect(results[0].isError(), true);
      final error = results[0].exceptionOrNull()! as ApiException;
      expect(error.statusCode, 503);
      expect(error.message, contains('Network connection failed'));
    });

    test('yields Failure on TimeoutException during stream', () async {
      final results = await safeDioCallStream<String>(() async* {
        throw TimeoutException('Stream timed out');
      }).toList();

      expect(results.length, 1);
      expect(results[0].isError(), true);
      final error = results[0].exceptionOrNull()! as ApiException;
      expect(error.statusCode, 504);
    });

    test('yields Failure on unknown exception during stream', () async {
      final results = await safeDioCallStream<String>(() async* {
        throw Exception('unexpected');
      }).toList();

      expect(results.length, 1);
      expect(results[0].isError(), true);
      final error = results[0].exceptionOrNull()! as ApiException;
      expect(error.message, contains('Unexpected error'));
    });
  });

  group('RequireData', () {
    test('returns data when response.data is non-null', () {
      final response = Response<String>(
        data: 'hello',
        statusCode: 200,
        requestOptions: RequestOptions(),
      );

      expect(response.requireData, 'hello');
    });

    test('throws ApiException when response.data is null', () {
      final response = Response<String>(
        // data: null,
        statusCode: 200,
        requestOptions: RequestOptions(),
      );

      expect(
        () => response.requireData,
        throwsA(
          isA<ApiException>()
              .having(
                (e) => e.message,
                'message',
                'API returned null response body',
              )
              .having((e) => e.statusCode, 'statusCode', 200),
        ),
      );
    });

    test('includes status code in thrown ApiException', () {
      final response = Response<Map<String, dynamic>>(
        // data: null,
        statusCode: 204,
        requestOptions: RequestOptions(),
      );

      expect(
        () => response.requireData,
        throwsA(
          isA<ApiException>().having((e) => e.statusCode, 'statusCode', 204),
        ),
      );
    });

    test('null data inside safeDioCall returns Failure', () async {
      final result = await safeDioCall<String>(() async {
        final response = Response<String>(
          // data: null,
          statusCode: 200,
          requestOptions: RequestOptions(),
        );
        return response.requireData;
      });

      expect(result.isError(), true);
      final error = result.exceptionOrNull()! as ApiException;
      expect(error.message, contains('API returned null response body'));
    });
  });
}

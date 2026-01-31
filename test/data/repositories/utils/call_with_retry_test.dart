import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:result_dart/result_dart.dart';

void main() {
  group('runWithRetry', () {
    test(
      'should return result when action succeeds on first attempt',
      () async {
        final result = await runWithRetry(action: () async => 'Success');
        expect(result, 'Success');
      },
    );

    test(
      'should retry and return result when action succeeds on second attempt',
      () async {
        var attempts = 0;
        final result = await runWithRetry(
          action: () async {
            attempts++;
            if (attempts < 2) throw Exception('Failed');
            return 'Success';
          },
        );
        expect(result, 'Success');
        expect(attempts, 2); // 1 retry + initial attempt
      },
    );

    test('should throw exception after max retries', () async {
      var attempts = 0;
      try {
        await runWithRetry(
          action: () async {
            attempts++;
            throw Exception('Failed');
          },
          maxRetries: 3,
        );
      } catch (e) {
        expect(e, isA<Exception>());
      }
      expect(attempts, 3);
    });
  });

  group('runWithResultRetry', () {
    test('should return Success result when action succeeds', () async {
      final result = await runWithResultRetry<String>(
        action: () async => const Success('Success'),
      );
      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull(), 'Success');
    });

    test('should retry and return Success result on second attempt', () async {
      var attempts = 0;
      final result = await runWithResultRetry<String>(
        action: () async {
          attempts++;
          if (attempts < 2) return Failure(Exception('Failed'));
          return const Success('Success');
        },
      );
      expect(result.isSuccess(), isTrue);
      expect(result.getOrNull(), 'Success');
      expect(attempts, 2); // 1 retry + initial attempt
    });

    test('should return Failure result after max retries', () async {
      var attempts = 0;
      final result = await runWithResultRetry<String>(
        action: () async {
          attempts++;
          return Failure(Exception('Failed'));
        },
        maxRetries: 3,
      );
      expect(result.isError(), isTrue);
      expect(attempts, 4); // 3 retries + initial attempt
    });
  });
}

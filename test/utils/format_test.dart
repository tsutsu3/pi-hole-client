import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/format.dart';

void main() {
  // -------------------------------------------------------------------------
  // formatUptime
  // -------------------------------------------------------------------------

  group('formatUptime', () {
    test('zero seconds', () {
      expect(formatUptime(0), equals('0 d 0 h 0 m'));
    });

    test('less than one minute', () {
      expect(formatUptime(45), equals('0 d 0 h 0 m'));
    });

    test('exactly one minute', () {
      expect(formatUptime(60), equals('0 d 0 h 1 m'));
    });

    test('exactly one hour', () {
      expect(formatUptime(3600), equals('0 d 1 h 0 m'));
    });

    test('exactly one day', () {
      expect(formatUptime(86400), equals('1 d 0 h 0 m'));
    });

    test('mixed: 1 day 2 hours 30 minutes', () {
      const seconds = 86400 + 2 * 3600 + 30 * 60;
      expect(formatUptime(seconds), equals('1 d 2 h 30 m'));
    });

    test('large value: 7 days', () {
      expect(formatUptime(7 * 86400), equals('7 d 0 h 0 m'));
    });
  });

  // -------------------------------------------------------------------------
  // normalizeLogOutput
  // -------------------------------------------------------------------------

  group('normalizeLogOutput', () {
    test('returns simple line unchanged', () {
      expect(normalizeLogOutput('Hello'), equals('Hello'));
    });

    test('strips ANSI escape sequences', () {
      const ansi = '\x1B[32mGreen\x1B[0m';
      expect(normalizeLogOutput(ansi), equals('Green'));
    });

    test('handles carriage return overwrite (shorter overwrites partial)', () {
      // 'AB\rC' -> 'C' overwrites only 1 char of 'AB' -> 'CB'
      expect(normalizeLogOutput('AB\rC'), equals('CB'));
    });

    test('handles carriage return overwrite (longer replaces fully)', () {
      // 'A\rBCD' -> 'BCD' (longer) replaces 'A' completely
      expect(normalizeLogOutput('A\rBCD'), equals('BCD'));
    });

    test('last segment wins for multiple carriage returns', () {
      // Simulates progress spinner: 'Processing A\rProcessing B\rProcessing C'
      expect(
        normalizeLogOutput('Processing A\rProcessing B\rProcessing C'),
        equals('Processing C'),
      );
    });

    test('handles multi-line input', () {
      final result = normalizeLogOutput('Line1\nLine2\nLine3');
      expect(result, equals('Line1\nLine2\nLine3'));
    });

    test('skips blank lines', () {
      final result = normalizeLogOutput('Line1\n\nLine2');
      expect(result, equals('Line1\nLine2'));
    });

    test('trims leading and trailing whitespace from result', () {
      final result = normalizeLogOutput('  hello  ');
      expect(result, equals('hello'));
    });

    test('ANSI removal and CR processing together', () {
      const input = '\x1B[32mStep 1\x1B[0m\r\x1B[32mStep 2\x1B[0m';
      expect(normalizeLogOutput(input), equals('Step 2'));
    });
  });
}

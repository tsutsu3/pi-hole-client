import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/math.dart';

void main() {
  group('prettyReplyTimeWithUnit', () {
    test('returns 0.0 ms for zero', () {
      expect(prettyReplyTimeWithUnit(0.0), '0.0 ms');
    });

    test('formats nanoseconds correctly (<1e-6)', () {
      expect(prettyReplyTimeWithUnit(5e-10), '0.5 ns'); // 0.0000000005 s
      expect(prettyReplyTimeWithUnit(5e-9), '5.0 ns'); // 0.000000005 s
      expect(prettyReplyTimeWithUnit(5e-8), '50.0 ns'); // 0.00000005 s
      expect(prettyReplyTimeWithUnit(5e-7), '500.0 ns'); // 0.0000005 s
    });

    test('formats microseconds correctly (<1e-3)', () {
      expect(prettyReplyTimeWithUnit(5e-6), '5.0 µs'); // 0.000005 s
      expect(prettyReplyTimeWithUnit(5e-5), '50.0 µs'); // 0.00005 s
      expect(prettyReplyTimeWithUnit(5e-4), '500.0 µs'); // 0.0005 s
    });

    test('formats milliseconds correctly (<1.0)', () {
      expect(prettyReplyTimeWithUnit(5e-3), '5.0 ms'); // 0.005 s
      expect(prettyReplyTimeWithUnit(5e-2), '50.0 ms');
      expect(prettyReplyTimeWithUnit(5e-1), '500.0 ms');
    });

    test('formats seconds correctly (>=1.0)', () {
      expect(prettyReplyTimeWithUnit(1.0), '1.0 s');
      expect(prettyReplyTimeWithUnit(2.3456), '2.3 s');
    });

    test('supports custom decimalPlaces parameter', () {
      expect(
        prettyReplyTimeWithUnit(0.0000012345, decimalPlaces: 3),
        '1.234 µs',
      );
      expect(prettyReplyTimeWithUnit(0.0123456, decimalPlaces: 2), '12.35 ms');
    });
  });
}

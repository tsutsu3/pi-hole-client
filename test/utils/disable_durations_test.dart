import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/disable_durations.dart';

void main() {
  group('DisableDurations.parse', () {
    test('reads four durations in seconds', () {
      expect(DisableDurations.parse('600,1200,2400,3600'), [
        600,
        1200,
        2400,
        3600,
      ]);
    });

    test('falls back to the defaults when the value is missing or wrong', () {
      expect(DisableDurations.parse(null), DisableDurations.defaults);
      expect(DisableDurations.parse(''), DisableDurations.defaults);
      expect(DisableDurations.parse('30,60,120'), DisableDurations.defaults);
      expect(DisableDurations.parse('30,60,x,300'), DisableDurations.defaults);
      expect(DisableDurations.parse('0,60,120,300'), DisableDurations.defaults);
      expect(
        DisableDurations.parse('30,60,120,86401'),
        DisableDurations.defaults,
      );
    });
  });

  test('serialize is the inverse of parse', () {
    const durations = [45, 600, 3600, 86400];
    expect(
      DisableDurations.parse(DisableDurations.serialize(durations)),
      durations,
    );
  });
}

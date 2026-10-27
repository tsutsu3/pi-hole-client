import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

void main() {
  group('fingerprintsMatch', () {
    test('the same value matches', () {
      expect(fingerprintsMatch('ab:cd', 'ab:cd'), isTrue);
    });

    test('colons, case and spaces around the value are ignored', () {
      expect(fingerprintsMatch(' AB:CD ', 'abcd'), isTrue);
    });

    test('a different value does not match', () {
      expect(fingerprintsMatch('ab:cd', 'ab:ce'), isFalse);
    });
  });
}

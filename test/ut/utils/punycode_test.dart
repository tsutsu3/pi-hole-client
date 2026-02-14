import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/punycode.dart';

void main() {
  group('decodePunycode', () {
    test('decodes Japanese domain (さんぷる)', () {
      expect(decodePunycode('xn--48j8cuc4a.com'), 'さんぷる.com');
    });

    test('decodes Japanese domain (てすと)', () {
      expect(decodePunycode('xn--88jzah.com'), 'てすと.com');
    });

    test('returns ASCII domain unchanged', () {
      expect(decodePunycode('example.com'), 'example.com');
    });

    test('decodes mixed labels', () {
      expect(
        decodePunycode('xn--48j8cuc4a.example.com'),
        'さんぷる.example.com',
      );
    });

    test('returns empty string unchanged', () {
      expect(decodePunycode(''), '');
    });

    test('decodes German umlauts', () {
      // münchen = xn--mnchen-3ya
      expect(decodePunycode('xn--mnchen-3ya.de'), 'münchen.de');
    });

    test('decodes Chinese domain', () {
      // 中文.com = xn--fiq228c.com
      expect(decodePunycode('xn--fiq228c.com'), '中文.com');
    });

    test('returns original on invalid punycode', () {
      // Should not throw, just return original
      expect(decodePunycode('xn--!!!.com'), 'xn--!!!.com');
    });
  });
}

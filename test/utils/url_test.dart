import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/url.dart';

void main() {
  group('isSameEndpoint', () {
    test('returns true for identical URLs', () {
      expect(isSameEndpoint('https://pi.hole', 'https://pi.hole'), isTrue);
    });

    test('ignores host case differences', () {
      expect(isSameEndpoint('https://Pi.Hole', 'https://pi.hole'), isTrue);
    });

    test('ignores scheme case differences', () {
      expect(isSameEndpoint('HTTPS://pi.hole', 'https://pi.hole'), isTrue);
    });

    test('ignores a trailing slash', () {
      expect(isSameEndpoint('https://pi.hole/', 'https://pi.hole'), isTrue);
    });

    test('treats a bare slash and empty path as equal', () {
      expect(isSameEndpoint('https://pi.hole/', 'https://pi.hole'), isTrue);
    });

    test('keeps subroute path case-sensitive', () {
      expect(
        isSameEndpoint('https://pi.hole/API', 'https://pi.hole/api'),
        isFalse,
      );
    });

    test('matches subroutes that only differ by a trailing slash', () {
      expect(
        isSameEndpoint('https://pi.hole/api/v1/', 'https://pi.hole/api/v1'),
        isTrue,
      );
    });

    test('distinguishes different schemes', () {
      expect(isSameEndpoint('http://pi.hole', 'https://pi.hole'), isFalse);
    });

    test('distinguishes different hosts', () {
      expect(isSameEndpoint('https://pi.hole', 'https://example.com'), isFalse);
    });

    test('distinguishes different ports', () {
      expect(
        isSameEndpoint('https://pi.hole:8080', 'https://pi.hole:9090'),
        isFalse,
      );
    });

    test('treats the default https port as equal to an omitted port', () {
      expect(isSameEndpoint('https://pi.hole', 'https://pi.hole:443'), isTrue);
    });

    test('treats the default http port as equal to an omitted port', () {
      expect(isSameEndpoint('http://pi.hole', 'http://pi.hole:80'), isTrue);
    });

    test('normalises the default port alongside a subroute', () {
      expect(
        isSameEndpoint('https://pi.hole/admin', 'https://pi.hole:443/admin'),
        isTrue,
      );
    });

    test('does not equate an explicit non-default port with the default', () {
      expect(
        isSameEndpoint('https://pi.hole', 'https://pi.hole:8080'),
        isFalse,
      );
    });

    test('does not equate a default port across different schemes', () {
      // http default (80) and https default (443) must stay distinct.
      expect(
        isSameEndpoint('http://pi.hole:80', 'https://pi.hole:443'),
        isFalse,
      );
    });

    test('distinguishes different subroutes', () {
      expect(
        isSameEndpoint('https://pi.hole/api', 'https://pi.hole/admin'),
        isFalse,
      );
    });

    test('falls back to string equality when a URL is unparseable', () {
      expect(isSameEndpoint('::: not a url', '::: not a url'), isTrue);
      expect(isSameEndpoint('::: not a url', 'https://pi.hole'), isFalse);
    });
  });
}

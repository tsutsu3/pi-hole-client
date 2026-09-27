import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/utils/validators.dart';

void main() {
  group('isValidServerAddress', () {
    test('accepts an IPv4 address', () {
      expect(isValidServerAddress('192.168.1.10'), isTrue);
      expect(isValidServerAddress('10.0.0.1'), isTrue);
    });

    test('accepts a hostname and a domain', () {
      expect(isValidServerAddress('pi.hole'), isTrue);
      expect(isValidServerAddress('localhost'), isTrue);
      expect(isValidServerAddress('my-server.example.com'), isTrue);
    });

    test('accepts upper case letters and underscores', () {
      expect(isValidServerAddress('Pi.Hole'), isTrue);
      expect(isValidServerAddress('my_host.lan'), isTrue);
      expect(isValidServerAddress('pi-hole'), isTrue);
    });

    test('rejects a value that only ends like a host', () {
      expect(isValidServerAddress('Server IP: 184.27.155.254'), isFalse);
      expect(isValidServerAddress('foo bar'), isFalse);
      expect(isValidServerAddress('host:8080'), isFalse);
      expect(isValidServerAddress('http://pi.hole'), isFalse);
    });

    test('rejects a pipe character', () {
      expect(isValidServerAddress('a|b.com'), isFalse);
    });

    test('rejects an IPv4 address out of range', () {
      expect(isValidServerAddress('10.0.0.256'), isFalse);
    });

    test('rejects an empty value', () {
      expect(isValidServerAddress(''), isFalse);
    });

    test('rejects a value with no host-like characters', () {
      expect(isValidServerAddress('!!!'), isFalse);
    });
  });

  group('isValidPort', () {
    test('accepts ports within range', () {
      expect(isValidPort('0'), isTrue);
      expect(isValidPort('8080'), isTrue);
      expect(isValidPort('65535'), isTrue);
    });

    test('rejects ports above the maximum', () {
      expect(isValidPort('65536'), isFalse);
      expect(isValidPort('99999'), isFalse);
    });

    test('rejects ports below the minimum', () {
      expect(isValidPort('-1'), isFalse);
    });

    test('rejects non-numeric values', () {
      expect(isValidPort('abc'), isFalse);
      expect(isValidPort('80a'), isFalse);
      expect(isValidPort(''), isFalse);
    });
  });

  group('isValidSubroute', () {
    test('accepts a leading-slash path', () {
      expect(isValidSubroute('/admin'), isTrue);
      expect(isValidSubroute('/api/v1'), isTrue);
    });

    test('rejects a path without a leading slash', () {
      expect(isValidSubroute('admin'), isFalse);
    });

    test('rejects a trailing slash, dot or colon', () {
      expect(isValidSubroute('/admin/'), isFalse);
      expect(isValidSubroute('/admin.'), isFalse);
      expect(isValidSubroute('/admin:'), isFalse);
    });

    test('rejects URL special characters and spaces', () {
      expect(isValidSubroute('/pihole?'), isFalse);
      expect(isValidSubroute('/pihole#'), isFalse);
      expect(isValidSubroute('/pihole%'), isFalse);
      expect(isValidSubroute('/pihole '), isFalse);
    });

    test('rejects an empty segment', () {
      expect(isValidSubroute('/'), isFalse);
      expect(isValidSubroute('/a//b'), isFalse);
    });
  });

  group('normalizeLocalDnsNames', () {
    test('removes spaces at the start and end', () {
      expect(normalizeLocalDnsNames(' test '), 'test');
    });

    test('joins names with a single space', () {
      expect(normalizeLocalDnsNames('test   ok'), 'test ok');
      expect(normalizeLocalDnsNames('test\tok'), 'test ok');
    });

    test('returns an empty string for spaces only', () {
      expect(normalizeLocalDnsNames('   '), '');
    });
  });

  group('isValidLocalDnsNames', () {
    test('accepts one or more valid names', () {
      expect(isValidLocalDnsNames('nas'), isTrue);
      expect(isValidLocalDnsNames('nas nas.local my_host-1'), isTrue);
      expect(isValidLocalDnsNames(' nas  ok '), isTrue);
    });

    test('rejects names with invalid characters', () {
      expect(isValidLocalDnsNames('test o!k'), isFalse);
    });

    test('rejects empty input and spaces only', () {
      expect(isValidLocalDnsNames(''), isFalse);
      expect(isValidLocalDnsNames('   '), isFalse);
    });
  });
}

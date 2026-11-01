import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/certificate_check_usecase.dart';

import '../../../../testing/fakes/services/fake_tls_certificate_fetcher.dart';

/// https, untrusted certificates allowed, no pin.
const _https = Server(
  address: 'https://pi.hole',
  alias: 'https',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

final _pinned = _https.copyWith(pinnedCertificateSha256: 'old:fingerprint');
final _httpPinned = _pinned.copyWith(address: 'http://pi.hole');
final _ignorePinned = _pinned.copyWith(ignoreCertificateErrors: true);
final _strict = _https.copyWith(allowUntrustedCert: false);
final _strictPinned = _pinned.copyWith(allowUntrustedCert: false);
final _invalid = _https.copyWith(address: 'https://[');
final _invalidPinned = _pinned.copyWith(address: 'https://[');
final _blankPin = _https.copyWith(pinnedCertificateSha256: '  ');

// The use case fetches the certificate in two ways, and each entry point uses
// only some of them:
//
// | Entry point            | Trust check | Read |
// | ---------------------- | ----------- | ---- |
// | checkBeforeSave        | yes         | only after "untrusted" |
// | needsPinBeforeConnect  | yes         | no   |
// | repin                  | no          | yes  |
// | hasConfirmedPinMismatch| no          | yes  |
//
// Each fake below answers only the fetches its cases use.
// A fetch with no answer returns null.

/// Not fetched in this case.
FakeTlsCertificateFetcher _noFetch() => FakeTlsCertificateFetcher();

// Trust check (`allowBadCertificates: false`): does the platform trust the
// certificate?

/// The platform trusts the certificate.
FakeTlsCertificateFetcher _trusted() =>
    FakeTlsCertificateFetcher(onStrict: fakeCertInfo(sha256: 'trusted'));

/// The platform does not trust the certificate (e.g. self-signed).
FakeTlsCertificateFetcher _untrusted() =>
    FakeTlsCertificateFetcher(strictError: const HandshakeException());

/// A network error other than TLS.
FakeTlsCertificateFetcher _networkError() =>
    FakeTlsCertificateFetcher(strictError: const SocketException('timeout'));

// Read (`allowBadCertificates: true`): read the certificate without checking
// trust.

/// Reads a certificate with [sha256].
FakeTlsCertificateFetcher _reads(String sha256) =>
    FakeTlsCertificateFetcher(onAllowBad: fakeCertInfo(sha256: sha256));

/// The read finds no certificate.
FakeTlsCertificateFetcher _readsNothing() => FakeTlsCertificateFetcher();

/// The read fails: the port does not speak TLS.
FakeTlsCertificateFetcher _readFails() =>
    FakeTlsCertificateFetcher(allowBadError: const HandshakeException());

// Both, in this order: only checkBeforeSave reads after an untrusted check.

/// Untrusted, then reads a certificate with [sha256].
FakeTlsCertificateFetcher _untrustedThenReads(String sha256) =>
    FakeTlsCertificateFetcher(
      strictError: const HandshakeException(),
      onAllowBad: fakeCertInfo(sha256: sha256),
    );

/// Untrusted, then the read fails: the port does not speak TLS.
FakeTlsCertificateFetcher _untrustedThenReadFails() =>
    FakeTlsCertificateFetcher(
      strictError: const HandshakeException(),
      allowBadError: const HandshakeException(),
    );

/// The check passed and returned exactly [server].
Matcher _resolvedTo(Server server) =>
    isA<CertificateResolved>().having((o) => o.server, 'server', server);

Matcher _blocked(CertificateBlockReason reason) =>
    isA<CertificateBlocked>().having((o) => o.reason, 'reason', reason);

final _cancelled = isA<CertificateCancelled>();

Server _withPin(Server server, String? pin) =>
    server.copyWith(pinnedCertificateSha256: pin);

void main() {
  group('CertificateCheckUseCase', () {
    CertificateCheckUseCase useCase(FakeTlsCertificateFetcher fetcher) =>
        CertificateCheckUseCase(tlsCertFetcher: fetcher.call);

    Future<bool> Function(Object) confirmWith(bool answer) =>
        (_) async => answer;

    group('checkBeforeSave', () {
      for (final c in [
        // No check: the pin is cleared.
        (
          name: 'http clears the pin',
          server: _httpPinned,
          fetcher: _noFetch(),
          confirm: true,
          expected: _resolvedTo(_withPin(_httpPinned, null)),
        ),
        (
          name: 'ignored certificate errors clear the pin',
          server: _ignorePinned,
          fetcher: _noFetch(),
          confirm: true,
          expected: _resolvedTo(_withPin(_ignorePinned, null)),
        ),
        (
          name: 'an address that cannot be parsed is blocked',
          server: _invalid,
          fetcher: _noFetch(),
          confirm: true,
          expected: _blocked(CertificateBlockReason.invalidAddress),
        ),
        // Strict mode: never pinned.
        (
          name: 'strict mode saves a trusted certificate without a pin',
          server: _strict,
          fetcher: _trusted(),
          confirm: true,
          expected: _resolvedTo(_strict),
        ),
        (
          name: 'strict mode clears a stored pin',
          server: _strictPinned,
          fetcher: _trusted(),
          confirm: true,
          expected: _resolvedTo(_withPin(_strictPinned, null)),
        ),
        (
          name: 'strict mode blocks an untrusted certificate',
          server: _strict,
          fetcher: _untrusted(),
          confirm: true,
          expected: _blocked(CertificateBlockReason.untrusted),
        ),
        (
          name: 'strict mode leaves a network error to the connection',
          server: _strict,
          fetcher: _networkError(),
          confirm: true,
          expected: _resolvedTo(_strict),
        ),
        // Untrusted certificates allowed.
        (
          name: 'a stored pin is kept',
          server: _pinned,
          fetcher: _noFetch(),
          confirm: true,
          expected: _resolvedTo(_pinned),
        ),
        (
          name: 'a trusted certificate is pinned automatically',
          server: _https,
          fetcher: _trusted(),
          confirm: true,
          expected: _resolvedTo(_withPin(_https, 'trusted')),
        ),
        (
          name: 'a network error saves without a pin',
          server: _https,
          fetcher: _networkError(),
          confirm: true,
          expected: _resolvedTo(_https),
        ),
        (
          name: 'an untrusted certificate is pinned on confirm',
          server: _https,
          fetcher: _untrustedThenReads('new:fingerprint'),
          confirm: true,
          expected: _resolvedTo(_withPin(_https, 'new:fingerprint')),
        ),
        (
          name: 'an untrusted certificate is cancelled on cancel',
          server: _https,
          fetcher: _untrustedThenReads('new:fingerprint'),
          confirm: false,
          expected: _cancelled,
        ),
        (
          name: 'a port that does not speak TLS is blocked',
          server: _https,
          fetcher: _untrustedThenReadFails(),
          confirm: true,
          expected: _blocked(CertificateBlockReason.notTls),
        ),
      ]) {
        test(c.name, () async {
          final outcome = await useCase(
            c.fetcher,
          ).checkBeforeSave(c.server, confirmPin: confirmWith(c.confirm));

          expect(outcome, c.expected);
        });
      }
    });

    group('needsPinBeforeConnect', () {
      for (final c in [
        // Nothing to check. The certificate is untrusted, so a check would
        // say that a pin is needed.
        (
          name: 'http',
          server: _httpPinned,
          fetcher: _untrusted(),
          needs: false,
        ),
        (
          name: 'ignored certificate errors',
          server: _ignorePinned,
          fetcher: _untrusted(),
          needs: false,
        ),
        (
          name: 'strict mode',
          server: _strict,
          fetcher: _untrusted(),
          needs: false,
        ),
        (
          name: 'a stored pin',
          server: _pinned,
          fetcher: _untrusted(),
          needs: false,
        ),
        (
          name: 'an address that cannot be parsed',
          server: _invalid,
          fetcher: _untrusted(),
          needs: false,
        ),
        // Checked.
        (
          name: 'a trusted certificate',
          server: _https,
          fetcher: _trusted(),
          needs: false,
        ),
        (
          name: 'a network error',
          server: _https,
          fetcher: _networkError(),
          needs: false,
        ),
        (
          name: 'an untrusted certificate',
          server: _https,
          fetcher: _untrusted(),
          needs: true,
        ),
        (
          name: 'an untrusted certificate with a blank pin',
          server: _blankPin,
          fetcher: _untrusted(),
          needs: true,
        ),
      ]) {
        test('${c.name}: ${c.needs ? 'needs' : 'no'} pin', () async {
          final needs = await useCase(
            c.fetcher,
          ).needsPinBeforeConnect(c.server);

          expect(needs, c.needs);
        });
      }
    });

    group('repin', () {
      for (final c in [
        // Nothing to pin. The server sends a new certificate, so pinning
        // would change the pin.
        (
          name: 'http has nothing to pin',
          server: _httpPinned,
          fetcher: _reads('new:fingerprint'),
          confirm: true,
          expected: _cancelled,
        ),
        (
          name: 'an address that cannot be parsed has nothing to pin',
          server: _invalidPinned,
          fetcher: _reads('new:fingerprint'),
          confirm: true,
          expected: _cancelled,
        ),
        // Pinned again.
        (
          name: 'confirming pins the current certificate',
          server: _pinned,
          fetcher: _reads('new:fingerprint'),
          confirm: true,
          expected: _resolvedTo(_withPin(_pinned, 'new:fingerprint')),
        ),
        (
          name: 'cancelling keeps the old pin',
          server: _pinned,
          fetcher: _reads('new:fingerprint'),
          confirm: false,
          expected: _cancelled,
        ),
        (
          name: 'a port that does not speak TLS is blocked',
          server: _pinned,
          fetcher: _readFails(),
          confirm: true,
          expected: _blocked(CertificateBlockReason.notTls),
        ),
      ]) {
        test(c.name, () async {
          final outcome = await useCase(
            c.fetcher,
          ).repin(c.server, confirmPin: confirmWith(c.confirm));

          expect(outcome, c.expected);
        });
      }
    });

    group('hasConfirmedPinMismatch', () {
      for (final c in [
        // Nothing to check. The server sends a new certificate, so a check
        // would find a mismatch.
        (
          name: 'http',
          server: _httpPinned,
          fetcher: _reads('new:fingerprint'),
          mismatch: false,
        ),
        (
          name: 'ignored certificate errors',
          server: _ignorePinned,
          fetcher: _reads('new:fingerprint'),
          mismatch: false,
        ),
        (
          name: 'strict mode',
          server: _strictPinned,
          fetcher: _reads('new:fingerprint'),
          mismatch: false,
        ),
        (
          name: 'no pin',
          server: _https,
          fetcher: _reads('new:fingerprint'),
          mismatch: false,
        ),
        (
          name: 'an address that cannot be parsed',
          server: _invalidPinned,
          fetcher: _reads('new:fingerprint'),
          mismatch: false,
        ),
        // Checked.
        (
          name: 'a different certificate',
          server: _pinned,
          fetcher: _reads('new:fingerprint'),
          mismatch: true,
        ),
        (
          name: 'the same certificate in another format',
          server: _pinned,
          fetcher: _reads('OLDFINGERPRINT'),
          mismatch: false,
        ),
        (
          name: 'a failed certificate fetch',
          server: _pinned,
          fetcher: _readFails(),
          mismatch: false,
        ),
        (
          name: 'no certificate',
          server: _pinned,
          fetcher: _readsNothing(),
          mismatch: false,
        ),
      ]) {
        test(
          '${c.name}: ${c.mismatch ? 'confirmed' : 'no confirmed'} mismatch',
          () async {
            final mismatch = await useCase(
              c.fetcher,
            ).hasConfirmedPinMismatch(c.server);

            expect(mismatch, c.mismatch);
          },
        );
      }
    });
  });
}

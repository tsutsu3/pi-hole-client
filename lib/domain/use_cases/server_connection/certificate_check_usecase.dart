import 'dart:io';

import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/domain/use_cases/server_connection/confirm_pin.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

/// Why a certificate check stopped the save or the pin update.
enum CertificateBlockReason {
  /// The server address cannot be parsed.
  invalidAddress,

  /// The certificate cannot be fetched, e.g. HTTPS on a plain HTTP port.
  notTls,

  /// Strict mode: the platform does not trust the certificate.
  untrusted,
}

sealed class CertificateCheckOutcome {
  const CertificateCheckOutcome();
}

/// The check passed. [server] may have a new pin.
final class CertificateResolved extends CertificateCheckOutcome {
  const CertificateResolved(this.server);

  final Server server;
}

/// The user dismissed the pin dialog.
final class CertificateCancelled extends CertificateCheckOutcome {
  const CertificateCancelled();
}

final class CertificateBlocked extends CertificateCheckOutcome {
  const CertificateBlocked(this.reason);

  final CertificateBlockReason reason;
}

/// Decides how to treat the TLS certificate of a server: pin it, ask the
/// user, or block it.
///
/// Holds the certificate rules shared by the add / edit server flow, the
/// connect flow and the server list. It never shows UI; the pin dialog is
/// passed in as [ConfirmPin].
class CertificateCheckUseCase {
  CertificateCheckUseCase({
    TlsCertificateFetcher tlsCertFetcher = fetchTlsCertificateInfo,
  }) : _tlsCertFetcher = tlsCertFetcher;

  final TlsCertificateFetcher _tlsCertFetcher;

  /// Checks the certificate of [server] before the add / edit screen saves
  /// it.
  ///
  /// Unlike [needsPinBeforeConnect]:
  /// - A certificate trusted by the platform is pinned automatically.
  /// - In strict mode (untrusted certificates not allowed), an untrusted
  ///   certificate is blocked here, before the connection check.
  Future<CertificateCheckOutcome> checkBeforeSave(
    Server server, {
    required ConfirmPin confirmPin,
  }) async {
    if (!server.address.startsWith('https://') ||
        server.ignoreCertificateErrors) {
      return CertificateResolved(
        // ignore: avoid_redundant_argument_values
        server.copyWith(pinnedCertificateSha256: null),
      );
    }

    final uri = Uri.tryParse(server.address);
    if (uri == null) {
      return const CertificateBlocked(CertificateBlockReason.invalidAddress);
    }

    if (!server.allowUntrustedCert) return _checkStrict(server, uri);
    if (_hasPin(server)) return CertificateResolved(server);

    try {
      final info = await _tlsCertFetcher(uri, allowBadCertificates: false);

      // Trusted by the platform: pin it automatically.
      return CertificateResolved(
        server.copyWith(pinnedCertificateSha256: info?.sha256),
      );
    } on HandshakeException {
      // Untrusted (e.g. self-signed): ask the user below.
    } catch (_) {
      // Other errors are left to the connection check. Save without a pin.
      return CertificateResolved(
        server.copyWith(pinnedCertificateSha256: null),
      );
    }

    return _askPin(server, uri, confirmPin);
  }

  /// Whether the user must pin the certificate of [server] before connecting.
  ///
  /// True only for an https server that allows untrusted certificates, has no
  /// pin, and whose certificate the platform does not trust. Everything else
  /// is left to the connection, which fails with a 495 on a bad certificate.
  Future<bool> needsPinBeforeConnect(Server server) async {
    final uri = Uri.tryParse(server.address);
    if (uri == null || !_canPin(server, uri) || _hasPin(server)) return false;

    try {
      await _tlsCertFetcher(
        uri,
        allowBadCertificates: false,
        timeout: const Duration(seconds: 3),
      );

      // Trusted by the platform: no pin is needed.
      return false;
    } on HandshakeException {
      return true;
    } catch (_) {
      // Other errors are left to the connection.
      return false;
    }
  }

  /// Pins the current certificate of [server] again (server list menu,
  /// recovery from a pin mismatch).
  ///
  /// Returns [CertificateCancelled] when [server] is not an https server, as
  /// there is nothing to pin.
  Future<CertificateCheckOutcome> repin(
    Server server, {
    required ConfirmPin confirmPin,
  }) async {
    final uri = Uri.tryParse(server.address);
    if (uri == null || uri.scheme != 'https') {
      return const CertificateCancelled();
    }

    return _askPin(server, uri, confirmPin);
  }

  /// Whether the server was checked and its current certificate differs from
  /// the pin of [server]. Then pinning the certificate again can fix it.
  ///
  /// Returns true only when the certificate was fetched and does not match.
  /// Returns false in every other case:
  /// - the certificate matches the pin,
  /// - nothing to check (http, no pin, strict mode, or errors ignored),
  /// - the certificate cannot be fetched.
  Future<bool> hasConfirmedPinMismatch(Server server) async {
    final pin = server.pinnedCertificateSha256;
    final uri = Uri.tryParse(server.address);
    if (pin == null ||
        !_hasPin(server) ||
        uri == null ||
        !_canPin(server, uri)) {
      return false;
    }

    try {
      final info = await _tlsCertFetcher(
        uri,
        allowBadCertificates: true,
        timeout: const Duration(seconds: 3),
      );
      if (info == null) return false;

      return !fingerprintsMatch(info.sha256, pin);
    } catch (_) {
      return false;
    }
  }

  /// Strict mode: blocks a certificate the platform does not trust.
  Future<CertificateCheckOutcome> _checkStrict(Server server, Uri uri) async {
    try {
      await _tlsCertFetcher(uri, allowBadCertificates: false);
    } on HandshakeException {
      return const CertificateBlocked(CertificateBlockReason.untrusted);
    } catch (_) {
      // Other errors are left to the connection check.
    }

    return CertificateResolved(server.copyWith(pinnedCertificateSha256: null));
  }

  /// Fetches the certificate of [uri] even when it is untrusted, and asks
  /// the user to pin it.
  Future<CertificateCheckOutcome> _askPin(
    Server server,
    Uri uri,
    ConfirmPin confirmPin,
  ) async {
    TlsCertificateInfo? info;
    try {
      // Bad certificates are accepted here, so a failure means the port does
      // not TLS (e.g. HTTPS on a plain HTTP port) or a proxy blocks it.
      info = await _tlsCertFetcher(uri, allowBadCertificates: true);
    } catch (_) {
      info = null;
    }

    if (info == null) {
      return const CertificateBlocked(CertificateBlockReason.notTls);
    }

    if (!await confirmPin(info)) return const CertificateCancelled();

    return CertificateResolved(
      server.copyWith(pinnedCertificateSha256: info.sha256),
    );
  }

  /// Whether pinning applies to [server]: https, untrusted certificates allowed,
  /// and certificate errors not ignored.
  bool _canPin(Server server, Uri uri) =>
      uri.scheme == 'https' &&
      server.allowUntrustedCert &&
      !server.ignoreCertificateErrors;

  bool _hasPin(Server server) =>
      server.pinnedCertificateSha256?.trim().isNotEmpty ?? false;
}

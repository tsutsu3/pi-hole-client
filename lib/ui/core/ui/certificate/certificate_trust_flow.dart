import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/confirm_pin_modal.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

/// The certificate checks, the pin dialog and the pin update, shared by the
/// add/edit screen, the connection flow and the server list.
class CertificateTrustFlow {
  const CertificateTrustFlow({
    required this.appConfigViewModel,
    this.fetch = fetchTlsCertificateInfo,
  });

  final AppConfigViewModel appConfigViewModel;
  final TlsCertificateFetcher fetch;

  /// Checks the certificate of [server] before the add/edit screen saves it.
  /// Nothing is written to the DB.
  ///
  /// Returns the server to save (possibly with a pinned fingerprint), or null
  /// when the user cancels or the certificate is blocked. A snackbar tells the
  /// user why it was blocked.
  ///
  /// Unlike [checkBeforeConnect]:
  /// - A certificate trusted by the platform is pinned automatically.
  /// - In strict mode (untrusted certificates not allowed), an untrusted
  ///   certificate is blocked here, before the connection check.
  Future<Server?> checkBeforeSave(BuildContext context, Server server) async {
    if (!context.mounted) return null;
    if (!server.address.startsWith('https://') ||
        server.ignoreCertificateErrors) {
      // ignore: avoid_redundant_argument_values
      return server.copyWith(pinnedCertificateSha256: null);
    }

    final uri = Uri.tryParse(server.address);
    if (uri == null) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context).invalidAddress,
      );

      return null;
    }

    if (server.allowUntrustedCert) {
      // Allow self-signed: prompt user to pin the certificate
      if (!context.mounted) return null;
      final pin = await _decidePinBeforeSave(
        context,
        uri: uri,
        existingPin: server.pinnedCertificateSha256,
      );
      if (!context.mounted) return null;
      if (pin == null) return null;

      return server.copyWith(pinnedCertificateSha256: pin.isEmpty ? null : pin);
    } else {
      // Strict mode: verify certificate is trusted by the platform
      try {
        await fetch(uri, allowBadCertificates: false);

        // Certificate is trusted, proceed without pin
        // ignore: avoid_redundant_argument_values
        return server.copyWith(pinnedCertificateSha256: null);
      } on HandshakeException {
        // Certificate not trusted - block connection
        if (!context.mounted) return null;
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).sslErrorLong,
        );

        return null;
      } catch (e) {
        // Other network errors - let connection test handle them
        // ignore: avoid_redundant_argument_values
        return server.copyWith(pinnedCertificateSha256: null);
      }
    }
  }

  /// Checks the certificate of [server] before connecting to it.
  ///
  /// Only an https server that allows untrusted certificates and has no pin
  /// is checked. When its certificate is not trusted by the platform, the
  /// user is asked to pin it, and the pin is saved with [pinAndSave].
  /// Everything else is left to the connection, which fails with a 495 on a
  /// bad certificate.
  ///
  /// Returns the server to connect to, or null when the user cancels or the
  /// pin is not saved.
  Future<Server?> checkBeforeConnect(
    BuildContext context,
    Server server,
    ServersViewModel serversViewModel,
  ) async {
    if (!context.mounted) return server;

    Uri uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return server;
    }

    final pin = server.pinnedCertificateSha256;
    final hasPin = pin != null && pin.trim().isNotEmpty;
    if (uri.scheme != 'https' ||
        server.ignoreCertificateErrors ||
        !server.allowUntrustedCert ||
        hasPin) {
      return server;
    }

    // If the platform TLS validation succeeds, treat the connection as verified
    // and do not require pin setup (user may still choose to pin manually).
    try {
      await fetch(
        uri,
        allowBadCertificates: false,
        timeout: const Duration(seconds: 3),
      );

      return server;
    } on HandshakeException {
      // Untrusted certificate + allowUntrustedCert enabled + no pin:
      // prompt the user to pin before connecting.
    } catch (_) {
      // Network issues etc. are handled by the normal connection flow.
      return server;
    }

    if (!context.mounted) return null;

    return pinAndSave(context, server, serversViewModel);
  }

  /// Whether the current certificate of [server] differs from its pin.
  ///
  /// Only checked for an https server that allows untrusted certificates and
  /// has a pin. Returns false when the certificate cannot be fetched.
  Future<bool> isPinMismatch(Server server) async {
    final pin = server.pinnedCertificateSha256;
    if (pin == null || pin.trim().isEmpty) return false;

    Uri uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return false;
    }
    if (uri.scheme != 'https') return false;

    // Only attempt mismatch detection when the app is configured to allow
    // untrusted certificates (pin fallback path).
    if (server.ignoreCertificateErrors) return false;
    if (!server.allowUntrustedCert) return false;

    try {
      final info = await fetch(
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

  /// Asks the user to pin the current certificate of [server], then saves the
  /// new pin with [ServersViewModel.editServer].
  ///
  /// Returns the saved server, or null when the user cancels or the save
  /// fails. A snackbar tells the user the result of the save.
  Future<Server?> pinAndSave(
    BuildContext context,
    Server server,
    ServersViewModel serversViewModel,
  ) async {
    final uri = Uri.tryParse(server.address);
    if (uri == null || uri.scheme != 'https') return null;

    final pin = await _confirmPin(context, uri);
    if (pin == null || !context.mounted) return null;

    final updated = server.copyWith(pinnedCertificateSha256: pin);
    try {
      await serversViewModel.editServer.runAsync(updated);
    } catch (e, s) {
      logger.e('Failed to save pinned certificate', error: e, stackTrace: s);
    }
    if (!context.mounted) return null;

    final loc = AppLocalizations.of(context);
    if (serversViewModel.editServer.errors.value != null) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.cantSaveConnectionData,
      );

      return null;
    }

    showSuccessSnackBar(
      context: context,
      appConfigViewModel: appConfigViewModel,
      label: loc.editServerSuccessfully,
    );

    return updated;
  }

  /// Shows the certificate of [uri] and asks the user to pin it.
  ///
  /// Returns the SHA-256 fingerprint the user confirmed, or null when the user
  /// cancels. When the certificate cannot be fetched, shows an error snackbar
  /// and returns null.
  Future<String?> _confirmPin(BuildContext context, Uri uri) async {
    TlsCertificateInfo? info;
    try {
      // Bad certificates are accepted here, so a failure means the port does
      // not speak TLS (e.g. HTTPS on a plain HTTP port) or a proxy blocks it.
      info = await fetch(uri, allowBadCertificates: true);
    } catch (_) {
      info = null;
    }
    if (!context.mounted) return null;

    final loc = AppLocalizations.of(context);
    if (info == null) {
      showErrorSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: loc.serverCertificateHandshakeFailed,
      );

      return null;
    }

    return await showConfirmPinModal(context, info) ? info.sha256 : null;
  }

  /// Decides the pin to save for [uri] when untrusted certificates are allowed.
  ///
  /// Returns, in this order:
  /// - [existingPin] when it is set.
  /// - The fingerprint of a certificate the platform trusts (pinned
  ///   automatically).
  /// - `''` (save without a pin) when the check fails for a reason other
  ///   than an untrusted certificate.
  /// - The fingerprint the user confirmed in the pin dialog.
  ///
  /// Returns null when the user cancels or the certificate cannot be fetched.
  Future<String?> _decidePinBeforeSave(
    BuildContext context, {
    required Uri uri,
    required String? existingPin,
  }) async {
    if (existingPin != null && existingPin.isNotEmpty) {
      return existingPin;
    }

    try {
      // If the certificate is trusted by the platform, pin it automatically.
      final info = await fetch(uri, allowBadCertificates: false);
      if (info != null) {
        return info.sha256;
      }

      return '';
    } on HandshakeException {
      // Untrusted certificate (likely self-signed). Retrieve fingerprint for user verification.
    } catch (_) {
      // Fall back to existing behavior without pin prompt on non-TLS failures.
      return '';
    }

    if (!context.mounted) return null;

    return _confirmPin(context, uri);
  }
}

import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

enum _TransportSecurityStatus {
  http,
  httpsVerified,
  httpsPinned,
  httpsUntrustedAllowed,
  httpsUntrustedBlocked,
  httpsPinMismatch,
  unknown,
}

class _TransportSecurityViewData {
  const _TransportSecurityViewData({
    required this.status,
    required this.icon,
    required this.color,
    required this.label,
  });

  final _TransportSecurityStatus status;
  final IconData icon;
  final Color color;
  final String label;
}

class TransportSecurityIndicator extends StatefulWidget {
  const TransportSecurityIndicator({required this.server, super.key});

  final Server server;

  @override
  State<TransportSecurityIndicator> createState() =>
      _TransportSecurityIndicatorState();
}

class _TransportSecurityIndicatorState
    extends State<TransportSecurityIndicator> {
  static final Map<String, Future<_TransportSecurityStatus>>
  _statusFuturesByKey = <String, Future<_TransportSecurityStatus>>{};

  late Future<_TransportSecurityStatus> _future;

  @override
  void initState() {
    super.initState();
    _future = _statusFutureFor(widget.server);
  }

  @override
  void didUpdateWidget(covariant TransportSecurityIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.server.address != widget.server.address ||
        oldWidget.server.allowSelfSignedCert !=
            widget.server.allowSelfSignedCert ||
        oldWidget.server.pinnedCertificateSha256 !=
            widget.server.pinnedCertificateSha256) {
      _future = _statusFutureFor(widget.server);
    }
  }

  Future<_TransportSecurityStatus> _statusFutureFor(Server server) {
    final pinKey = (server.pinnedCertificateSha256 ?? '').trim();
    final cacheKey =
        '${server.address}|allowSelfSigned=${server.allowSelfSignedCert}|pin=$pinKey';
    return _statusFuturesByKey.putIfAbsent(cacheKey, () => _resolve(server));
  }

  Future<_TransportSecurityStatus> _resolve(Server server) async {
    final uri = _tryParseUri(server.address);
    if (uri == null) return _TransportSecurityStatus.unknown;

    switch (uri.scheme) {
      case 'http':
        return _TransportSecurityStatus.http;
      case 'https':
        return _resolveHttps(server, uri);
      default:
        return _TransportSecurityStatus.unknown;
    }
  }

  Uri? _tryParseUri(String address) {
    try {
      return Uri.parse(address);
    } catch (_) {
      return null;
    }
  }

  Future<_TransportSecurityStatus> _resolveHttps(Server server, Uri uri) async {
    const connectTimeout = Duration(seconds: 2);

    final isTrusted = await _isPlatformTlsTrusted(uri, timeout: connectTimeout);
    if (isTrusted == true) {
      return server.pinnedCertificateSha256?.isNotEmpty == true
          ? _TransportSecurityStatus.httpsPinned
          : _TransportSecurityStatus.httpsVerified;
    }

    if (isTrusted == null) {
      return _TransportSecurityStatus.unknown;
    }

    return _resolveHttpsUntrusted(server, uri, timeout: connectTimeout);
  }

  Future<bool?> _isPlatformTlsTrusted(
    Uri uri, {
    required Duration timeout,
  }) async {
    try {
      await fetchTlsCertificateInfo(
        uri,
        allowBadCertificates: false,
        timeout: timeout,
      );
      return true;
    } on HandshakeException {
      return false;
    } on TimeoutException {
      return null;
    } catch (_) {
      return null;
    }
  }

  Future<_TransportSecurityStatus> _resolveHttpsUntrusted(
    Server server,
    Uri uri, {
    required Duration timeout,
  }) async {
    if (!server.allowSelfSignedCert) {
      return _TransportSecurityStatus.httpsUntrustedBlocked;
    }

    if (server.pinnedCertificateSha256 == null ||
        server.pinnedCertificateSha256!.isEmpty) {
      return _TransportSecurityStatus.httpsUntrustedAllowed;
    }

    final info = await _fetchTlsCertificateInfoAllowBad(uri, timeout: timeout);
    if (info == null) {
      return _TransportSecurityStatus.unknown;
    }

    final matched = _pinMatches(
      pinnedSha256: server.pinnedCertificateSha256!,
      certificateSha256: info.sha256,
    );

    return matched
        ? _TransportSecurityStatus.httpsPinned
        : _TransportSecurityStatus.httpsPinMismatch;
  }

  Future<TlsCertificateInfo?> _fetchTlsCertificateInfoAllowBad(
    Uri uri, {
    required Duration timeout,
  }) async {
    try {
      return await fetchTlsCertificateInfo(
        uri,
        allowBadCertificates: true,
        timeout: timeout,
      );
    } on TimeoutException {
      return null;
    } catch (_) {
      return null;
    }
  }

  bool _pinMatches({
    required String pinnedSha256,
    required String certificateSha256,
  }) {
    String normalize(String value) =>
        value.replaceAll(':', '').toLowerCase().trim();
    return normalize(pinnedSha256) == normalize(certificateSha256);
  }

  _TransportSecurityViewData _viewData(
    BuildContext context,
    _TransportSecurityStatus status,
  ) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;

    switch (status) {
      case _TransportSecurityStatus.http:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.no_encryption_rounded,
          color: appColors.queryOrange!,
          label: loc.serverSecurityHttp,
        );
      case _TransportSecurityStatus.httpsVerified:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.verified_user,
          color: appColors.queryGreen!,
          label: loc.serverSecurityHttpsVerified,
        );
      case _TransportSecurityStatus.httpsPinned:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.push_pin,
          color: appColors.securityPinned!,
          label: loc.serverSecurityHttpsPinned,
        );
      case _TransportSecurityStatus.httpsUntrustedAllowed:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.gpp_maybe,
          color: appColors.queryOrange!,
          label: loc.serverSecurityHttpsUntrustedAllowed,
        );
      case _TransportSecurityStatus.httpsUntrustedBlocked:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.gpp_bad,
          color: appColors.queryRed!,
          label: loc.serverSecurityHttpsUntrustedBlocked,
        );
      case _TransportSecurityStatus.httpsPinMismatch:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.error,
          color: appColors.queryRed!,
          label: loc.serverSecurityHttpsPinMismatch,
        );
      case _TransportSecurityStatus.unknown:
        return _TransportSecurityViewData(
          status: status,
          icon: Icons.help_outline,
          color: theme.colorScheme.onSurfaceVariant,
          label: loc.serverSecurityHttpsUnknown,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<_TransportSecurityStatus>(
      future: _future,
      builder: (context, snapshot) {
        final status = snapshot.data ?? _TransportSecurityStatus.unknown;
        final view = _viewData(context, status);

        return Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(view.icon, size: 14, color: view.color),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                view.label,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: view.color,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

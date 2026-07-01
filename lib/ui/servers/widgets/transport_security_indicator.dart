import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:provider/provider.dart';

class _TransportSecurityViewData {
  const _TransportSecurityViewData({
    required this.icon,
    required this.color,
    required this.label,
  });

  final IconData icon;
  final Color color;
  final String label;
}

/// Shows the transport security status of [server] on its tile.
///
/// Reads the status from [ServersViewModel] (derived from config + the cached
/// certificate observation) and triggers a background revalidation on mount and
/// whenever the certificate-relevant fields change.
class TransportSecurityIndicator extends StatefulWidget {
  const TransportSecurityIndicator({required this.server, super.key});

  final Server server;

  @override
  State<TransportSecurityIndicator> createState() =>
      _TransportSecurityIndicatorState();
}

class _TransportSecurityIndicatorState
    extends State<TransportSecurityIndicator> {
  @override
  void initState() {
    super.initState();
    _revalidate();
  }

  @override
  void didUpdateWidget(covariant TransportSecurityIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.server.address != widget.server.address ||
        oldWidget.server.allowUntrustedCert !=
            widget.server.allowUntrustedCert ||
        oldWidget.server.ignoreCertificateErrors !=
            widget.server.ignoreCertificateErrors ||
        oldWidget.server.pinnedCertificateSha256 !=
            widget.server.pinnedCertificateSha256) {
      _revalidate();
    }
  }

  void _revalidate() {
    context.read<ServersViewModel>().resolveTransportSecurity(widget.server);
  }

  _TransportSecurityViewData _viewData(
    BuildContext context,
    TransportSecurityStatus status,
  ) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;

    switch (status) {
      case TransportSecurityStatus.http:
        return _TransportSecurityViewData(
          icon: Icons.no_encryption_rounded,
          color: appColors.queryOrange!,
          label: loc.serverSecurityHttp,
        );
      case TransportSecurityStatus.httpsVerified:
        return _TransportSecurityViewData(
          icon: Icons.verified_user,
          color: appColors.queryGreen!,
          label: loc.serverSecurityHttpsVerified,
        );
      case TransportSecurityStatus.httpsPinned:
        return _TransportSecurityViewData(
          icon: Icons.push_pin,
          color: appColors.securityPinned!,
          label: loc.serverSecurityHttpsPinned,
        );
      case TransportSecurityStatus.httpsUntrustedAllowed:
        return _TransportSecurityViewData(
          icon: Icons.gpp_maybe,
          color: appColors.queryOrange!,
          label: loc.serverSecurityHttpsUntrustedAllowed,
        );
      case TransportSecurityStatus.httpsUntrustedBlocked:
        return _TransportSecurityViewData(
          icon: Icons.gpp_bad,
          color: appColors.queryRed!,
          label: loc.serverSecurityHttpsUntrustedBlocked,
        );
      case TransportSecurityStatus.httpsPinMismatch:
        return _TransportSecurityViewData(
          icon: Icons.error,
          color: appColors.queryRed!,
          label: loc.serverSecurityHttpsPinMismatch,
        );
      case TransportSecurityStatus.httpsCertIgnored:
        return _TransportSecurityViewData(
          icon: Icons.warning_amber_rounded,
          color: appColors.queryOrange!,
          label: loc.dontCheckCertificate,
        );
      case TransportSecurityStatus.unknown:
        return _TransportSecurityViewData(
          icon: Icons.help_outline,
          color: theme.colorScheme.onSurfaceVariant,
          label: loc.serverSecurityHttpsUnknown,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final status = context.select<ServersViewModel, TransportSecurityStatus>(
      (vm) => vm.transportSecurityOf(widget.server),
    );
    final view = _viewData(context, status);

    return Row(
      children: [
        Icon(view.icon, size: 14, color: view.color),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            view.label,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: view.color,
            ),
          ),
        ),
      ],
    );
  }
}

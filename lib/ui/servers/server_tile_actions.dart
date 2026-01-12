import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/status_provider.dart';
import 'package:pi_hole_client/ui/servers/transport_security_indicator.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';
import 'package:provider/provider.dart';

/// A widget that displays action buttons for a server tile, including options to
/// connect, edit, delete, or set the server as default. The actions are presented
/// in a popup menu, and the connection status is shown if the server is selected.
///
/// Parameters:
/// - [server]: The server object containing the address and status.
/// - [onConnect]: Callback function to handle connecting to the server.
/// - [onEdit]: Callback function to handle editing the server.
/// - [onDelete]: Callback function to handle deleting the server.
/// - [onSetDefault]: Callback function to set the server as default.
class ServerTileActions extends StatelessWidget {
  const ServerTileActions({
    required this.server,
    required this.onConnect,
    required this.onEdit,
    required this.onDelete,
    required this.onSetDefault,
    super.key,
  });

  final Server server;
  final VoidCallback onConnect;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final VoidCallback onSetDefault;

  @override
  Widget build(BuildContext context) {
    final isConnected = context.select<StatusProvider, bool>(
      (p) => p.getServerStatus == LoadStatus.loaded,
    );
    final selectedServer = context.select<ServersProvider, Server?>(
      (p) => p.selectedServer,
    );

    final isSelected = selectedServer?.address == server.address;
    final loc = AppLocalizations.of(context)!;

    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  _buildMenuItem(
                    icon: Icons.star,
                    text: server.defaultServer == true
                        ? loc.defaultConnection
                        : loc.setDefault,
                    enabled: server.defaultServer == false,
                    onTap: server.defaultServer == false ? onSetDefault : null,
                  ),
                  _buildMenuItem(
                    icon: Icons.edit,
                    text: loc.edit,
                    onTap: onEdit,
                  ),
                  _buildMenuItem(
                    icon: Icons.delete,
                    text: loc.delete,
                    onTap: onDelete,
                  ),
                  const PopupMenuItem<void>(
                    enabled: false,
                    height: 12,
                    child: Divider(height: 1),
                  ),
                  _buildMenuItem(
                    icon: Icons.verified,
                    text: loc.serverCertificateView,
                    enabled: _tryParseHttpsUri(server.address) != null,
                    onTap: _tryParseHttpsUri(server.address) != null
                        ? () => _showCertificateDialog(context, server)
                        : null,
                  ),
                  _buildMenuItem(
                    icon: Icons.push_pin,
                    text: loc.serverCertificateUpdatePin,
                    enabled:
                        _tryParseHttpsUri(server.address) != null &&
                        server.allowSelfSignedCert,
                    onTap:
                        _tryParseHttpsUri(server.address) != null &&
                            server.allowSelfSignedCert
                        ? () => _updatePinnedCertificate(context, server)
                        : null,
                  ),
                ],
              ),
              const SizedBox(width: 8),
              Expanded(child: TransportSecurityIndicator(server: server)),
            ],
          ),
        ),
        const SizedBox(width: 8),
        Padding(
          padding: const EdgeInsets.only(right: 16),
          child: isSelected
              ? _ConnectionStatus(isConnected: isConnected)
              : FilledButton.icon(
                  onPressed: onConnect,
                  icon: const Icon(Icons.login),
                  label: Text(loc.connect),
                ),
        ),
      ],
    );
  }

  PopupMenuItem<void> _buildMenuItem({
    required IconData icon,
    required String text,
    VoidCallback? onTap,
    bool enabled = true,
  }) {
    return PopupMenuItem(
      enabled: enabled,
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 15),
          Expanded(child: Text(text, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }

  Uri? _tryParseHttpsUri(String address) {
    try {
      final uri = Uri.parse(address);
      return uri.scheme == 'https' ? uri : null;
    } catch (_) {
      return null;
    }
  }

  Future<void> _showCertificateDialog(
    BuildContext context,
    Server server,
  ) async {
    final uri = _tryParseHttpsUri(server.address);
    if (uri == null) return;

    final loc = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();

    TlsCertificateInfo? certificateInfo;
    try {
      certificateInfo = await fetchTlsCertificateInfo(
        uri,
        allowBadCertificates: true,
      );
    } catch (_) {
      certificateInfo = null;
    }

    if (!context.mounted) return;

    if (certificateInfo == null) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.serverCertificateFetchFailed,
      );
      return;
    }

    final info = certificateInfo;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.serverCertificateTitle),
        content: SelectableText(
          [
            '${loc.tlsCertSubject}: ${info.subject}',
            '${loc.tlsCertIssuer}: ${info.issuer}',
            '${loc.tlsCertValidFrom}: ${info.startValidity.toIso8601String()}',
            '${loc.tlsCertValidUntil}: ${info.endValidity.toIso8601String()}',
            '',
            '${loc.tlsCertSha256}: ${info.sha256}',
          ].join('\n'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext),
            child: Text(loc.close),
          ),
        ],
      ),
    );
  }

  Future<void> _updatePinnedCertificate(
    BuildContext context,
    Server server,
  ) async {
    final uri = _tryParseHttpsUri(server.address);
    if (uri == null) return;

    final loc = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final serversProvider = context.read<ServersProvider>();

    TlsCertificateInfo? certificateInfo;
    try {
      certificateInfo = await fetchTlsCertificateInfo(
        uri,
        allowBadCertificates: true,
      );
    } catch (_) {
      certificateInfo = null;
    }

    if (!context.mounted) return;

    if (certificateInfo == null) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.serverCertificateFetchFailed,
      );
      return;
    }

    final info = certificateInfo;

    final confirmed = await showDialog<bool>(
      context: context,
      builder: (dialogContext) => AlertDialog(
        title: Text(loc.serverCertificateUpdatePinTitle),
        content: SelectableText(
          [
            loc.serverCertificateUpdatePinHelp,
            '',
            '${loc.tlsCertSubject}: ${info.subject}',
            '${loc.tlsCertIssuer}: ${info.issuer}',
            '${loc.tlsCertValidFrom}: ${info.startValidity.toIso8601String()}',
            '${loc.tlsCertValidUntil}: ${info.endValidity.toIso8601String()}',
            '',
            '${loc.tlsCertSha256}: ${info.sha256}',
          ].join('\n'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, false),
            child: Text(loc.cancel),
          ),
          TextButton(
            onPressed: () => Navigator.pop(dialogContext, true),
            child: Text(loc.confirm),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;

    final updated = server.copyWith(pinnedCertificateSha256: info.sha256);
    final result = await serversProvider.editServer(updated);
    if (!context.mounted) return;

    if (result == true) {
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.editServerSuccessfully,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: loc.cantSaveConnectionData,
      );
    }
  }
}

/// A widget that displays the connection status of a server.
///
/// Shows an icon and a label indicating whether the server is connected or disconnected.
/// The icon and text color change based on the connection status.
///
/// Parameters:
/// - [isConnected]: Whether the server is currently connected.
class _ConnectionStatus extends StatelessWidget {
  const _ConnectionStatus({required this.isConnected});

  final bool isConnected;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);
    final appColors = theme.extension<AppColors>()!;
    final connectedColor = appColors.queryGreen;
    final disconnectedColor = appColors.queryOrange;

    final color = isConnected ? connectedColor : disconnectedColor;
    final label = isConnected ? loc.connected : loc.selectedDisconnected;

    return Row(
      children: [
        Icon(isConnected ? Icons.check : Icons.warning, color: color),
        const SizedBox(width: 10),
        Text(
          label,
          style: TextStyle(color: color, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

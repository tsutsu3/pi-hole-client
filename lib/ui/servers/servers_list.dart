import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/servers/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/servers_tile_item.dart';
import 'package:pi_hole_client/ui/servers/unverified_certificates_banner.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';

class ServersList extends StatefulWidget {
  const ServersList({
    required this.context,
    required this.controllers,
    required this.onChange,
    required this.scrollController,
    required this.breakingWidth,
    super.key,
  });

  final BuildContext context;
  final List<ExpandableController> controllers;
  final Function(int) onChange;
  final ScrollController scrollController;
  final double breakingWidth;

  @override
  State<ServersList> createState() => _ServersListState();
}

class _ServersListState extends State<ServersList> {
  void _openEditServer(Server server) {
    final width = MediaQuery.of(context).size.width;

    if (width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useRootNavigator: false,
        barrierDismissible: false,
        builder: (context) => AddServerFullscreen(
          server: server,
          window: true,
          title: AppLocalizations.of(context)!.editConnection,
        ),
      );
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          fullscreenDialog: true,
          builder: (BuildContext context) => AddServerFullscreen(
            server: server,
            window: false,
            title: AppLocalizations.of(context)!.editConnection,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final serversList = context.select<ServersProvider, List<Server>>(
      (p) => p.getServersList,
    );
    final unverifiedServers = context.select<ServersProvider, List<Server>>(
      (p) => p.serversWithUnverifiedCertificates,
    );
    final bannerDismissed = context.select<ServersProvider, bool>(
      (p) => p.unverifiedBannerDismissed,
    );

    // Debug log
    logger.d('ServersList: total=${serversList.length}, unverified=${unverifiedServers.length}, dismissed=$bannerDismissed');
    for (final s in serversList) {
      logger.d('  - ${s.alias}: https=${s.address.toLowerCase().startsWith("https://")}, allowSelfSigned=${s.allowSelfSignedCert}, ignoreCertErrors=${s.ignoreCertificateErrors}, pinned=${s.pinnedCertificateSha256}');
    }

    if (serversList.isNotEmpty) {
      return ListView(
        padding: const EdgeInsets.only(bottom: 80),
        children: [
          if (unverifiedServers.isNotEmpty && !bannerDismissed)
            UnverifiedCertificatesBanner(
              servers: unverifiedServers,
              onServerTap: _openEditServer,
              onDismiss:
                  () => context
                      .read<ServersProvider>()
                      .setUnverifiedBannerDismissed(true),
            ),
          Wrap(
            children: serversList
                .asMap()
                .entries
                .map(
                  (s) => ServersTileItem(
                    breakingWidth: widget.breakingWidth,
                    server: serversList[s.key],
                    index: s.key,
                    onChange: widget.onChange,
                  ),
                )
                .toList(),
          ),
          const SizedBox(height: 8),
        ],
      );
    } else {
      return SizedBox(
        height: double.maxFinite,
        child: Center(
          child: Text(
            AppLocalizations.of(context)!.noSavedConnections,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 24,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
          ),
        ),
      );
    }
  }
}

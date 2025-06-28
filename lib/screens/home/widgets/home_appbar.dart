import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/switch_server_modal.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:provider/provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({required this.innerBoxIsScrolled, super.key});

  final bool innerBoxIsScrolled;

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Future<void> refresh() async {
      statusProvider.setStatusLoading(LoadStatus.loading);

      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.refreshingData);
      final result = await serversProvider.selectedApiGateway
          ?.realtimeStatus(clientCount: 0);
      process.close();
      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        serversProvider.updateselectedServerStatus(
          result!.data!.status == 'enabled' ? true : false,
        );
        statusProvider.setIsServerConnected(true);
        statusProvider.setRealtimeStatus(result.data!);
      } else {
        logger.w(
          'Error while fetching server status: ${result?.result.name}',
        );
        statusProvider.setIsServerConnected(false);
        if (statusProvider.getStatusLoading == LoadStatus.loading) {
          statusProvider.setStatusLoading(LoadStatus.error);
        }
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.couldNotConnectServer,
        );
      }
    }

    void changeServer() {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const ServersPage()),
      );
    }

    Future<void> connectToServer(Server server) async {
      final statusUpdateService = context.read<StatusUpdateService>();

      statusProvider.setStatusLoading(LoadStatus.loading);
      statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loading);

      Future<dynamic> connectSuccess(result) async {
        serversProvider.setselectedServer(
          server: Server(
            address: server.address,
            alias: server.alias,
            defaultServer: server.defaultServer,
            apiVersion: server.apiVersion,
            enabled: result.status == 'enabled' ? true : false,
            allowSelfSignedCert: server.allowSelfSignedCert,
          ),
        );
        final statusResult = await serversProvider.selectedApiGateway
            ?.realtimeStatus(clientCount: 0);
        if (statusResult?.result == APiResponseType.success) {
          statusProvider.setRealtimeStatus(statusResult!.data!);
        }
        final overtimeDataResult =
            await serversProvider.selectedApiGateway?.fetchOverTimeData();
        if (overtimeDataResult?.result == APiResponseType.success) {
          statusProvider.setOvertimeData(overtimeDataResult!.data!);
          statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loaded);
        } else {
          statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);
        }
        await statusUpdateService.refreshOnce();
      }

      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.connecting);

      final result = await serversProvider.loadApiGateway(server)?.loginQuery();
      process.close();
      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        await connectSuccess(result);
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.couldNotConnectServer,
        );
      }
    }

    void openSwitchServerModal() {
      showDialog(
        context: context,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (context) => SwitchServerModal(
          onServerSelect: connectToServer,
        ),
      );
    }

    return SliverAppBar.large(
      floating: true,
      centerTitle: false,
      forceElevated: innerBoxIsScrolled,
      leading: Icon(
        statusProvider.isServerConnected == true
            ? serversProvider.selectedServer!.enabled == true
                ? Icons.verified_user_rounded
                : Icons.gpp_bad_rounded
            : Icons.shield_rounded,
        size: 30,
        color: statusProvider.isServerConnected == true
            ? serversProvider.selectedServer!.enabled == true
                ? convertColor(serversProvider.colors, Colors.green)
                : convertColor(serversProvider.colors, Colors.red)
            : Colors.grey,
      ),
      title: InkWell(
        onTap: openSwitchServerModal,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: serversProvider.selectedServer != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            serversProvider.selectedServer!.alias,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Text(
                            serversProvider.selectedServer!.address,
                            style: TextStyle(
                              color: Theme.of(context).listTileTheme.textColor,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      )
                    : Text(
                        AppLocalizations.of(context)!.noServerSelected,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              Icon(
                Icons.sync_alt_rounded,
                color: Theme.of(context).listTileTheme.textColor,
              ),
            ],
          ),
        ),
      ),
      actions: [
        PopupMenuButton(
          splashRadius: 20,
          itemBuilder: (context) => serversProvider.selectedServer != null
              ? statusProvider.isServerConnected == true
                  ? [
                      PopupMenuItem(
                        onTap: refresh,
                        child: Row(
                          children: [
                            const Icon(Icons.refresh),
                            const SizedBox(width: 15),
                            Text(AppLocalizations.of(context)!.refresh),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: () => openUrl(
                          '${serversProvider.selectedServer!.address}/admin/',
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.web),
                            const SizedBox(width: 15),
                            Text(AppLocalizations.of(context)!.openWebPanel),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: changeServer,
                        child: Row(
                          children: [
                            const Icon(Icons.storage_rounded),
                            const SizedBox(width: 15),
                            Text(AppLocalizations.of(context)!.changeServer),
                          ],
                        ),
                      ),
                    ]
                  : [
                      PopupMenuItem(
                        onTap: refresh,
                        child: Row(
                          children: [
                            const Icon(Icons.refresh_rounded),
                            const SizedBox(width: 15),
                            Text(AppLocalizations.of(context)!.tryReconnect),
                          ],
                        ),
                      ),
                      PopupMenuItem(
                        onTap: changeServer,
                        child: Row(
                          children: [
                            const Icon(Icons.storage_rounded),
                            const SizedBox(width: 15),
                            Text(AppLocalizations.of(context)!.changeServer),
                          ],
                        ),
                      ),
                    ]
              : [
                  PopupMenuItem(
                    onTap: changeServer,
                    child: Row(
                      children: [
                        const Icon(Icons.storage_rounded),
                        const SizedBox(width: 15),
                        Text(AppLocalizations.of(context)!.selectServer),
                      ],
                    ),
                  ),
                ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

import 'package:flutter/material.dart';
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
import 'package:skeletonizer/skeletonizer.dart';

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

      final result = await serversProvider.selectedApiGateway
          ?.realtimeStatus(clientCount: 0);
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

    /// Attempts to connect to the given [server], updating the UI and relevant status providers accordingly.
    ///
    /// This method performs the following steps:
    ///
    /// 1. Sets both the main status and overtime data loading indicators to `loading`.
    /// 2. Attempts to log in to the API gateway associated with the provided [server].
    /// 3. If the login is successful:
    ///    - Updates the selected server in the provider.
    ///    - Concurrently fetches the real-time status and overtime data.
    ///    - Updates the status provider with the fetched data, or sets an error status if fetching fails.
    /// 4. If the login fails:
    ///    - Logs a warning message.
    ///    - Sets both the main status and overtime data loading statuses to `error`.
    ///    - Displays an error snackbar to notify the user.
    ///    - Triggers a one-time status refresh as a fallback (uses previously fetched server data if the refresh is unavailable).
    ///
    /// This method ensures UI updates are performed only if the [context] is still mounted.
    ///
    /// Parameters:
    /// - [server]: The [Server] instance to connect to.
    ///
    /// Returns:
    /// A [Future] that completes once the connection and data-fetching process has finished.

    Future<void> connectToServer(Server server) async {
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
        final apiGateway = serversProvider.selectedApiGateway;
        if (apiGateway == null) {
          logger.w('Selected API Gateway is null');
          return;
        }

        final results = await Future.wait([
          apiGateway.realtimeStatus(clientCount: 0),
          apiGateway.fetchOverTimeData(),
        ]);

        final statusResult = results[0] as RealtimeStatusResponse;
        final overtimeDataResult = results[1] as FetchOverTimeDataResponse;

        if (statusResult.result == APiResponseType.success) {
          statusProvider.setRealtimeStatus(statusResult.data!);
          statusProvider.setStatusLoading(LoadStatus.loaded);
        } else {
          logger.w(
            'Error while fetching realtime status: ${statusResult.result.name}',
          );
          statusProvider.setStatusLoading(LoadStatus.error);
        }

        if (overtimeDataResult.result == APiResponseType.success) {
          statusProvider.setOvertimeData(overtimeDataResult.data!);
          statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loaded);
        } else {
          logger.w(
            'Error while fetching overtime data: ${overtimeDataResult.result.name}',
          );
          statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);
        }
      }

      statusProvider.setIsServerConnected(false);
      final result = await serversProvider.loadApiGateway(server)?.loginQuery();
      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        statusProvider.setIsServerConnected(true);
        await connectSuccess(result);
      } else {
        logger.w(
          'Error while connecting to server: ${result?.result.name}',
        );

        statusProvider.setStatusLoading(LoadStatus.error);
        statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.couldNotConnectServer,
        );

        await context.read<StatusUpdateService>().refreshOnce();
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
                child: Skeletonizer(
                  enabled: !statusProvider.isServerConnected,
                  child: Column(
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

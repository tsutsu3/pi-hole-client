import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/servers/add_server_fullscreen.dart';
import 'package:pi_hole_client/screens/servers/delete_server_modal.dart';
import 'package:pi_hole_client/services/status_update_service.dart';
import 'package:provider/provider.dart';

class ServersTileItem extends StatefulWidget {
  const ServersTileItem({
    required this.server,
    required this.index,
    required this.onChange,
    required this.breakingWidth,
    super.key,
  });

  final Server server;
  final int index;
  final void Function(int) onChange;
  final double breakingWidth;

  @override
  State<ServersTileItem> createState() => _ServersTileItemState();
}

class _ServersTileItemState extends State<ServersTileItem>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final width = MediaQuery.of(context).size.width;

    /// Delete
    Future<void> showDeleteModal(Server server) async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;

        showDialog(
          context: context,
          useRootNavigator: false,
          builder: (context) => DeleteServerModal(
            serverToDelete: server,
          ),
          barrierDismissible: false,
        );
      });
    }

    /// Edit
    Future<void> openAddServerBottomSheet({Server? server}) async {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (!context.mounted) return;

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
      });
    }

    /// Connect to the server button
    Future<void> connectToServer(Server server) async {
      final statusUpdateService = context.read<StatusUpdateService>();

      Future<dynamic> connectSuccess(result) async {
        // appScreensNotSelected Layout only. Go to settings
        if (serversProvider.selectedServer == null &&
            appConfigProvider.selectedTab == 1) {
          appConfigProvider.setSelectedTab(4);
        }

        serversProvider.setselectedServer(
          server: Server(
            address: server.address,
            alias: server.alias,
            defaultServer: server.defaultServer,
            apiVersion: server.apiVersion,
            enabled: result.status == 'enabled' ? true : false,
            allowSelfSignedCert: server.allowSelfSignedCert,
            sm: server.sm,
          ),
        );
        final apiGateway = serversProvider.selectedApiGateway;
        final statusResult = await apiGateway?.realtimeStatus();
        if (statusResult?.result == APiResponseType.success) {
          statusProvider.setRealtimeStatus(statusResult!.data!);
        }
        final overtimeDataResult = await apiGateway?.fetchOverTimeData();
        if (overtimeDataResult?.result == APiResponseType.success) {
          statusProvider.setOvertimeData(overtimeDataResult!.data!);
          statusProvider.setOvertimeDataLoadingStatus(1);
        } else {
          statusProvider.setOvertimeDataLoadingStatus(2);
        }
        statusProvider.setIsServerConnected(true);
        statusUpdateService.startAutoRefresh();
        await statusUpdateService.refreshOnce();
      }

      await serversProvider.resetSelectedServer();
      if (!context.mounted) return;
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.connecting);

      final result = await serversProvider.loadApiGateway(server)?.loginQuery();
      if (result?.result == APiResponseType.success) {
        await connectSuccess(result);
        process.close();
      } else {
        process.close();

        if (!context.mounted) return;
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotConnect,
        );
      }
    }

    /// Set default server
    Future<void> setDefaultServer(Server server) async {
      final result = await serversProvider.setDefaultServer(server);
      if (!context.mounted) return;

      if (result == true) {
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.connectionDefaultSuccessfully,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.connectionDefaultFailed,
        );
      }
    }

    Widget leadingIcon(Server server) {
      if (server.defaultServer == true) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Icon(
              Icons.storage_rounded,
              color: serversProvider.selectedServer != null &&
                      serversProvider.selectedServer?.address == server.address
                  ? statusProvider.isServerConnected == true
                      ? Colors.green
                      : Colors.orange
                  : null,
            ),
            SizedBox(
              width: 25,
              height: 25,
              child: Stack(
                alignment: Alignment.bottomRight,
                children: [
                  Container(
                    padding: const EdgeInsets.all(1),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primaryContainer,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Icon(
                      Icons.star,
                      color: Theme.of(context).colorScheme.onPrimaryContainer,
                      size: 10,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      } else {
        return Icon(
          Icons.storage_rounded,
          color: serversProvider.selectedServer != null &&
                  serversProvider.selectedServer?.address == server.address
              ? statusProvider.isServerConnected == true
                  ? convertColor(serversProvider.colors, Colors.green)
                  : convertColor(serversProvider.colors, Colors.orange)
              : null,
        );
      }
    }

    Widget topRow(Server server, int index) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 16),
                  child: leadingIcon(server),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        server.address,
                        textAlign: TextAlign.left,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 3),
                          Text(
                            server.alias,
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    }

    Widget bottomRow(Server server, int index) {
      return Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PopupMenuButton(
                itemBuilder: (context) => [
                  PopupMenuItem(
                    enabled: server.defaultServer == false ? true : false,
                    onTap: server.defaultServer == false
                        ? (() => setDefaultServer(server))
                        : null,
                    child: SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          const Icon(Icons.star),
                          const SizedBox(width: 15),
                          Expanded(
                            child: Text(
                              server.defaultServer == true
                                  ? AppLocalizations.of(context)!
                                      .defaultConnection
                                  : AppLocalizations.of(context)!.setDefault,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () => openAddServerBottomSheet(server: server),
                    child: Row(
                      children: [
                        const Icon(Icons.edit),
                        const SizedBox(width: 15),
                        Text(AppLocalizations.of(context)!.edit),
                      ],
                    ),
                  ),
                  PopupMenuItem(
                    onTap: () => showDeleteModal(server),
                    child: Row(
                      children: [
                        const Icon(Icons.delete),
                        const SizedBox(width: 15),
                        Text(AppLocalizations.of(context)!.delete),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                child: serversProvider.selectedServer != null &&
                        serversProvider.selectedServer?.address ==
                            serversProvider.getServersList[index].address
                    ? Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Row(
                          children: [
                            Icon(
                              statusProvider.isServerConnected == true
                                  ? Icons.check
                                  : Icons.warning,
                              color: statusProvider.isServerConnected == true
                                  ? convertColor(
                                      serversProvider.colors,
                                      Colors.green,
                                    )
                                  : convertColor(
                                      serversProvider.colors,
                                      Colors.orange,
                                    ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              statusProvider.isServerConnected == true
                                  ? AppLocalizations.of(context)!.connected
                                  : AppLocalizations.of(context)!
                                      .selectedDisconnected,
                              style: TextStyle(
                                color: statusProvider.isServerConnected == true
                                    ? convertColor(
                                        serversProvider.colors,
                                        Colors.green,
                                      )
                                    : convertColor(
                                        serversProvider.colors,
                                        Colors.orange,
                                      ),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: FilledButton.icon(
                          icon: const Icon(Icons.login),
                          onPressed: () => connectToServer(server),
                          label: Text(AppLocalizations.of(context)!.connect),
                        ),
                      ),
              ),
            ],
          ),
        ],
      );
    }

    EdgeInsets generateMargins(int index) {
      if (index == 0) {
        return const EdgeInsets.only(top: 16, left: 16, right: 8, bottom: 8);
      }
      if (index == 1) {
        return const EdgeInsets.only(top: 16, left: 8, right: 16, bottom: 8);
      } else if (index == serversProvider.getServersList.length - 1 &&
          (index + 1).isEven) {
        return const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 16);
      } else if (index == serversProvider.getServersList.length - 1 &&
          (index + 1).isOdd) {
        return const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 16);
      } else {
        if ((index + 1).isEven) {
          return const EdgeInsets.only(top: 8, left: 8, right: 16, bottom: 8);
        } else {
          return const EdgeInsets.only(top: 8, left: 16, right: 8, bottom: 8);
        }
      }
    }

    return FractionallySizedBox(
      widthFactor: width > ResponsiveConstants.xLarge ? 0.5 : 1,
      child: Card(
        margin: width > ResponsiveConstants.xLarge
            ? generateMargins(widget.index)
            : const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: topRow(widget.server, widget.index),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: bottomRow(widget.server, widget.index),
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/enums.dart';
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
import 'package:pi_hole_client/screens/servers/server_tile_header.dart';
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
    final serversProvider = context.watch<ServersProvider>();
    final statusProvider = context.read<StatusProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();
    final isServerConnected = context.select<StatusProvider, bool>(
      (p) => p.isServerConnected,
    );

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
                              isServerConnected ? Icons.check : Icons.warning,
                              color: isServerConnected
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
                              isServerConnected
                                  ? AppLocalizations.of(context)!.connected
                                  : AppLocalizations.of(context)!
                                      .selectedDisconnected,
                              style: TextStyle(
                                color: isServerConnected
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
                          onPressed: () => _connectToServer(
                            context,
                            appConfigProvider,
                            serversProvider,
                            statusProvider,
                            server,
                          ),
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
                child: ServerTileHeader(server: widget.server)),
            Padding(
              padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
              child: bottomRow(widget.server, widget.index),
            ),
          ],
        ),
      ),
    );
  }

  /// Connect to the server button
  Future<void> _connectToServer(
    BuildContext context,
    AppConfigProvider appConfigProvider,
    ServersProvider serversProvider,
    StatusProvider statusProvider,
    Server server,
  ) async {
    final statusUpdateService = context.read<StatusUpdateService>();

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.connecting);
    // Commented out to prevent the previously selected server from briefly
    // appearing as "Selected but disconnected" when switching.
    // statusProvider.setIsServerConnected(false);
    final result = await serversProvider.loadApiGateway(server)?.loginQuery();
    // await serversProvider.resetSelectedServer();
    // if (!context.mounted) return;

    if (result?.result == APiResponseType.success) {
      // Prevents the newly selected server from briefly appearing as "Selected
      // but disconnected" when switching from A to B.
      statusProvider.setIsServerConnected(true);
      process.close();
      if (!context.mounted) return;

      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.connectedSuccessfully,
      );

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
          enabled: result!.status == 'enabled',
          allowSelfSignedCert: server.allowSelfSignedCert,
          sm: server.sm,
        ),
      );

      // Run background task to handle get data
      unawaited(
        _handleConnectionSetup(
          serversProvider: serversProvider,
          statusProvider: statusProvider,
          statusUpdateService: statusUpdateService,
        ),
      );
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

  /// Initializes status-related data after a successful server connection.
  ///
  /// This method performs the following steps:
  /// 1. Sets the loading status for overtime data.
  /// 2. Retrieves the current realtime status from the API and updates the provider.
  /// 3. Fetches the 24-hour overtime chart data and updates the provider.
  ///    - If the API call fails, the status is marked as error.
  /// 4. Marks the server as connected in the [StatusProvider].
  /// 5. Starts the periodic auto-refresh using [StatusUpdateService].
  ///
  /// This should be called immediately after a successful login/authentication.
  ///
  /// Parameters:
  /// - [serversProvider]: Provider that holds the current server and API access.
  /// - [statusProvider]: Provider that manages server connection status and statistics.
  /// - [statusUpdateService]: Manages auto-refresh and polling.
  Future<void> _handleConnectionSetup({
    required ServersProvider serversProvider,
    required StatusProvider statusProvider,
    required StatusUpdateService statusUpdateService,
  }) async {
    statusProvider.setStatusLoading(LoadStatus.loading);
    statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loading);

    final apiGateway = serversProvider.selectedApiGateway;

    final statusResult = await apiGateway?.realtimeStatus(clientCount: 0);
    if (statusResult?.result == APiResponseType.success) {
      statusProvider.setRealtimeStatus(statusResult!.data!);
      statusProvider.setStatusLoading(LoadStatus.loaded);
    }

    final overtimeDataResult = await apiGateway?.fetchOverTimeData();
    if (overtimeDataResult?.result == APiResponseType.success) {
      statusProvider.setOvertimeData(overtimeDataResult!.data!);
      statusProvider.setOvertimeDataLoadingStatus(LoadStatus.loaded);
    } else {
      statusProvider.setOvertimeDataLoadingStatus(LoadStatus.error);
    }

    statusProvider.setIsServerConnected(true);
    statusUpdateService.startAutoRefresh();
  }
}

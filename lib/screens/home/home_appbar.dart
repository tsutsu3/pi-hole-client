// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pi_hole_client/gateways/api_gateway_factory.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/screens/home/switch_server_modal.dart';
import 'package:pi_hole_client/screens/servers/servers.dart';

import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/config/system_overlay_style.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool innerBoxIsScrolled;

  const HomeAppBar({super.key, required this.innerBoxIsScrolled});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;

    final width = MediaQuery.of(context).size.width;

    void refresh() async {
      final ProcessModal process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.refreshingData);
      final result = await apiGateway?.realtimeStatus();
      process.close();
      if (result['result'] == "success") {
        serversProvider.updateselectedServerStatus(
            result['data'].status == 'enabled' ? true : false);
        statusProvider.setIsServerConnected(true);
        statusProvider.setRealtimeStatus(result['data']);
      } else {
        statusProvider.setIsServerConnected(false);
        if (statusProvider.getStatusLoading == LoadStatus.loading) {
          statusProvider.setStatusLoading(LoadStatus.error);
        }
        showSnackBar(
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.notConnectServer,
            color: Colors.red);
      }
    }

    void changeServer() {
      Future.delayed(
          const Duration(seconds: 0),
          () => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ServersPage()))
              });
    }

    void connectToServer(Server server) async {
      Future connectSuccess(result) async {
        serversProvider.setselectedServer(
            server: Server(
                address: server.address,
                alias: server.alias,
                token: server.token!,
                defaultServer: server.defaultServer,
                apiVersion: server.apiVersion,
                enabled: result.status == 'enabled' ? true : false));
        final statusResult = await apiGateway?.realtimeStatus();
        if (statusResult['result'] == 'success') {
          statusProvider.setRealtimeStatus(statusResult['data']);
        }
        final overtimeDataResult = await apiGateway?.fetchOverTimeData();
        if (overtimeDataResult['result'] == 'success') {
          statusProvider.setOvertimeData(overtimeDataResult['data']);
          statusProvider.setOvertimeDataLoadingStatus(1);
        } else {
          statusProvider.setOvertimeDataLoadingStatus(2);
        }
        statusProvider.setIsServerConnected(true);
        statusProvider.setRefreshServerStatus(true);
      }

      final ProcessModal process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.connecting);

      final result = await ApiGatewayFactory.create(server).loginQuery();
      process.close();
      if (result.result == APiResponseType.success) {
        await connectSuccess(result);
      } else {
        showSnackBar(
            appConfigProvider: appConfigProvider,
            label: AppLocalizations.of(context)!.cannotConnect,
            color: Colors.red);
      }
    }

    void openSwitchServerModal() {
      showDialog(
          context: context,
          builder: (context) => SwitchServerModal(
                onServerSelect: connectToServer,
              ));
    }

    return SliverAppBar.large(
      systemOverlayStyle: systemUiOverlayStyleConfig(context),
      pinned: true,
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
                  ? Colors.green
                  : Colors.red
              : Colors.grey),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: openSwitchServerModal,
            child: serversProvider.selectedServer != null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        serversProvider.selectedServer!.alias,
                        style: const TextStyle(fontSize: 20),
                      ),
                      Text(serversProvider.selectedServer!.address,
                          style: TextStyle(
                              color: Theme.of(context).listTileTheme.textColor,
                              fontSize: 14))
                    ],
                  )
                : SizedBox(
                    width: width - 128,
                    child: Text(
                      AppLocalizations.of(context)!.noServerSelected,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
          )
        ],
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
                                Text(AppLocalizations.of(context)!.refresh)
                              ],
                            )),
                        PopupMenuItem(
                            onTap: () => openUrl(
                                '${serversProvider.selectedServer!.address}/admin/'),
                            child: Row(
                              children: [
                                const Icon(Icons.web),
                                const SizedBox(width: 15),
                                Text(AppLocalizations.of(context)!.openWebPanel)
                              ],
                            )),
                        PopupMenuItem(
                            onTap: changeServer,
                            child: Row(
                              children: [
                                const Icon(Icons.storage_rounded),
                                const SizedBox(width: 15),
                                Text(AppLocalizations.of(context)!.changeServer)
                              ],
                            )),
                      ]
                    : [
                        PopupMenuItem(
                            onTap: refresh,
                            child: Row(
                              children: [
                                const Icon(Icons.refresh_rounded),
                                const SizedBox(width: 15),
                                Text(AppLocalizations.of(context)!.tryReconnect)
                              ],
                            )),
                        PopupMenuItem(
                            onTap: changeServer,
                            child: Row(
                              children: [
                                const Icon(Icons.storage_rounded),
                                const SizedBox(width: 15),
                                Text(AppLocalizations.of(context)!.changeServer)
                              ],
                            )),
                      ]
                : [
                    PopupMenuItem(
                        onTap: changeServer,
                        child: Row(
                          children: [
                            const Icon(Icons.storage_rounded),
                            const SizedBox(width: 15),
                            Text(AppLocalizations.of(context)!.selectServer)
                          ],
                        )),
                  ])
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70);
}

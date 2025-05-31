import 'package:flutter/material.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/interface_screen.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class AdvancedServerOptions extends StatelessWidget {
  const AdvancedServerOptions({super.key});

  @override
  Widget build(BuildContext context) {
    final apiGateway = context.select<ServersProvider, ApiGateway?>(
      (provider) => provider.selectedApiGateway,
    );

    if (apiGateway == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.interface),
        ),
        body: const SafeArea(
          child: EmptyDataScreen(),
        ),
      );
    }

    if (apiGateway.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.adlistManagementTitle),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.advancedSetup,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            left: 16,
          ),
          child: ListView(
            children: [
              // SectionLabel(label: AppLocalizations.of(context)!.actions),
              // CustomListTile(
              //   leadingIcon: Icons.restart_alt_rounded,
              //   label: AppLocalizations.of(context)!.disableQueryLogging,
              // ),
              // CustomListTile(
              //   leadingIcon: Icons.restart_alt_rounded,
              //   label: AppLocalizations.of(context)!.restartDnsResolver,
              // ),
              // CustomListTile(
              //   leadingIcon: Icons.delete_forever_rounded,
              //   label: AppLocalizations.of(context)!.flushNetworkTable,
              // ),
              // CustomListTile(
              //   leadingIcon: Icons.delete_forever_rounded,
              //   label: AppLocalizations.of(context)!.flushLogs24h,
              // ),
              // SectionLabel(label: AppLocalizations.of(context)!.system),
              // CustomListTile(
              //   leadingIcon: Icons.settings_ethernet_rounded,
              //   label: AppLocalizations.of(context)!.dhcp,
              //   description: AppLocalizations.of(context)!.dhcpDescription,
              // ),
              // CustomListTile(
              //   leadingIcon: Icons.devices_rounded,
              //   label: AppLocalizations.of(context)!.sessions,
              //   description: AppLocalizations.of(context)!.sessionsDescription,
              // ),
              SectionLabel(label: AppLocalizations.of(context)!.tools),
              // CustomListTile(
              //   leadingIcon: Icons.manage_search_rounded,
              //   label: AppLocalizations.of(context)!.searchAdlistsTitle,
              //   description:
              //       AppLocalizations.of(context)!.searchAdlistsDescription,
              // ),
              CustomListTile(
                leadingIcon: Icons.wifi_rounded,
                label: AppLocalizations.of(context)!.interface,
                description: AppLocalizations.of(context)!.interfaceDescription,
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const InterfaceScreen(),
                  ),
                ),
              ),
              // CustomListTile(
              //   leadingIcon: Icons.lan_rounded,
              //   label: AppLocalizations.of(context)!.network,
              //   description: AppLocalizations.of(context)!.networkDescription,
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

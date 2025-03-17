import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/custom_scroll_behavior.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/common/error_message_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/host_information_section.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/performance_usage_section.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/pihole_version_section.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/server_connection_section.dart';
import 'package:provider/provider.dart';

class ServerInfoScreen extends StatelessWidget {
  const ServerInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final apiGateway = context.select<ServersProvider, ApiGateway?>(
      (provider) => provider.selectedApiGateway,
    );
    final server = context.select<ServersProvider, Server?>(
      (provider) => provider.selectedServer,
    );

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.serverInfo),
        ),
        body: FutureBuilder(
          future: apiGateway?.fetchAllServerInfo(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return ErrorMessageScreen(
                message: AppLocalizations.of(context)!.dataFetchFailed,
              );
            } else if (!snapshot.hasData) {
              return const EmptyDataScreen();
            }

            final serverInfo = snapshot.data;
            final version = serverInfo?.version;
            final host = serverInfo?.host;
            final system = serverInfo?.system;
            final sensor = serverInfo?.sensors;

            logger.d('Server Info version: ${version?.toJson()}');
            logger.d('Server Info host: ${host?.toJson()}');
            logger.d('Server Info system: ${system?.toJson()}');
            logger.d('Server Info sensor: ${sensor?.toJson()}');

            return SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ServerConnectionSection(server: server),
                  const SizedBox(height: 20),
                  // v5 API not support host info and usage info
                  if (apiGateway?.server.apiVersion != 'v5') ...[
                    HostInformationSection(host: host),
                    const SizedBox(height: 20),
                    PerformanceUsageSection(system: system, sensors: sensor),
                    const SizedBox(height: 20),
                  ],
                  PiholeVersionSection(version: version),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/version.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/host_information_section.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/performance_usage_section.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/pihole_version_section.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/server_info/server_connection_section.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui2/core/ui/components/error_message.dart';
import 'package:pi_hole_client/utils2/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

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

    if (apiGateway == null || server == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.serverInfo),
        ),
        body: const SafeArea(
          child: EmptyDataScreen(),
        ),
      );
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.serverInfo),
        ),
        body: SafeArea(
          child: FutureBuilder(
            future: apiGateway.fetchAllServerInfo(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return _buildSkeletonLoading(context, server, apiGateway);
              } else if (snapshot.hasError) {
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              } else if (!snapshot.hasData) {
                return const EmptyDataScreen();
              }

              final serverInfo = snapshot.data;

              if (serverInfo?.result != APiResponseType.success) {
                logger.e('Server Info fetch failed: ${serverInfo?.result}');
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              }

              logger.d('Server Info version: ${serverInfo?.version?.toJson()}');
              logger.d('Server Info host: ${serverInfo?.host?.toJson()}');
              logger.d('Server Info system: ${serverInfo?.system?.toJson()}');
              logger.d('Server Info sensor: ${serverInfo?.sensors?.toJson()}');

              return _buildServerInfoContent(
                server: server,
                apiGateway: apiGateway,
                host: serverInfo?.host,
                system: serverInfo?.system,
                sensors: serverInfo?.sensors,
                version: serverInfo?.version,
              );
            },
          ),
        ),
      ),
    );
  }

  // Show a skeleton loading screen while fetching data
  Widget _buildSkeletonLoading(
    BuildContext context,
    Server? server,
    ApiGateway? apiGateway,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Skeletonizer(
        effect: ShimmerEffect(
          baseColor: Theme.of(context).colorScheme.secondaryContainer,
          highlightColor: Theme.of(context).colorScheme.surface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ServerConnectionSection(server: server),
            const SizedBox(height: 20),
            if (apiGateway?.server.apiVersion != 'v5') ...[
              const HostInformationSection(host: null),
              const SizedBox(height: 20),
              const PerformanceUsageSection(system: null, sensors: null),
              const SizedBox(height: 20),
            ],
            PiholeVersionSection(version: VersionInfo.fromJson({})),
          ],
        ),
      ),
    );
  }

  // Show the server information content. After fetching the data, show the actual content
  Widget _buildServerInfoContent({
    required Server? server,
    required ApiGateway? apiGateway,
    required dynamic host,
    required dynamic system,
    required dynamic sensors,
    required VersionInfo? version,
  }) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServerConnectionSection(server: server),
          const SizedBox(height: 20),
          if (apiGateway?.server.apiVersion != 'v5') ...[
            HostInformationSection(host: host),
            const SizedBox(height: 20),
            PerformanceUsageSection(system: system, sensors: sensors),
            const SizedBox(height: 20),
          ],
          PiholeVersionSection(version: version),
        ],
      ),
    );
  }
}

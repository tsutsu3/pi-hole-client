import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/domain/models_old/version.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/host_information_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/performance_usage_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/pihole_version_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/server_connection_section.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ServerInfoScreen extends StatefulWidget {
  const ServerInfoScreen({super.key});

  @override
  State<ServerInfoScreen> createState() => _ServerInfoScreenState();
}

class _ServerInfoScreenState extends State<ServerInfoScreen> {
  ApiGateway? _apiGateway;
  Server? _server;
  Future<PiHoleServerInfoResponse>? _serverInfoFuture;
  bool _initialized = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final newGateway = context.watch<ServersProvider>().selectedApiGateway;
    final newServer = context.watch<ServersProvider>().selectedServer;

    if (!_initialized) {
      _apiGateway = newGateway;
      _server = newServer;
      _serverInfoFuture = _apiGateway?.fetchAllServerInfo();
      _initialized = true;
    } else if (newGateway != _apiGateway || newServer != _server) {
      _apiGateway = newGateway;
      _server = newServer;
      setState(() {
        _serverInfoFuture = _apiGateway?.fetchAllServerInfo();
      });
    }
  }

  Future<void> _handleRefresh() async {
    if (_apiGateway == null) {
      return;
    }

    setState(() {
      _serverInfoFuture = _apiGateway!.fetchAllServerInfo();
    });

    try {
      await _serverInfoFuture;
    } catch (e, s) {
      logger.e('Error during refresh', error: e, stackTrace: s);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_apiGateway == null || _server == null) {
      return Scaffold(
        appBar: AppBar(title: Text(AppLocalizations.of(context)!.serverInfo)),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.serverInfo),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: _handleRefresh,
                tooltip: AppLocalizations.of(context)!.refresh,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: RefreshIndicator(
            onRefresh: _handleRefresh,
            child: FutureBuilder<PiHoleServerInfoResponse>(
              future: _serverInfoFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return _buildSkeletonLoading(context, _server, _apiGateway);
                } else if (snapshot.hasError) {
                  return _wrapWithScroll(
                    ErrorMessage(
                      message: AppLocalizations.of(context)!.dataFetchFailed,
                    ),
                  );
                } else if (!snapshot.hasData) {
                  return _wrapWithScroll(const EmptyDataScreen());
                }

                final serverInfo = snapshot.data;

                if (serverInfo?.result != APiResponseType.success) {
                  logger.e('Server Info fetch failed: ${serverInfo?.result}');
                  return _wrapWithScroll(
                    ErrorMessage(
                      message: AppLocalizations.of(context)!.dataFetchFailed,
                    ),
                  );
                }

                logger.d(
                  'Server Info version: ${serverInfo?.version?.toJson()}',
                );
                logger.d('Server Info host: ${serverInfo?.host?.toJson()}');
                logger.d('Server Info system: ${serverInfo?.system?.toJson()}');
                logger.d(
                  'Server Info sensor: ${serverInfo?.sensors?.toJson()}',
                );

                return _buildServerInfoContent(
                  server: _server,
                  apiGateway: _apiGateway,
                  host: serverInfo?.host,
                  system: serverInfo?.system,
                  sensors: serverInfo?.sensors,
                  version: serverInfo?.version,
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  Widget _wrapWithScroll(Widget child) {
    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [
        SliverFillRemaining(hasScrollBody: false, child: Center(child: child)),
      ],
    );
  }

  // Show a skeleton loading screen while fetching data
  Widget _buildSkeletonLoading(
    BuildContext context,
    Server? server,
    ApiGateway? apiGateway,
  ) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
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
      physics: const AlwaysScrollableScrollPhysics(),
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

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/viewmodel/server_info_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/host_information_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/performance_usage_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/pihole_version_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/server_info/server_connection_section.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ServerInfoScreen extends StatelessWidget {
  const ServerInfoScreen({
    required this.viewModel,
    required this.serverAlias,
    required this.serverAddress,
    super.key,
  });

  final ServerInfoViewModel viewModel;
  final String serverAlias;
  final String serverAddress;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: viewModel,
      builder: (context, _) {
        final isLoading = viewModel.loadServerInfo.isRunning.value;
        final hasError = viewModel.loadServerInfo.errors.value != null;
        final serverInfo = viewModel.loadServerInfo.value;

        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.serverInfo),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => viewModel.loadServerInfo.run(),
                    tooltip: locale.refresh,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  try {
                    await viewModel.loadServerInfo.runAsync();
                  } catch (_) {
                    // Error handled by command.errors
                  }
                },
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return _buildSkeletonLoading(
                        context,
                        serverInfo: serverInfo,
                      );
                    }

                    if (hasError) {
                      return _wrapWithScroll(
                        ErrorMessage(message: locale.dataFetchFailed),
                      );
                    }

                    return _buildContent(serverInfo: serverInfo);
                  },
                ),
              ),
            ),
          ),
        );
      },
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

  Widget _buildSkeletonLoading(
    BuildContext context, {
    required PiholeServer serverInfo,
  }) {
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
            ServerConnectionSection(
              serverAlias: serverAlias,
              serverAddress: serverAddress,
            ),
            const SizedBox(height: 20),
            const HostInformationSection(host: null),
            const SizedBox(height: 20),
            const PerformanceUsageSection(system: null, sensors: null),
            const SizedBox(height: 20),
            const PiholeVersionSection(version: null),
          ],
        ),
      ),
    );
  }

  Widget _buildContent({required PiholeServer serverInfo}) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ServerConnectionSection(
            serverAlias: serverAlias,
            serverAddress: serverAddress,
          ),
          const SizedBox(height: 20),
          if (serverInfo.host != null) ...[
            HostInformationSection(host: serverInfo.host),
            const SizedBox(height: 20),
            PerformanceUsageSection(
              system: serverInfo.system,
              sensors: serverInfo.sensor,
            ),
            const SizedBox(height: 20),
          ],
          PiholeVersionSection(version: serverInfo.version),
        ],
      ),
    );
  }
}

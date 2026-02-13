import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:pi_hole_client/ui/common/dhcp_disabled_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/dhcp_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/dhcp_list_view.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/viewmodel/dhcp_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
final _fakeLease = DhcpLease(
  name: 'raspberrypi',
  hwaddr: '00:00:00:00:00:00',
  ip: '192.168.2.111',
  clientid: '00:00:00:00:00:00',
  expires: DateTime(2025, 6, 28, 10),
);
final _fakeLeases = List.filled(5, _fakeLease);

/// A screen that displays DHCP leases from the selected server.
///
/// Loads DHCP leases and client IP info, shows a lease list, and supports
/// viewing and deleting leases. Handles loading, error, and empty states.
class DhcpScreen extends StatefulWidget {
  const DhcpScreen({required this.viewModel, super.key});

  final DhcpViewModel viewModel;

  @override
  State<DhcpScreen> createState() => _DhcpScreenState();
}

class _DhcpScreenState extends State<DhcpScreen> {
  Future<void> _removeLease(DhcpLease lease) async {
    final locale = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final process = ProcessModal(context: context);
    process.open(locale.deleting);

    try {
      await widget.viewModel.deleteLease.runAsync(lease.ip);
      if (!mounted) return;
      process.close();
      // TODO: migrate to context.pop() when detail screen uses go_router
      await Navigator.maybePop(context);

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.dhcpRemoved,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.deviceDeleteFailed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final viewModel = widget.viewModel;
        final isLoading = viewModel.loadLeases.isRunning.value;
        final hasError = viewModel.loadLeases.errors.value != null;
        final dhcpData = viewModel.loadLeases.value;

        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.dhcp),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => viewModel.loadLeases.run(),
                    tooltip: locale.refresh,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  try {
                    await viewModel.loadLeases.runAsync();
                  } catch (_) {
                    // Error handled by command.errors
                  }
                },
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return Skeletonizer(
                        effect: ShimmerEffect(
                          baseColor: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          highlightColor:
                              Theme.of(context).colorScheme.surface,
                        ),
                        child: DhcpListView(
                          leases: _fakeLeases,
                          currentClientIp: '',
                          onLeaseTap: (lease) {},
                        ),
                      );
                    }

                    if (hasError) {
                      return ErrorMessage(message: locale.dataFetchFailed);
                    }

                    if (dhcpData.leases.isEmpty) {
                      return const DhcpDisabledScreen();
                    }

                    return DhcpListView(
                      leases: dhcpData.leases,
                      currentClientIp: dhcpData.currentClientIp,
                      onLeaseTap: (lease) {
                        // TODO: migrate to go_router named route
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DhcpDetailScreen(
                              lease: lease,
                              onDelete: _removeLease,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

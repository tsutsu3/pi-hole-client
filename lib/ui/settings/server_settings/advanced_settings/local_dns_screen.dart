import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/add_local_dns_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/local_dns_list_view.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/viewmodel/local_dns_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
const _fakeLocalDnsInfo = [
  LocalDns(ip: '192.168.2.111', name: 'raspberrypi'),
  LocalDns(ip: '192.168.2.112', name: 'printer'),
  LocalDns(ip: '192.168.2.113', name: 'laptop'),
];

class LocalDnsScreen extends StatefulWidget {
  const LocalDnsScreen({required this.viewModel, super.key});

  final LocalDnsViewModel viewModel;

  @override
  State<LocalDnsScreen> createState() => _LocalDnsScreenState();
}

class _LocalDnsScreenState extends State<LocalDnsScreen> {
  Future<bool> _onAddLocalDns(Map<String, dynamic> value) async {
    final locale = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final process = ProcessModal(context: context)
      ..open(locale.localDnsAdding);

    try {
      await widget.viewModel.addRecord.runAsync(
        LocalDns(ip: value['ip'], name: value['name']),
      );
      if (!mounted) return false;
      process.close();
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.localDnsAddSuccess,
      );
      return true;
    } catch (_) {
      if (!mounted) return false;
      process.close();
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.localDnsAddFailed,
      );
      return false;
    }
  }

  Future<bool> _onUpdateLocalDns(LocalDns updated, String oldIp) async {
    final locale = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final process = ProcessModal(context: context)..open(locale.updating);

    try {
      await widget.viewModel.updateRecord.runAsync(
        (record: updated, oldIp: oldIp),
      );
      if (!mounted) return false;
      process.close();
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.localDnsUpdateSuccess,
      );
      return true;
    } catch (_) {
      if (!mounted) return false;
      process.close();
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.localDnsUpdateFailed,
      );
      return false;
    }
  }

  Future<bool> _onRemoveLocalDns(LocalDns item) async {
    final locale = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final process = ProcessModal(context: context)..open(locale.deleting);

    try {
      await widget.viewModel.deleteRecord.runAsync(item);
      if (!mounted) return false;
      process.close();
      await Navigator.maybePop(context);
      if (!mounted) return true;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.localDnsDeleteSuccess,
      );
      return true;
    } catch (_) {
      if (!mounted) return false;
      process.close();
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.localDnsDeleteFailed,
      );
      return false;
    }
  }

  void _openAddModal() {
    final mediaQuery = MediaQuery.of(context);
    final isSmallLandscape =
        mediaQuery.size.width > mediaQuery.size.height &&
        mediaQuery.size.height < ResponsiveConstants.medium;
    final devices = widget.viewModel.loadRecords.value.deviceOptions;

    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useSafeArea: !isSmallLandscape,
        useRootNavigator: false,
        builder: (ctx) => AddLocalDnsModal(
          addLocalDns: _onAddLocalDns,
          window: true,
          devices: devices,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => AddLocalDnsModal(
          addLocalDns: _onAddLocalDns,
          window: false,
          devices: devices,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
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
        final isLoading = viewModel.loadRecords.isRunning.value;
        final hasError = viewModel.loadRecords.errors.value != null;
        final data = viewModel.loadRecords.value;

        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.localDns),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => viewModel.loadRecords.run(),
                    tooltip: locale.refresh,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  try {
                    await viewModel.loadRecords.runAsync();
                  } catch (_) {
                    // Error handled by command.errors
                  }
                },
                child: Stack(
                  children: [
                    Builder(
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
                            child: LocalDnsListView(
                              localDnsInfo: _fakeLocalDnsInfo,
                              onDeviceTap: (_) {},
                            ),
                          );
                        }

                        if (hasError) {
                          return ErrorMessage(message: locale.dataFetchFailed);
                        }

                        if (data.records.isEmpty) {
                          return EmptyDataScreen(
                            message: locale.localDnsEmptyDescription,
                          );
                        }

                        return LocalDnsListView(
                          localDnsInfo: data.records,
                          onDeviceTap: (localDns) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => LocalDnsDetailScreen(
                                  localDns: localDns,
                                  devices: data.deviceOptions,
                                  onDelete: (ld) async =>
                                      _onRemoveLocalDns(ld),
                                  onUpdate: _onUpdateLocalDns,
                                ),
                              ),
                            );
                          },
                        );
                      },
                    ),

                    Selector<AppConfigProvider, bool>(
                      selector: (_, a) => a.showingSnackbar,
                      builder: (_, showingSnackbar, _) {
                        return AnimatedPositioned(
                          duration: const Duration(milliseconds: 100),
                          curve: Curves.easeInOut,
                          bottom: showingSnackbar ? 70 : 20,
                          right: 20,
                          child: FloatingActionButton(
                            onPressed: _openAddModal,
                            child: const Icon(Icons.add),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

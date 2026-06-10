import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/ui/core/actions/handle_certificate_recovery.dart';
import 'package:pi_hole_client/ui/core/actions/refresh_server_status.dart';
import 'package:pi_hole_client/ui/core/actions/server_management.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/home/widgets/disable_modal.dart';
import 'package:pi_hole_client/ui/home/widgets/home_appbar.dart';
import 'package:pi_hole_client/ui/home/widgets/home_charts.dart';
import 'package:pi_hole_client/ui/home/widgets/home_tiles.dart';
import 'package:pi_hole_client/ui/home/widgets/server_status_chips.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    required this.serversViewModel,
    required this.appConfigViewModel,
    required this.statusViewModel,
    super.key,
  });

  final ServersViewModel serversViewModel;
  final AppConfigViewModel appConfigViewModel;
  final StatusViewModel statusViewModel;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late bool isVisible;
  final ScrollController scrollController = ScrollController();
  bool _handlingCertError = false;

  @override
  void initState() {
    super.initState();

    isVisible = true;
    scrollController.addListener(_scrollListener);
    widget.statusViewModel.addListener(_onStatusViewModelChanged);
  }

  @override
  void didUpdateWidget(covariant HomeScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    // statusViewModel is an app singleton so this rarely changes, but re-bind
    // the listener defensively if a new instance is ever passed in.
    if (oldWidget.statusViewModel != widget.statusViewModel) {
      oldWidget.statusViewModel.removeListener(_onStatusViewModelChanged);
      widget.statusViewModel.addListener(_onStatusViewModelChanged);
    }
  }

  // Show the certificate recovery dialog when auto-refresh stops on a TLS error.
  void _onStatusViewModelChanged() {
    final error = widget.statusViewModel.fatalConnectionError;
    if (error == null || _handlingCertError) return;
    _handlingCertError = true;
    widget.statusViewModel.clearFatalConnectionError();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      // Refresh immediately only when the pin was updated.
      if (mounted && await handleCertificateRecovery(context, error)) {
        if (mounted) await refreshServerStatus(context);
      }
      _handlingCertError = false;
    });
  }

  void _scrollListener() {
    if (scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else {
      if (scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (mounted && isVisible == false) {
          setState(() => isVisible = true);
        }
      }
    }
  }

  @override
  void dispose() {
    scrollController.removeListener(_scrollListener);
    scrollController.dispose();
    widget.statusViewModel.removeListener(_onStatusViewModelChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Unmount content when this branch is inactive so that Provider select
    // subscriptions in HomeTiles and HomeCharts are disposed and do not
    // rebuild on every 5-second timer tick while the user is on another screen.
    if (!TickerMode.valuesOf(context).enabled) return const SizedBox.shrink();
    return ListenableBuilder(
      listenable: widget.serversViewModel,
      builder: (context, _) => _buildContent(context),
    );
  }

  Widget _buildContent(BuildContext context) {
    final serversViewModel = widget.serversViewModel;
    final width = MediaQuery.of(context).size.width;

    return serversViewModel.selectedServer != null
        ? Stack(
            children: [
              Scaffold(
                body: SafeArea(
                  child: NestedScrollView(
                    headerSliverBuilder:
                        (BuildContext context, bool innerBoxIsScrolled) {
                          return <Widget>[
                            SliverOverlapAbsorber(
                              handle:
                                  NestedScrollView.sliverOverlapAbsorberHandleFor(
                                    context,
                                  ),
                              sliver: HomeAppBar(
                                innerBoxIsScrolled: innerBoxIsScrolled,
                              ),
                            ),
                          ];
                        },
                    body: SafeArea(
                      top: false,
                      bottom: false,
                      child: Builder(
                        builder: (context) => RefreshIndicator(
                          edgeOffset: 70,
                          onRefresh: () async {
                            await refreshServerStatus(context);
                          },
                          child: CustomScrollView(
                            slivers: [
                              SliverOverlapInjector(
                                handle:
                                    NestedScrollView.sliverOverlapAbsorberHandleFor(
                                      context,
                                    ),
                              ),
                              SliverList.list(
                                children: [
                                  // Chips data is not available for V5, so it is not displayed
                                  if (serversViewModel
                                          .selectedServer
                                          ?.apiVersion !=
                                      SupportedApiVersions.v5) ...[
                                    const ServerStatusChips(),
                                    const SizedBox(height: 24),
                                  ],
                                  HomeTiles(width: width),
                                  const SizedBox(height: 24),
                                  const HomeCharts(),
                                  const SizedBox(height: 90),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              _HomeFab(isVisible: isVisible),
            ],
          )
        : const SizedBox();
  }
}

class _HomeFab extends StatelessWidget {
  const _HomeFab({required this.isVisible});

  final bool isVisible;

  @override
  Widget build(BuildContext context) {
    final statusLoading = context.select<StatusViewModel, LoadStatus>(
      (vm) => vm.getStatusLoading,
    );
    final showingSnackbar = context.select<AppConfigViewModel, bool>(
      (vm) => vm.showingSnackbar,
    );

    final width = MediaQuery.of(context).size.width;

    double fabPosition() {
      if (isVisible && statusLoading == LoadStatus.loaded) {
        if (showingSnackbar) {
          final isSmallScreen = width <= ResponsiveConstants.medium;
          return isSmallScreen ? 100.0 : 70.0;
        }
        return 20.0;
      }

      // If the FAB is not visible, it should be off-screen
      return -70.0;
    }

    return SafeArea(
      child: Stack(
        children: [
          AnimatedPositioned(
            duration: const Duration(milliseconds: 100),
            curve: Curves.easeInOut,
            bottom: fabPosition(),
            right: 20,
            child: FloatingActionButton(
              onPressed: () async {
                final serversVM = context.read<ServersViewModel>();
                final statusVM = context.read<StatusViewModel>();
                if (statusVM.isServerLoading) return;
                if (serversVM.selectedServer == null) return;
                if (serversVM.selectedServerEnabled == true) {
                  if (width > ResponsiveConstants.medium) {
                    await showDialog(
                      context: context,
                      useRootNavigator: false,
                      builder: (_) => DisableModal(
                        onDisable: (time) => disableServer(time, context),
                        window: true,
                      ),
                    );
                  } else {
                    await showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (_) => DisableModal(
                        onDisable: (time) => disableServer(time, context),
                        window: false,
                      ),
                    );
                  }
                } else {
                  await enableServer(context);
                }
              },
              child: const Icon(Icons.shield_rounded),
            ),
          ),
        ],
      ),
    );
  }
}

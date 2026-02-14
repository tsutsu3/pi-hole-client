import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content_list.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/add_adlist_modal.dart' hide ListType;
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_tile.dart';
import 'package:provider/provider.dart';

class AdlistsList extends StatefulWidget {
  const AdlistsList({
    required this.type,
    required this.scrollController,
    required this.onAdlistSelected,
    required this.selectedAdlist,
    super.key,
  });

  final String type;
  final ScrollController scrollController;
  final void Function(Adlist) onAdlistSelected;
  final Adlist? selectedAdlist;

  @override
  State<AdlistsList> createState() => _AdlistsListState();
}

class _AdlistsListState extends State<AdlistsList> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = true;
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else {
      if (widget.scrollController.position.userScrollDirection ==
          ScrollDirection.forward) {
        if (mounted && isVisible == false) {
          setState(() => isVisible = true);
        }
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final viewModel = Provider.of<AdlistsViewModel>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final groups = context.watch<GroupsProvider>().groupItems;

    final adlistsList = widget.type == 'blacklist'
        ? viewModel.filteredBlacklistAdlists
        : viewModel.filteredWhitelistAdlists;

    Future<void> removeAdlist(Adlist adlist) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      try {
        await viewModel.deleteAdlist.runAsync(adlist);

        if (!context.mounted) return;
        process.close();

        await Navigator.maybePop(context);

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistRemoved,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistDeleteError,
        );
      }
    }

    Future<void> onAddAdlist(Map<String, dynamic> value) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.adlistAdding);

      try {
        final type =
            value['type'] == 'allow' ? ListType.allow : ListType.block;
        await viewModel.addAdlist.runAsync((
          address: value['address'] as String,
          type: type,
          groups: (value['groups'] as List<dynamic>?)?.cast<int>(),
          comment: value['comment'] as String?,
          enabled: value['enabled'] as bool?,
        ));

        if (!context.mounted) return;
        process.close();

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistAdded,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistAddFailed,
        );
      }
    }

    void openModalAddAdlistToList() {
      final mediaQuery = MediaQuery.of(context);
      final isSmallLandscape =
          mediaQuery.size.width > mediaQuery.size.height &&
          mediaQuery.size.height < ResponsiveConstants.medium;

      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
          useSafeArea: !isSmallLandscape,
          useRootNavigator:
              false, // Prevents unexpected app exit on mobile when pressing back
          builder: (ctx) => AddAdlistModal(
            selectedlist: widget.type,
            onAddAdlist: onAddAdlist,
            window: true,
            groups: groups,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => AddAdlistModal(
            selectedlist: widget.type,
            onAddAdlist: onAddAdlist,
            window: false,
            groups: groups,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    return Stack(
      children: [
        CustomTabContentList(
          loadingGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.loadingList,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          itemsCount: adlistsList.length,
          contentWidget: (index) {
            final thisAdlist = adlistsList[index];
            return Padding(
              padding:
                  index == 0 &&
                      MediaQuery.of(context).size.width >
                          ResponsiveConstants.large
                  ? const EdgeInsets.only(top: 16)
                  : EdgeInsets.zero,
              child: AdlistTile(
                adlist: thisAdlist,
                isAdlistSelected:
                    widget.selectedAdlist == thisAdlist,
                showAdlistDetails: (d) {
                  widget.onAdlistSelected(d);
                  if (MediaQuery.of(context).size.width <=
                      ResponsiveConstants.large) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => AdlistDetailsScreen(
                          adlist: d,
                          remove: removeAdlist,
                          colors: serversProvider.colors,
                          groups: groups,
                        ),
                      ),
                    );
                  }
                },
                colors: serversProvider.colors,
              ),
            );
          },
          noData: Container(
            height: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.adlistsNone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          errorGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 50, color: Colors.red),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.adlistsNotLoaded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          loadStatus: viewModel.loadingStatus,
          onRefresh: () async => viewModel.loadAdlists.run(),
          bottomSpaceHeight: 80,
        ),
        SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                bottom: isVisible
                    ? appConfigProvider.showingSnackbar
                          ? 70
                          : 20
                    : -70,
                right: 20,
                child: FloatingActionButton(
                  onPressed: openModalAddAdlistToList,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

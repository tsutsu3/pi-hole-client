import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content_list.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/widgets/add_domain_modal.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_tile.dart';
import 'package:provider/provider.dart';

class DomainsList extends StatefulWidget {
  const DomainsList({
    required this.type,
    required this.scrollController,
    required this.onDomainSelected,
    required this.selectedDomain,
    super.key,
  });

  final String type;
  final ScrollController scrollController;
  final void Function(Domain) onDomainSelected;
  final Domain? selectedDomain;

  @override
  State<DomainsList> createState() => _DomainsListState();
}

class _DomainsListState extends State<DomainsList> {
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
    final viewModel = Provider.of<DomainsViewModel>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final groups = context.watch<GroupsProvider>().groupItems;

    final domainsList = widget.type == 'blacklist'
        ? viewModel.filteredBlacklistDomains
        : viewModel.filteredWhitelistDomains;

    Future<void> removeDomain(Domain domain) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      try {
        await viewModel.deleteDomain.runAsync(domain);
        if (!context.mounted) return;
        process.close();

        unawaited(Navigator.maybePop(context));

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainRemoved,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.errorRemovingDomain,
        );
      }
    }

    Future<void> onAddDomain(
      DomainType type,
      DomainKind kind,
      String domain,
    ) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.domainAdding);

      try {
        await viewModel.addDomain.runAsync(
          (type: type, kind: kind, domain: domain),
        );
        if (!context.mounted) return;
        process.close();

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainAdded,
        );
      } catch (_) {
        if (!context.mounted) return;
        process.close();

        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainAddFailed,
        );
      }
    }

    void openModalAddDomainToList() {
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
          builder: (ctx) => AddDomainModal(
            selectedlist: widget.type,
            addDomain: onAddDomain,
            window: true,
          ),
        );
      } else {
        showModalBottomSheet(
          context: context,
          builder: (ctx) => AddDomainModal(
            selectedlist: widget.type,
            addDomain: onAddDomain,
            window: false,
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
                  AppLocalizations.of(context)!.domainsLoading,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          itemsCount: domainsList.length,
          contentWidget: (index) {
            final thisDomain = domainsList[index];
            return Padding(
              padding:
                  index == 0 &&
                      MediaQuery.of(context).size.width >
                          ResponsiveConstants.large
                  ? const EdgeInsets.only(top: 16)
                  : EdgeInsets.zero,
              child: DomainTile(
                domain: thisDomain,
                isDomainSelected: widget.selectedDomain == thisDomain,
                showDomainDetails: (d) {
                  widget.onDomainSelected(d);
                  if (MediaQuery.of(context).size.width <=
                      ResponsiveConstants.large) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DomainDetailsScreen(
                          domain: d,
                          remove: removeDomain,
                          groups: groups,
                          colors: serversProvider.colors,
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
                AppLocalizations.of(context)!.domainsNone,
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
                  AppLocalizations.of(context)!.domainsNotLoaded,
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
          onRefresh: () async => viewModel.loadDomains.runAsync(),
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
                  onPressed: openModalAddDomainToList,
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

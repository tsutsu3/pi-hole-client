// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/domains/add_domain_modal.dart';
import 'package:pi_hole_client/screens/domains/domain_details_screen.dart';
import 'package:pi_hole_client/screens/domains/domain_tile.dart';
import 'package:pi_hole_client/widgets/tab_content_list.dart';
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
    final domainsListProvider = Provider.of<DomainsListProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;

    final domainsList = widget.type == 'blacklist'
        ? domainsListProvider.filteredBlacklistDomains
        : domainsListProvider.filteredWhitelistDomains;

    Future<void> removeDomain(Domain domain) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.removeDomainFromList(domain);

      process.close();

      if (result?.result == APiResponseType.success) {
        domainsListProvider.removeDomainFromList(domain);
        await Navigator.maybePop(context);
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainRemoved,
        );
      } else if (result?.result == APiResponseType.error &&
          result!.message != null &&
          result.message == 'not_exists') {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainNotExists,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.errorRemovingDomain,
        );
      }
    }

    Future<void> onAddDomain(Map<String, dynamic> value) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.addingDomain);

      final result = await apiGateway?.addDomainToList(value);

      process.close();

      if (result?.result == APiResponseType.success) {
        await domainsListProvider
            .fetchDomainsList(serversProvider.selectedServer!);
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainAdded,
        );
      } else if (result?.result == APiResponseType.alreadyAdded) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainAlreadyAdded,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.cannotAddDomain,
        );
      }
    }

    void openModalAddDomainToList() {
      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        showDialog(
          context: context,
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
          itemsCount: domainsList.length,
          contentWidget: (index) {
            final thisDomain = domainsList[index];
            return Padding(
              padding: index == 0 &&
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
                AppLocalizations.of(context)!.noDomains,
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
                const Icon(
                  Icons.error,
                  size: 50,
                  color: Colors.red,
                ),
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
          loadStatus: domainsListProvider.loadingStatus,
          onRefresh: () async => domainsListProvider
              .fetchDomainsList(serversProvider.selectedServer!),
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

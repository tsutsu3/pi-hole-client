import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/models.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/results_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/search_form.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/viewmodel/find_domains_in_lists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class FindDomainsInListsScreen extends StatefulWidget {
  const FindDomainsInListsScreen({this.showAppBar = true, super.key});

  final bool showAppBar;

  @override
  State<FindDomainsInListsScreen> createState() =>
      _FindDomainsInListsScreenState();
}

class _FindDomainsInListsScreenState extends State<FindDomainsInListsScreen> {
  final TextEditingController _searchController = TextEditingController();
  final TextEditingController _maxResultsController = TextEditingController(
    text: '20',
  );
  bool _partialMatch = true;
  Domain? _pendingDomainUpdate;
  Adlist? _pendingAdlistUpdate;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (!mounted) return;
      await context.read<GroupsViewModel>().loadGroups.runAsync();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    _maxResultsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FindDomainsInListsViewModel>();
    final serversProvider = context.watch<ServersProvider>();
    final appConfigProvider = context.read<AppConfigProvider>();
    final groups = context.watch<GroupsViewModel>().groupItems;
    final colors = serversProvider.colors;
    final apiVersion = serversProvider.selectedServer?.apiVersion;

    if (apiVersion == null) {
      if (widget.showAppBar) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.findDomainsInLists),
          ),
          body: const SafeArea(child: EmptyDataScreen()),
        );
      }
      return const SafeArea(child: EmptyDataScreen());
    }

    if (apiVersion == 'v5') {
      if (widget.showAppBar) {
        return Scaffold(
          appBar: AppBar(
            title: Text(AppLocalizations.of(context)!.findDomainsInLists),
          ),
          body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
        );
      }
      return const SafeArea(child: PiHoleV5NotSupportedScreen());
    }

    final content = SafeArea(
      child: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          SearchForm(
            searchController: _searchController,
            maxResultsController: _maxResultsController,
            partialMatch: _partialMatch,
            isLoading: viewModel.isSearching,
            onPartialChanged: (value) => setState(() => _partialMatch = value),
            onSearchSubmitted: () => _performSearch(
              viewModel: viewModel,
              appConfigProvider: appConfigProvider,
            ),
            onSearchPressed: () => _performSearch(
              viewModel: viewModel,
              appConfigProvider: appConfigProvider,
            ),
          ),
          const SizedBox(height: 24),
          if (viewModel.isSearching)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            )
          else
            ResultsSection(
              errorMessage: viewModel.errorMessage,
              hasSearched: viewModel.hasSearched,
              meta: viewModel.searchResult?.meta,
              domainResults: viewModel.domainResults,
              adlistResults: _groupGravityByAdlist(viewModel.gravityMatches),
              colors: colors,
              onDomainTap: (domain) => _openDomainDetails(
                domain: domain,
                groups: groups,
                colors: colors,
                viewModel: viewModel,
                appConfigProvider: appConfigProvider,
              ),
              onAdlistTap: (adlist) => _openAdlistDetails(
                adlist: adlist,
                groups: groups,
                colors: colors,
                viewModel: viewModel,
                appConfigProvider: appConfigProvider,
              ),
            ),
        ],
      ),
    );

    if (!widget.showAppBar) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.findDomainsInLists),
      ),
      body: content,
    );
  }

  List<AdlistSearchGroup> _groupGravityByAdlist(List<GravityMatch> matches) {
    final grouped = <int, List<GravityMatch>>{};
    for (final match in matches) {
      grouped.putIfAbsent(match.adlist.id, () => []).add(match);
    }

    return grouped.entries.map((item) {
      final first = item.value.first;
      final domains = item.value.map((e) => e.matchedDomain).toList();
      return AdlistSearchGroup(adlist: first.adlist, matchingDomains: domains);
    }).toList();
  }

  Future<void> _performSearch({
    required FindDomainsInListsViewModel viewModel,
    required AppConfigProvider appConfigProvider,
  }) async {
    final query = _searchController.text.trim();
    final limitText = _maxResultsController.text.trim();
    final limit = int.tryParse(limitText);

    if (query.isEmpty) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.searchTermRequired,
      );
      return;
    }

    if (limit == null || limit <= 0) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.invalidMaxResults,
      );
      return;
    }

    try {
      await viewModel.searchLists.runAsync((
        domain: query.toLowerCase(),
        partial: _partialMatch,
        limit: limit,
      ));
    } catch (_) {
      if (!mounted) return;
      viewModel.setSearchError(AppLocalizations.of(context)!.dataFetchFailed);
    }
  }

  Future<void> _openDomainDetails({
    required Domain domain,
    required Map<int, String> groups,
    required AppColors colors,
    required FindDomainsInListsViewModel viewModel,
    required AppConfigProvider appConfigProvider,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DomainDetailsScreen(
          domain: domain,
          groups: groups,
          colors: colors,
          onUpdated: (updated) {
            _pendingDomainUpdate = updated;
          },
          remove: (selected) => _removeDomain(
            selected,
            viewModel: viewModel,
            appConfigProvider: appConfigProvider,
          ),
        ),
      ),
    );
    if (!mounted) return;
    final pending = _pendingDomainUpdate;
    if (pending != null) {
      viewModel.updateDomainInResults(pending);
      _pendingDomainUpdate = null;
    }
  }

  Future<void> _openAdlistDetails({
    required Adlist adlist,
    required Map<int, String> groups,
    required AppColors colors,
    required FindDomainsInListsViewModel viewModel,
    required AppConfigProvider appConfigProvider,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdlistDetailsScreen(
          adlist: adlist,
          groups: groups,
          colors: colors,
          onUpdated: (updated) {
            _pendingAdlistUpdate = updated;
          },
          remove: (selected) => _removeAdlist(
            selected,
            viewModel: viewModel,
            appConfigProvider: appConfigProvider,
          ),
        ),
      ),
    );
    if (!mounted) return;
    final pending = _pendingAdlistUpdate;
    if (pending != null) {
      viewModel.updateAdlistInResults(pending);
      _pendingAdlistUpdate = null;
    }
  }

  Future<void> _removeDomain(
    Domain domain, {
    required FindDomainsInListsViewModel viewModel,
    required AppConfigProvider appConfigProvider,
  }) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    try {
      await viewModel.deleteDomain.runAsync(domain);

      if (!mounted) return;
      process.close();

      await Navigator.maybePop(context);
      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.domainRemoved,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.errorRemovingDomain,
      );
    }
  }

  Future<void> _removeAdlist(
    Adlist adlist, {
    required FindDomainsInListsViewModel viewModel,
    required AppConfigProvider appConfigProvider,
  }) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    try {
      await viewModel.deleteAdlist.runAsync(adlist);

      if (!mounted) return;
      process.close();

      await Navigator.maybePop(context);
      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistRemoved,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();

      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistDeleteError,
      );
    }
  }
}

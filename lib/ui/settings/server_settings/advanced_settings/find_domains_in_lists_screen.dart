import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/data/model/v6/lists/search.dart' as v6_search;
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/search.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/models.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/results_section.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists_screen/search_form.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/adlists/adlist_details_screen.dart';
import 'package:pi_hole_client/utils/punycode.dart';
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
  bool _isLoading = false;
  bool _hasSearched = false;
  String? _errorMessage;
  SearchInfo? _searchInfo;
  List<Domain> _domainResults = [];
  List<v6_search.GravityEntry> _gravityResults = [];
  Domain? _pendingDomainUpdate;
  Adlist? _pendingAdlistUpdate;

  @override
  void initState() {
    super.initState();
    Future.microtask(() async {
      if (!mounted) return;
      await context.read<GroupsProvider>().loadGroups();
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
    final apiGateway = context.select<ServersProvider, ApiGateway?>(
      (provider) => provider.selectedApiGateway,
    );
    final appConfigProvider = context.read<AppConfigProvider>();
    final groups = context.watch<GroupsProvider>().groupItems;
    final providerColors = context.select<ServersProvider, AppColors?>(
      (provider) => provider.colors,
    );
    final colors = providerColors ?? Theme.of(context).extension<AppColors>();

    if (apiGateway == null) {
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

    if (apiGateway.server.apiVersion == 'v5') {
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
            isLoading: _isLoading,
            onPartialChanged: (value) => setState(() => _partialMatch = value),
            onSearchSubmitted: () => _performSearch(
              apiGateway: apiGateway,
              appConfigProvider: appConfigProvider,
            ),
            onSearchPressed: () => _performSearch(
              apiGateway: apiGateway,
              appConfigProvider: appConfigProvider,
            ),
          ),
          const SizedBox(height: 24),
          if (_isLoading)
            const Center(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: CircularProgressIndicator(),
              ),
            )
          else
            ResultsSection(
              errorMessage: _errorMessage,
              hasSearched: _hasSearched,
              searchInfo: _searchInfo,
              domainResults: _domainResults,
              adlistResults: _groupGravityByAddress(_gravityResults),
              colors: colors,
              onDomainTap: (domain) => _openDomainDetails(
                domain: domain,
                groups: groups,
                colors: colors,
                apiGateway: apiGateway,
                appConfigProvider: appConfigProvider,
              ),
              onAdlistTap: (adlist) => _openAdlistDetails(
                adlist: adlist,
                groups: groups,
                colors: colors,
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

  List<AdlistSearchResult> _groupGravityByAddress(
    List<v6_search.GravityEntry> entries,
  ) {
    final grouped = <String, List<v6_search.GravityEntry>>{};
    for (final entry in entries) {
      grouped.putIfAbsent(entry.address, () => []).add(entry);
    }

    return grouped.entries.map((item) {
      final first = item.value.first;
      final matches = item.value.map((e) => e.domain).toList();
      return AdlistSearchResult(entry: first, matchingDomains: matches);
    }).toList();
  }

  Future<void> _performSearch({
    required ApiGateway apiGateway,
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

    setState(() {
      _isLoading = true;
      _errorMessage = null;
      _hasSearched = true;
    });

    final result = await apiGateway.searchSubscriptions(
      domain: query.toLowerCase(),
      partial: _partialMatch,
      limit: limit,
    );

    if (!mounted) return;

    if (result.result == APiResponseType.success) {
      final info = result.data!;
      setState(() {
        _searchInfo = info;
        _domainResults = info.domains
            .map(_mapDomainEntry)
            .toList(growable: false);
        _gravityResults = info.gravity;
      });
    } else {
      setState(() {
        _searchInfo = null;
        _domainResults = [];
        _gravityResults = [];
        _errorMessage = AppLocalizations.of(context)!.dataFetchFailed;
      });
    }

    setState(() {
      _isLoading = false;
    });
  }

  Domain _mapDomainEntry(v6_search.DomainEntry entry) {
    return Domain(
      id: entry.id,
      type: entry.type == v6_search.DomainType.allow
          ? DomainType.allow
          : DomainType.deny,
      kind: entry.kind == v6_search.DomainKind.exact
          ? DomainKind.exact
          : DomainKind.regex,
      name: decodePunycode(entry.domain),
      punyCode: entry.domain,
      enabled: entry.enabled,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(entry.dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(
        entry.dateModified * 1000,
      ),
      comment: entry.comment,
      groups: entry.groups,
    );
  }

  Future<void> _openDomainDetails({
    required Domain domain,
    required Map<int, String> groups,
    required AppColors? colors,
    required ApiGateway apiGateway,
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
            apiGateway: apiGateway,
            appConfigProvider: appConfigProvider,
          ),
        ),
      ),
    );
    if (!mounted) return;
    final pending = _pendingDomainUpdate;
    if (pending != null) {
      setState(() {
        _domainResults = _domainResults
            .map((item) => item.id == pending.id ? pending : item)
            .toList();
        _pendingDomainUpdate = null;
      });
    }
  }

  Future<void> _openAdlistDetails({
    required Adlist adlist,
    required Map<int, String> groups,
    required AppColors? colors,
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
            appConfigProvider: appConfigProvider,
          ),
        ),
      ),
    );
    if (!mounted) return;
    final pending = _pendingAdlistUpdate;
    if (pending != null) {
      final dateModified = pending.dateModified.millisecondsSinceEpoch ~/ 1000;
      final dateUpdated = pending.dateUpdated.millisecondsSinceEpoch ~/ 1000;
      final pendingAddress = pending.address.trim().toLowerCase();
      setState(() {
        _gravityResults = _gravityResults
            .map(
              (item) =>
                  item.id == pending.id ||
                      item.address.trim().toLowerCase() == pendingAddress
                  ? item.copyWith(
                      enabled: pending.enabled,
                      comment: pending.comment,
                      groups: pending.groups,
                      dateModified: dateModified,
                      dateUpdated: dateUpdated,
                      status: pending.status.index,
                    )
                  : item,
            )
            .toList();
        _pendingAdlistUpdate = null;
      });
    }
  }

  Future<void> _removeDomain(
    Domain domain, {
    required ApiGateway apiGateway,
    required AppConfigProvider appConfigProvider,
  }) async {
    final bundle = context.read<RepositoryBundle?>();
    if (bundle == null) return;

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    final result = await bundle.domain.deleteDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
    );

    process.close();
    if (!mounted) return;

    await result.fold(
      (_) async {
        await Navigator.maybePop(context);
        if (!mounted) return;
        setState(() {
          _domainResults = _domainResults
              .where((item) => item.id != domain.id)
              .toList();
        });
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainRemoved,
        );
      },
      (_) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.errorRemovingDomain,
        );
      },
    );
  }

  Future<void> _removeAdlist(
    Adlist adlist, {
    required AppConfigProvider appConfigProvider,
  }) async {
    final bundle = context.read<RepositoryBundle?>();
    if (bundle == null) return;

    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    final result = await bundle.adlist.deleteAdlist(
      adlist.address,
      adlist.type,
    );

    process.close();
    if (!mounted) return;

    await result.fold(
      (_) async {
        await Navigator.maybePop(context);
        if (!mounted) return;
        setState(() {
          _gravityResults = _gravityResults
              .where((item) => item.id != adlist.id)
              .toList();
        });
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistRemoved,
        );
      },
      (_) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistDeleteError,
        );
      },
    );
  }
}

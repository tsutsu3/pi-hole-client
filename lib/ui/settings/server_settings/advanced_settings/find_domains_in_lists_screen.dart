import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/config/enums.dart' show ListsStatus;
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/data/model/v6/lists/search.dart' as v6_search;
import 'package:pi_hole_client/domain/models_old/domain.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/search.dart';
import 'package:pi_hole_client/domain/models_old/subscriptions.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_details_screen.dart';
import 'package:pi_hole_client/ui/domains/widgets/domain_tile.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/subscriptions/subscription_details_screen.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:provider/provider.dart';

class FindDomainsInListsScreen extends StatefulWidget {
  const FindDomainsInListsScreen({super.key});

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
  Subscription? _pendingSubscriptionUpdate;

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
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.findDomainsInLists),
        ),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    if (apiGateway.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.findDomainsInLists),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.findDomainsInLists),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.search),
            const SizedBox(height: 8),
            TextField(
              controller: _searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.findDomainsSearchLabel,
                prefixIcon: const Icon(Icons.search_rounded),
                border: const OutlineInputBorder(),
              ),
              onSubmitted: (_) => _performSearch(
                apiGateway: apiGateway,
                appConfigProvider: appConfigProvider,
              ),
            ),
            const SizedBox(height: 24),
            TextField(
              controller: _maxResultsController,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                labelText: AppLocalizations.of(
                  context,
                )!.maxResultsToReturnLabel,
                prefixIcon: const Icon(Icons.format_list_numbered_rounded),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            SwitchListTile(
              value: _partialMatch,
              title: Text(AppLocalizations.of(context)!.usePartialMatching),
              onChanged: (value) => setState(() => _partialMatch = value),
            ),
            const SizedBox(height: 12),
            FilledButton.icon(
              onPressed: _isLoading
                  ? null
                  : () => _performSearch(
                      apiGateway: apiGateway,
                      appConfigProvider: appConfigProvider,
                    ),
              icon: const Icon(Icons.search_rounded),
              label: Text(AppLocalizations.of(context)!.search),
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
              _buildResultsSection(
                context: context,
                colors: colors,
                groups: groups,
                apiGateway: apiGateway,
                appConfigProvider: appConfigProvider,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildResultsSection({
    required BuildContext context,
    required AppColors? colors,
    required Map<int, String> groups,
    required ApiGateway apiGateway,
    required AppConfigProvider appConfigProvider,
  }) {
    if (_errorMessage != null) {
      return Text(
        _errorMessage!,
        style: TextStyle(color: Theme.of(context).colorScheme.error),
      );
    }

    if (!_hasSearched) {
      return const SizedBox.shrink();
    }

    if (_searchInfo == null ||
        (_domainResults.isEmpty && _gravityResults.isEmpty)) {
      return Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Text(AppLocalizations.of(context)!.noResultsFound),
        ),
      );
    }

    final groupedAdlists = _groupGravityByAddress(_gravityResults);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSummaryCard(context),
        const SizedBox(height: 16),
        if (_domainResults.isNotEmpty) ...[
          SectionLabel(label: AppLocalizations.of(context)!.domainLevelLists),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _domainResults.length,
            separatorBuilder: (_, _) => const SizedBox(height: 6),
            itemBuilder: (context, index) {
              final domain = _domainResults[index];
              if (colors == null) {
                return CustomListTile(
                  leadingIcon: Icons.domain_rounded,
                  label: domain.domain,
                  description: getDomainType(domain.type),
                  onTap: () => _openDomainDetails(
                    domain: domain,
                    groups: groups,
                    colors: colors,
                    apiGateway: apiGateway,
                    appConfigProvider: appConfigProvider,
                  ),
                );
              }
              return DomainTile(
                domain: domain,
                colors: colors,
                showDomainDetails: (selected) => _openDomainDetails(
                  domain: selected,
                  groups: groups,
                  colors: colors,
                  apiGateway: apiGateway,
                  appConfigProvider: appConfigProvider,
                ),
              );
            },
          ),
          const SizedBox(height: 16),
        ],
        if (groupedAdlists.isNotEmpty) ...[
          SectionLabel(label: AppLocalizations.of(context)!.listLevelLists),
          const SizedBox(height: 8),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: groupedAdlists.length,
            separatorBuilder: (_, _) => const SizedBox(height: 12),
            itemBuilder: (context, index) {
              final entry = groupedAdlists[index];
              return _buildAdlistResultCard(
                context: context,
                entry: entry,
                groups: groups,
                colors: colors,
                apiGateway: apiGateway,
                appConfigProvider: appConfigProvider,
              );
            },
          ),
        ],
      ],
    );
  }

  List<_AdlistSearchResult> _groupGravityByAddress(
    List<v6_search.GravityEntry> entries,
  ) {
    final grouped = <String, List<v6_search.GravityEntry>>{};
    for (final entry in entries) {
      grouped.putIfAbsent(entry.address, () => []).add(entry);
    }

    return grouped.entries.map((item) {
      final first = item.value.first;
      final matches = item.value.map((e) => e.domain).toList();
      return _AdlistSearchResult(entry: first, matchingDomains: matches);
    }).toList();
  }

  Widget _buildAdlistResultCard({
    required BuildContext context,
    required _AdlistSearchResult entry,
    required Map<int, String> groups,
    required AppColors? colors,
    required ApiGateway apiGateway,
    required AppConfigProvider appConfigProvider,
  }) {
    final subscription = _mapGravityEntry(entry.entry);
    final listType = entry.entry.type == v6_search.GravityType.allow
        ? AppLocalizations.of(context)!.allowList
        : AppLocalizations.of(context)!.blockList;
    final enabledLabel = subscription.enabled
        ? AppLocalizations.of(context)!.enabled
        : AppLocalizations.of(context)!.disabled;
    final appColors = Theme.of(context).extension<AppColors>()!;
    final listBadgeColor = entry.entry.type == v6_search.GravityType.allow
        ? appColors.commonGreen
        : appColors.commonRed;
    final enabledBadgeColor = subscription.enabled
        ? Theme.of(context).colorScheme.primary
        : appColors.queryGrey;
    final listBadgeBackground = listBadgeColor?.withAlpha(38);
    final enabledBadgeBackground = subscription.enabled
        ? Theme.of(context).colorScheme.primaryContainer
        : appColors.queryGrey?.withAlpha(38);
    final groupCount = subscription.groups.length;
    final groupLabel = groupCount == 1
        ? AppLocalizations.of(context)!.groupSettings
        : AppLocalizations.of(context)!.groups;
    final comment = (subscription.comment ?? '').trim();

    return Card(
      child: InkWell(
        onTap: () => _openSubscriptionDetails(
          subscription: subscription,
          groups: groups,
          colors: colors,
          apiGateway: apiGateway,
          appConfigProvider: appConfigProvider,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                subscription.address,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  _buildTag(
                    context,
                    listType,
                    icon: Icons.shield_rounded,
                    backgroundColor: listBadgeBackground,
                    foregroundColor: listBadgeColor,
                  ),
                  const SizedBox(width: 8),
                  _buildTag(
                    context,
                    enabledLabel,
                    icon: subscription.enabled
                        ? Icons.check_circle_outline_rounded
                        : Icons.remove_circle_outline_rounded,
                    backgroundColor: enabledBadgeBackground,
                    foregroundColor: enabledBadgeColor,
                  ),
                  const SizedBox(width: 8),
                  _buildTag(
                    context,
                    '$groupCount $groupLabel',
                    icon: Icons.group_rounded,
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Icon(Icons.event_repeat_rounded, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      '${_formatTimestamp(subscription.dateUpdated)} (${subscription.number} ${AppLocalizations.of(context)!.domains.toLowerCase()})',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  const Icon(Icons.comment_rounded, size: 16),
                  const SizedBox(width: 6),
                  Expanded(
                    child: Text(
                      comment.isNotEmpty
                          ? comment
                          : AppLocalizations.of(context)!.noComment,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 6),
              ExpansionTile(
                key: PageStorageKey<String>(subscription.address),
                title: Text(AppLocalizations.of(context)!.matchingEntries),
                tilePadding: EdgeInsets.zero,
                childrenPadding: const EdgeInsets.only(left: 8, right: 8),
                children: [
                  _buildMatchingList(
                    context,
                    entry.matchingDomains,
                    storageKey: PageStorageKey<String>(
                      'matching-${subscription.id}',
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(
    BuildContext context,
    String label, {
    IconData? icon,
    Color? backgroundColor,
    Color? foregroundColor,
  }) {
    final bgColor =
        backgroundColor ?? Theme.of(context).colorScheme.primaryContainer;
    final fgColor = foregroundColor ?? Theme.of(context).colorScheme.primary;
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) Icon(icon, size: 14, color: fgColor),
          if (icon != null) const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: fgColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMatchingList(
    BuildContext context,
    List<String> matches, {
    PageStorageKey<String>? storageKey,
  }) {
    const itemHeight = 24.0;
    final visibleItems = min(10, matches.length);
    return SizedBox(
      height: itemHeight * visibleItems,
      child: ListView.builder(
        key: storageKey,
        primary: false,
        itemCount: matches.length,
        itemExtent: itemHeight,
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final domain = matches[index];
          return Row(
            children: [
              const Icon(Icons.circle, size: 6),
              const SizedBox(width: 8),
              Expanded(child: Text(domain)),
            ],
          );
        },
      ),
    );
  }

  String _formatTimestamp(DateTime dateTime) {
    final y = dateTime.year.toString().padLeft(4, '0');
    final m = dateTime.month.toString().padLeft(2, '0');
    final d = dateTime.day.toString().padLeft(2, '0');
    final h = dateTime.hour.toString().padLeft(2, '0');
    final min = dateTime.minute.toString().padLeft(2, '0');
    final s = dateTime.second.toString().padLeft(2, '0');
    return '$y-$m-$d $h:$min:$s';
  }

  Widget _buildSummaryCard(BuildContext context) {
    final results = _searchInfo?.results;
    if (results == null) {
      return const SizedBox.shrink();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(label: AppLocalizations.of(context)!.summary),
        const SizedBox(height: 8),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.summarize_rounded),
          title: Text(AppLocalizations.of(context)!.total),
          subtitle: Text(results.total.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.rule_rounded),
          title: Text(AppLocalizations.of(context)!.domainsExactMatches),
          subtitle: Text(results.domainsExact.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.code_rounded),
          title: Text(AppLocalizations.of(context)!.domainsRegexMatches),
          subtitle: Text(results.domainsRegex.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.check_circle_outline_rounded),
          title: Text(AppLocalizations.of(context)!.gravityAllowMatches),
          subtitle: Text(results.gravityAllow.toString()),
        ),
        ListTile(
          visualDensity: VisualDensity.compact,
          leading: const Icon(Icons.block_rounded),
          title: Text(AppLocalizations.of(context)!.gravityBlockMatches),
          subtitle: Text(results.gravityBlock.toString()),
        ),
      ],
    );
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
    final typeLabel =
        '${entry.type == v6_search.DomainType.allow ? 'allow' : 'deny'}_${entry.kind == v6_search.DomainKind.exact ? 'exact' : 'regex'}';
    final typeMap = {
      'allow_exact': 0,
      'deny_exact': 1,
      'allow_regex': 2,
      'deny_regex': 3,
    };

    return Domain(
      id: entry.id,
      type: typeMap[typeLabel] ?? 0,
      domain: entry.domain,
      enabled: entry.enabled ? 1 : 0,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(entry.dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(
        entry.dateModified * 1000,
      ),
      comment: entry.comment,
      groups: entry.groups,
    );
  }

  Subscription _mapGravityEntry(v6_search.GravityEntry entry) {
    return Subscription(
      address: entry.address,
      type: entry.type.name,
      comment: entry.comment,
      groups: entry.groups,
      enabled: entry.enabled,
      id: entry.id,
      dateAdded: DateTime.fromMillisecondsSinceEpoch(entry.dateAdded * 1000),
      dateModified: DateTime.fromMillisecondsSinceEpoch(
        entry.dateModified * 1000,
      ),
      dateUpdated: DateTime.fromMillisecondsSinceEpoch(
        entry.dateUpdated * 1000,
      ),
      number: entry.number,
      invalidDomains: entry.invalidDomains,
      abpEntries: entry.abpEntries,
      status: _mapListStatus(entry.status),
    );
  }

  ListsStatus _mapListStatus(int status) {
    if (status >= 0 && status < ListsStatus.values.length) {
      return ListsStatus.values[status];
    }
    return ListsStatus.unknown;
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

  Future<void> _openSubscriptionDetails({
    required Subscription subscription,
    required Map<int, String> groups,
    required AppColors? colors,
    required ApiGateway apiGateway,
    required AppConfigProvider appConfigProvider,
  }) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SubscriptionDetailsScreen(
          subscription: subscription,
          groups: groups,
          colors: colors,
          onUpdated: (updated) {
            _pendingSubscriptionUpdate = updated;
          },
          remove: (selected) => _removeSubscription(
            selected,
            apiGateway: apiGateway,
            appConfigProvider: appConfigProvider,
          ),
        ),
      ),
    );
    if (!mounted) return;
    final pending = _pendingSubscriptionUpdate;
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
        _pendingSubscriptionUpdate = null;
      });
    }
  }

  Future<void> _removeDomain(
    Domain domain, {
    required ApiGateway apiGateway,
    required AppConfigProvider appConfigProvider,
  }) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    final result = await apiGateway.removeDomainFromList(domain);

    process.close();
    if (!mounted) return;

    if (result.result == APiResponseType.success) {
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
    } else if (result.result == APiResponseType.error &&
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

  Future<void> _removeSubscription(
    Subscription subscription, {
    required ApiGateway apiGateway,
    required AppConfigProvider appConfigProvider,
  }) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    final result = await apiGateway.removeSubscription(
      url: subscription.address,
      stype: subscription.type,
    );

    process.close();
    if (!mounted) return;

    if (result.result == APiResponseType.success) {
      await Navigator.maybePop(context);
      if (!mounted) return;
      setState(() {
        _gravityResults = _gravityResults
            .where((item) => item.id != subscription.id)
            .toList();
      });
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistRemoved,
      );
    } else if (result.result == APiResponseType.error &&
        result.message == 'not_exists') {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistNotExists,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.adlistDeleteError,
      );
    }
  }
}

class _AdlistSearchResult {
  _AdlistSearchResult({required this.entry, required this.matchingDomains});

  final v6_search.GravityEntry entry;
  final List<String> matchingDomains;
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/subscriptions.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/subscriptions_list_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/subscriptions/subscription_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/subscriptions/subscriptions_list.dart';
import 'package:provider/provider.dart';

class FilteredSubscriptionLists extends StatefulWidget {
  const FilteredSubscriptionLists({
    required this.groupId,
    required this.groupName,
    this.initialTab = 0,
    super.key,
  });

  final int groupId;
  final String groupName;
  final int initialTab;

  @override
  State<FilteredSubscriptionLists> createState() =>
      _FilteredSubscriptionListsState();
}

class _FilteredSubscriptionListsState extends State<FilteredSubscriptionLists>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();
  late SubscriptionsListProvider _subscriptionsListProvider;

  Subscription? selectedSubscription;

  @override
  void initState() {
    super.initState();

    tabController = TabController(
      length: 2,
      vsync: this,
      initialIndex: widget.initialTab,
    );

    _subscriptionsListProvider = context.read<SubscriptionsListProvider>();

    Future.microtask(() async {
      if (!mounted) return;

      _subscriptionsListProvider.setLoadingStatus(LoadStatus.loading);
      _subscriptionsListProvider.setGroupFilter(widget.groupId);
      _subscriptionsListProvider.setSelectedTab(widget.initialTab);

      await _subscriptionsListProvider.fetchSubscriptionsList();

      if (!mounted) return;
      final groupsProvider = context.read<GroupsProvider>();
      await groupsProvider.loadGroups();

      if (!mounted) return;
      final gravityUpdateProvider = context.read<GravityUpdateProvider>();
      await gravityUpdateProvider.load();
    });
  }

  @override
  void dispose() {
    _subscriptionsListProvider.clearGroupFilter();
    tabController.dispose();
    scrollController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final subscriptionsListProvider =
        Provider.of<SubscriptionsListProvider>(context);
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;
    final groups = context.watch<GroupsProvider>().groupItems;

    Future<void> removeSubscription(Subscription subscription) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.removeSubscription(
        url: subscription.address,
        stype: subscription.type,
      );

      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        subscriptionsListProvider.removeSubscriptionFromList(subscription);
        await Navigator.maybePop(context);

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.adlistRemoved,
        );
      } else if (result?.result == APiResponseType.notFound) {
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

    Tab buildIconTab(IconData icon, String label) {
      return Tab(
        child: Row(
          children: [Icon(icon), const SizedBox(width: 4), Text(label)],
        ),
      );
    }

    Widget scaffold({void Function(Subscription)? onTap}) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: subscriptionsListProvider.searchMode
                ? TextFormField(
                    initialValue: subscriptionsListProvider.searchTerm,
                    onChanged: subscriptionsListProvider.onSearch,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.adlistsSearch,
                      hintStyle: const TextStyle(fontWeight: FontWeight.w400),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : Text(AppLocalizations.of(context)!.adlists),
            actions: [
              if (!subscriptionsListProvider.searchMode)
                IconButton(
                  onPressed: () =>
                      subscriptionsListProvider.setSearchMode(true),
                  icon: const Icon(Icons.search_rounded),
                ),
              if (subscriptionsListProvider.searchMode)
                IconButton(
                  onPressed: () => setState(() {
                    subscriptionsListProvider.setSearchMode(false);
                    searchController.text = '';
                    subscriptionsListProvider.onSearch('');
                  }),
                  icon: const Icon(Icons.close_rounded),
                ),
              const SizedBox(width: 10),
            ],
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(96),
              child: Column(
                children: [
                  Container(
                    width: double.maxFinite,
                    height: 50,
                    padding: const EdgeInsets.only(bottom: 10),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 16),
                        Chip(
                          label: Text(
                            '${AppLocalizations.of(context)!.groups}: ${widget.groupName}',
                          ),
                          deleteIcon: const Icon(Icons.close, size: 18),
                          onDeleted: () {
                            Navigator.pop(context);
                          },
                        ),
                        const SizedBox(width: 16),
                      ],
                    ),
                  ),
                  TabBar(
                    tabAlignment: TabAlignment.start,
                    isScrollable: true,
                    controller: tabController,
                    onTap: subscriptionsListProvider.setSelectedTab,
                    tabs: [
                      buildIconTab(
                        Icons.check_circle_rounded,
                        AppLocalizations.of(context)!.allowList,
                      ),
                      buildIconTab(
                        Icons.block_rounded,
                        AppLocalizations.of(context)!.blockList,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            controller: tabController,
            children: [
              SubscriptionsList(
                type: 'whitelist',
                scrollController: scrollController,
                onSubscriptionSelected: (d) {
                  if (onTap != null) {
                    onTap(d);
                  } else {
                    setState(() => selectedSubscription = d);
                  }
                },
                selectedSubscription: selectedSubscription,
              ),
              SubscriptionsList(
                type: 'blacklist',
                scrollController: scrollController,
                onSubscriptionSelected: (d) {
                  if (onTap != null) {
                    onTap(d);
                  } else {
                    setState(() => selectedSubscription = d);
                  }
                },
                selectedSubscription: selectedSubscription,
              ),
            ],
          ),
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      return Row(
        children: [
          Expanded(child: scaffold()),
          Expanded(
            child: selectedSubscription != null
                ? SubscriptionDetailsScreen(
                    subscription: selectedSubscription!,
                    remove: (subscription) {
                      setState(() => selectedSubscription = null);
                      removeSubscription(subscription);
                    },
                    groups: groups,
                    colors: serversProvider.colors,
                  )
                : ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SafeArea(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.adlistsSelectLeftColumn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    } else if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return scaffold(
        onTap: (subscription) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SubscriptionDetailsScreen(
                subscription: subscription,
                remove: (s) {
                  setState(() => selectedSubscription = null);
                  removeSubscription(s);
                },
                groups: groups,
                colors: serversProvider.colors,
              ),
            ),
          );
        },
      );
    } else {
      return scaffold();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/groups_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/subscriptions_list_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/subscription_details_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/widgets/subscriptions/subscriptions_list.dart';
import 'package:provider/provider.dart';

class SubscriptionLists extends StatelessWidget {
  const SubscriptionLists({super.key});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final subscriptionsListProvider =
        Provider.of<SubscriptionsListProvider>(context, listen: false);

    final selectedServer = serversProvider.selectedServer;

    if (selectedServer == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.adlistManagementTitle),
        ),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    final apiGateway = serversProvider.selectedApiGateway;

    if (apiGateway?.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.adlistManagementTitle),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return SubscriptionListsWidget(
      server: selectedServer,
      subscriptionsListProvider: subscriptionsListProvider,
    );
  }
}

class SubscriptionListsWidget extends StatefulWidget {
  const SubscriptionListsWidget({
    required this.server,
    required this.subscriptionsListProvider,
    super.key,
  });

  final Server server;
  final SubscriptionsListProvider subscriptionsListProvider;

  @override
  State<SubscriptionListsWidget> createState() =>
      _SubscriptionListsWidgetState();
}

class _SubscriptionListsWidgetState extends State<SubscriptionListsWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();

  Subscription? selectedSubscription;

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (!mounted) return;

      final groupsProvider = context.read<GroupsProvider>();
      groupsProvider.update(context.read<ServersProvider>());
      await groupsProvider.loadGroups();

      await widget.subscriptionsListProvider.fetchSubscriptionsList();
    });

    widget.subscriptionsListProvider.setSelectedTab(0);
    tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
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
          label: AppLocalizations.of(context)!.errorRemovingAdlist,
        );
      }
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
                      hintText: AppLocalizations.of(context)!.searchAdlists,
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                      ),
                      border: InputBorder.none,
                      prefixIcon: Icon(
                        Icons.search_rounded,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  )
                : Text(AppLocalizations.of(context)!.adlistManagementTitle),
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
            bottom: TabBar(
              controller: tabController,
              onTap: subscriptionsListProvider.setSelectedTab,
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.check_circle_rounded),
                      const Flexible(child: SizedBox(width: 16)),
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!.allowList,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.block),
                      const Flexible(child: SizedBox(width: 16)),
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!.blockList,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
          Expanded(
            child: scaffold(),
          ),
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
                          AppLocalizations.of(context)!.selectAdlistsLeftColumn,
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

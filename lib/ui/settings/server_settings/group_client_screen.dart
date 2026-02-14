import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/groups.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/common/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/groups_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/subscriptions_list_provider.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/client_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/clients_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/group_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/groups_list.dart';
import 'package:provider/provider.dart';

class GroupClientScreen extends StatelessWidget {
  const GroupClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final clientsListProvider = Provider.of<ClientsListProvider>(
      context,
      listen: false,
    );

    final selectedServer = serversProvider.selectedServer;

    if (selectedServer == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.groupsAndClients),
        ),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    final apiGateway = serversProvider.selectedApiGateway;

    if (apiGateway?.server.apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.groupsAndClients),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return GroupClientScreenWidget(
      server: selectedServer,
      clientsListProvider: clientsListProvider,
    );
  }
}

class GroupClientScreenWidget extends StatefulWidget {
  const GroupClientScreenWidget({
    required this.server,
    required this.clientsListProvider,
    super.key,
  });

  final Server server;
  final ClientsListProvider clientsListProvider;

  @override
  State<GroupClientScreenWidget> createState() =>
      _GroupClientScreenWidgetState();
}

class _GroupClientScreenWidgetState extends State<GroupClientScreenWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();
  final TextEditingController searchController = TextEditingController();

  Group? selectedGroup;
  ClientItem? selectedClient;

  int selectedTab = 0;
  bool searchMode = false;
  String searchTerm = '';

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      widget.clientsListProvider.setLoadingStatus(LoadStatus.loading);

      if (!mounted) return;
      final groupsProvider = context.read<GroupsProvider>();
      final localDnsProvider = context.read<LocalDnsProvider>();
      final domainsViewModel = context.read<DomainsViewModel>();
      final subscriptionsListProvider =
          context.read<SubscriptionsListProvider>();

      await Future.wait([
        widget.clientsListProvider.fetchClients(),
        groupsProvider.loadGroups(),
        localDnsProvider.load(),
        domainsViewModel.loadDomains.runAsync(),
        subscriptionsListProvider.fetchSubscriptionsList(),
      ]);
    });

    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (!mounted) return;
      if (selectedTab != tabController.index) {
        setState(() => selectedTab = tabController.index);
      }
    });
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
    final clientsListProvider = Provider.of<ClientsListProvider>(context);
    final serversProvider = Provider.of<ServersProvider>(context);
    final localDnsProvider = Provider.of<LocalDnsProvider>(context);
    final groups = context.watch<GroupsProvider>().groupItems;
    final ipToMac = localDnsProvider.ipToMac;
    final ipToHostname = localDnsProvider.ipToHostname;
    final macToIp = localDnsProvider.macToIp;
    clientsListProvider.updateMacLookup(ipToMac);
    clientsListProvider.updateGroupLookup(groups);

    Widget buildSearchTitle() {
      return TextFormField(
        controller: searchController,
        onChanged: (value) {
          setState(() => searchTerm = value);
          clientsListProvider.onSearch(value);
        },
        decoration: InputDecoration(
          hintText: AppLocalizations.of(context)!.groupClientSearch,
          hintStyle: const TextStyle(fontWeight: FontWeight.w400),
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Theme.of(context).colorScheme.onSurfaceVariant,
          ),
        ),
      );
    }

    Widget scaffold({
      void Function(Group)? onGroupTap,
      void Function(ClientItem)? onClientTap,
    }) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            title: searchMode
                ? buildSearchTitle()
                : Text(AppLocalizations.of(context)!.groupsAndClients),
            actions: [
              if (!searchMode)
                IconButton(
                  onPressed: () => setState(() => searchMode = true),
                  icon: const Icon(Icons.search_rounded),
                ),
              if (searchMode)
                IconButton(
                  onPressed: () => setState(() {
                    searchMode = false;
                    searchController.text = '';
                    searchTerm = '';
                    clientsListProvider.onSearch('');
                  }),
                  icon: const Icon(Icons.close_rounded),
                ),
              const SizedBox(width: 10),
            ],
            bottom: TabBar(
              controller: tabController,
              onTap: (index) {
                setState(() => selectedTab = index);
              },
              tabs: [
                Tab(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.group_rounded),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!.groups,
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
                      const Icon(Icons.devices_rounded),
                      const SizedBox(width: 4),
                      Flexible(
                        child: Text(
                          AppLocalizations.of(context)!.clients,
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
              GroupsList(
                scrollController: scrollController,
                searchTerm: searchTerm,
                onGroupSelected: (group) {
                  if (onGroupTap != null) {
                    onGroupTap(group);
                  } else {
                    setState(() {
                      selectedGroup = group;
                      selectedClient = null;
                    });
                  }
                },
                selectedGroup: selectedGroup,
              ),
              ClientsList(
                scrollController: scrollController,
                onClientSelected: (client) {
                  if (onClientTap != null) {
                    onClientTap(client);
                  } else {
                    setState(() {
                      selectedClient = client;
                      selectedGroup = null;
                    });
                  }
                },
                selectedClient: selectedClient,
                groups: groups,
              ),
            ],
          ),
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.xxLarge) {
      // 3 columns layout for xxLarge screens
      return Row(
        children: [
          Expanded(child: scaffold()),
          Expanded(
            child: selectedTab == 0
                ? selectedGroup != null
                      ? GroupDetailsScreen(
                          group: selectedGroup!,
                          remove: (group) => setState(() {
                            selectedGroup = null;
                          }),
                        )
                      : ColoredBox(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          child: SafeArea(
                            child: Center(
                              child: Text(
                                AppLocalizations.of(
                                  context,
                                )!.groupsSelectLeftColumn,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none,
                                  color: Theme.of(
                                    context,
                                  ).colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        )
                : selectedClient != null
                ? ClientDetailsScreen(
                    client: selectedClient!,
                    remove: (client) => setState(() {
                      selectedClient = null;
                    }),
                    groups: groups,
                    colors: serversProvider.colors,
                    ipToMac: ipToMac,
                    ipToHostname: ipToHostname,
                    macToIp: macToIp,
                  )
                : ColoredBox(
                    color: Theme.of(context).scaffoldBackgroundColor,
                    child: SafeArea(
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.clientsSelectLeftColumn,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            color: Theme.of(
                              context,
                            ).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    } else if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      // 2 columns layout for large and xLarge screens
      return scaffold(
        onGroupTap: (group) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupDetailsScreen(
                group: group,
                remove: (g) {
                  setState(() => selectedGroup = null);
                },
              ),
            ),
          );
        },
        onClientTap: (client) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientDetailsScreen(
                client: client,
                remove: (c) {
                  setState(() => selectedClient = null);
                },
                groups: groups,
                colors: serversProvider.colors,
                ipToMac: ipToMac,
                ipToHostname: ipToHostname,
                macToIp: macToIp,
              ),
            ),
          );
        },
      );
    } else {
      return scaffold(
        onGroupTap: (group) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GroupDetailsScreen(
                group: group,
                remove: (g) {
                  setState(() => selectedGroup = null);
                },
              ),
            ),
          );
        },
        onClientTap: (client) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ClientDetailsScreen(
                client: client,
                remove: (c) {
                  setState(() => selectedClient = null);
                },
                groups: groups,
                colors: serversProvider.colors,
                ipToMac: ipToMac,
                ipToHostname: ipToHostname,
                macToIp: macToIp,
              ),
            ),
          );
        },
      );
    }
  }
}

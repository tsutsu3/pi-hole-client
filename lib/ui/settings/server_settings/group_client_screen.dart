import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/responsive.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_viewmodel.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/client_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/clients_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/group_details_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/groups_list.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

class GroupClientScreen extends StatelessWidget {
  const GroupClientScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final serversViewModel = Provider.of<ServersViewModel>(context);
    final apiVersion = serversViewModel.selectedServer?.apiVersion;

    if (serversViewModel.selectedServer == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.groupsAndClients),
        ),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    if (apiVersion == 'v5') {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.groupsAndClients),
        ),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return const GroupClientScreenWidget();
  }
}

class GroupClientScreenWidget extends StatefulWidget {
  const GroupClientScreenWidget({super.key});

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
  ManagedClient? selectedClient;

  int selectedTab = 0;
  bool searchMode = false;
  String searchTerm = '';

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      if (!mounted) return;
      final clientsViewModel = context.read<ClientsViewModel>();
      final groupsViewModel = context.read<GroupsViewModel>();
      final localDnsProvider = context.read<LocalDnsViewModel>();
      final domainsViewModel = context.read<DomainsViewModel>();
      final adlistsViewModel = context.read<AdlistsViewModel>();

      await Future.wait([
        clientsViewModel.loadClients.runAsync(),
        groupsViewModel.loadGroups.runAsync(),
        localDnsProvider.load(),
        domainsViewModel.loadDomains.runAsync(),
        adlistsViewModel.loadAdlists.runAsync(),
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
    final clientsViewModel = Provider.of<ClientsViewModel>(context);
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);
    final localDnsProvider = Provider.of<LocalDnsViewModel>(context);
    final groups = context.watch<GroupsViewModel>().groupItems;
    final ipToMac = localDnsProvider.ipToMac;
    final ipToHostname = localDnsProvider.ipToHostname;
    final macToIp = localDnsProvider.macToIp;
    clientsViewModel.updateMacLookup(ipToMac);
    clientsViewModel.updateGroupLookup(groups);

    Widget buildSearchTitle() {
      return TextFormField(
        controller: searchController,
        onChanged: (value) {
          setState(() => searchTerm = value);
          clientsViewModel.onSearch(value);
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
      void Function(ManagedClient)? onClientTap,
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
                    clientsViewModel.onSearch('');
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
                    colors: appConfigViewModel.colors,
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
        onGroupTap: (group) => _pushGroupDetails(context, group),
        onClientTap: (client) => _pushClientDetails(
          context,
          client: client,
          groups: groups,
          colors: appConfigViewModel.colors,
          ipToMac: ipToMac,
          ipToHostname: ipToHostname,
          macToIp: macToIp,
        ),
      );
    } else {
      return scaffold(
        onGroupTap: (group) => _pushGroupDetails(context, group),
        onClientTap: (client) => _pushClientDetails(
          context,
          client: client,
          groups: groups,
          colors: appConfigViewModel.colors,
          ipToMac: ipToMac,
          ipToHostname: ipToHostname,
          macToIp: macToIp,
        ),
      );
    }
  }

  void _pushGroupDetails(BuildContext context, Group group) {
    final groupsVM = context.read<GroupsViewModel>();
    final clientsVM = context.read<ClientsViewModel>();
    final domainsVM = context.read<DomainsViewModel>();
    final adlistsVM = context.read<AdlistsViewModel>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => MultiProvider(
          providers: [
            ChangeNotifierProvider.value(value: groupsVM),
            ChangeNotifierProvider.value(value: clientsVM),
            ChangeNotifierProvider.value(value: domainsVM),
            ChangeNotifierProvider.value(value: adlistsVM),
          ],
          child: GroupDetailsScreen(
            group: group,
            remove: (g) => setState(() => selectedGroup = null),
          ),
        ),
      ),
    );
  }

  void _pushClientDetails(
    BuildContext context, {
    required ManagedClient client,
    required Map<int, String> groups,
    required AppColors? colors,
    required Map<String, String> ipToMac,
    required Map<String, String> ipToHostname,
    required Map<String, String> macToIp,
  }) {
    final clientsVM = context.read<ClientsViewModel>();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => ChangeNotifierProvider.value(
          value: clientsVM,
          child: ClientDetailsScreen(
            client: client,
            remove: (c) => setState(() => selectedClient = null),
            groups: groups,
            colors: colors,
            ipToMac: ipToMac,
            ipToHostname: ipToHostname,
            macToIp: macToIp,
          ),
        ),
      ),
    );
  }
}

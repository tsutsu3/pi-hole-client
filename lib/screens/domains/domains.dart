// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/responsive.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/screens/domains/domains_list.dart';
import 'package:pi_hole_client/screens/domains/domain_details_screen.dart';

import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';

class DomainLists extends StatelessWidget {
  const DomainLists({super.key});

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final domainsListProvider =
        Provider.of<DomainsListProvider>(context, listen: false);

    return DomainListsWidget(
      server: serversProvider.selectedServer!,
      domainsListProvider: domainsListProvider,
    );
  }
}

class DomainListsWidget extends StatefulWidget {
  const DomainListsWidget({
    super.key,
    required this.server,
    required this.domainsListProvider,
  });

  final Server server;
  final DomainsListProvider domainsListProvider;

  @override
  State<DomainListsWidget> createState() => _DomainListsWidgetState();
}

class _DomainListsWidgetState extends State<DomainListsWidget>
    with TickerProviderStateMixin {
  late TabController tabController;
  final ScrollController scrollController = ScrollController();

  final TextEditingController searchController = TextEditingController();

  Domain? selectedDomain;

  @override
  void initState() {
    widget.domainsListProvider.fetchDomainsList(widget.server);
    widget.domainsListProvider.setSelectedTab(0);
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    final domainsListProvider = Provider.of<DomainsListProvider>(context);
    final serversProvider = Provider.of<ServersProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;

    void removeDomain(Domain domain) async {
      final ProcessModal process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.removeDomainFromList(domain);

      process.close();

      if (result?.result == APiResponseType.success) {
        domainsListProvider.removeDomainFromList(domain);

        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.domainRemoved,
        );
      } else if (result!.result == APiResponseType.error &&
          result.message != null &&
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

    Widget scaffold() {
      return DefaultTabController(
        length: 2,
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: ((context, innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title: domainsListProvider.searchMode
                      ? TextFormField(
                          initialValue: domainsListProvider.searchTerm,
                          onChanged: domainsListProvider.onSearch,
                          maxLines: 1,
                          decoration: InputDecoration(
                            hintText:
                                AppLocalizations.of(context)!.searchDomains,
                            hintStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                            ),
                            border: InputBorder.none,
                            prefixIcon: Icon(
                              Icons.search_rounded,
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurfaceVariant,
                            ),
                          ),
                        )
                      : Text(AppLocalizations.of(context)!.domains),
                  pinned: true,
                  floating: true,
                  forceElevated: innerBoxIsScrolled,
                  actions: [
                    if (domainsListProvider.searchMode == false)
                      IconButton(
                        onPressed: () =>
                            domainsListProvider.setSearchMode(true),
                        icon: const Icon(Icons.search),
                      ),
                    if (domainsListProvider.searchMode == true)
                      IconButton(
                        onPressed: () => setState(() {
                          domainsListProvider.setSearchMode(false);
                          searchController.text = '';
                          domainsListProvider.onSearch('');
                        }),
                        icon: const Icon(Icons.close_rounded),
                      ),
                    const SizedBox(width: 10),
                  ],
                  bottom: TabBar(
                    controller: tabController,
                    onTap: (value) => domainsListProvider.setSelectedTab(value),
                    tabs: const [
                      Tab(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.check_circle_rounded),
                            Flexible(child: SizedBox(width: 16)),
                            Flexible(
                              child: Text(
                                'Whitelist',
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
                            Icon(Icons.block),
                            Flexible(child: SizedBox(width: 16)),
                            Flexible(
                              child: Text(
                                'Blacklist',
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          }),
          body: TabBarView(
            controller: tabController,
            children: [
              DomainsList(
                type: 'whitelist',
                scrollController: scrollController,
                onDomainSelected: (d) => setState(() => selectedDomain = d),
                selectedDomain: selectedDomain,
              ),
              DomainsList(
                type: 'blacklist',
                scrollController: scrollController,
                onDomainSelected: (d) => setState(() => selectedDomain = d),
                selectedDomain: selectedDomain,
              ),
            ],
          ),
        ),
      );
    }

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Row(
        children: [
          Expanded(
            flex: MediaQuery.of(context).size.width > ResponsiveConstants.xLarge
                ? 2
                : 3,
            child: scaffold(),
          ),
          Expanded(
            flex: 3,
            child: selectedDomain != null
                ? DomainDetailsScreen(
                    domain: selectedDomain!,
                    remove: (domain) {
                      setState(() => selectedDomain = null);
                      removeDomain(domain);
                    },
                    colors: serversProvider.colors,
                  )
                : SizedBox(
                    child: SafeArea(
                      child: Text(
                        AppLocalizations.of(context)!.selectDomainsLeftColumn,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      );
    } else {
      return scaffold();
    }
  }
}

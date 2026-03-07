import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/ui/core/view_models/local_dns_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_client_screen.dart';
import 'package:provider/provider.dart';

Widget createGroupClientScreen(RepositoryBundle bundle) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) =>
            ClientsViewModel(clientRepository: bundle.client)
              ..loadClients.run(),
      ),
      ChangeNotifierProvider(
        create: (_) =>
            GroupsViewModel(groupRepository: bundle.group)..loadGroups.run(),
      ),
      ChangeNotifierProvider(
        create: (_) =>
            DomainsViewModel(domainRepository: bundle.domain)
              ..loadDomains.run(),
      ),
      ChangeNotifierProvider(
        create: (_) =>
            AdlistsViewModel(adListRepository: bundle.adlist)
              ..loadAdlists.run(),
      ),
      ChangeNotifierProvider(
        create: (_) => LocalDnsViewModel(
          localDnsRepository: bundle.localDns,
          networkRepository: bundle.network,
        ),
      ),
    ],
    child: const GroupClientScreen(),
  );
}

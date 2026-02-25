import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/domains/domains.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

Widget createDomainsScreen(RepositoryBundle bundle) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) =>
            DomainsViewModel(domainRepository: bundle.domain)
              ..loadDomains.run(),
      ),
      ChangeNotifierProvider(
        create: (_) =>
            GroupsViewModel(groupRepository: bundle.group)
              ..loadGroups.run(),
      ),
    ],
    child: const DomainLists(),
  );
}

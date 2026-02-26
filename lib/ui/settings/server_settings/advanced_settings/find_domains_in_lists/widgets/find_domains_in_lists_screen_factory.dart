import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists/widgets/find_domains_in_lists_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/find_domains_in_lists/view_models/find_domains_in_lists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:provider/provider.dart';

Widget createFindDomainsInListsScreen(RepositoryBundle bundle) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) => FindDomainsInListsViewModel(
          adListRepository: bundle.adlist,
          domainRepository: bundle.domain,
        ),
      ),
      ChangeNotifierProvider(
        create: (_) =>
            GroupsViewModel(groupRepository: bundle.group)
              ..loadGroups.run(),
      ),
    ],
    child: const FindDomainsInListsScreen(),
  );
}

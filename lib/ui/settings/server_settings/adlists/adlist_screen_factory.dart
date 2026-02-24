import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/viewmodel/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

Widget createAdlistScreen(RepositoryBundle bundle) {
  return MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (_) =>
            AdlistsViewModel(adListRepository: bundle.adlist)
              ..loadAdlists.run(),
      ),
      ChangeNotifierProvider(
        create: (_) =>
            GroupsViewModel(groupRepository: bundle.group)
              ..loadGroups.run(),
      ),
    ],
    child: const AdlistScreen(),
  );
}

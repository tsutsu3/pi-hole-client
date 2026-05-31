import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/ui/domains/widgets/domains_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:provider/provider.dart';

/// Builds the Domains tab.
///
/// The `DomainsViewModel` is provided app-wide (see `createProviders` in
/// `lib/config/dependencies.dart`) so that its cached list survives bottom-tab
/// switches — returning to the Domains tab shows the previous list immediately
/// instead of a full-screen spinner. Only [GroupsViewModel] is scoped to this
/// route.
Widget createDomainsScreen(RepositoryBundle bundle) {
  return ChangeNotifierProvider(
    create: (_) =>
        GroupsViewModel(groupRepository: bundle.group)..loadGroups.run(),
    child: const DomainsScreen(),
  );
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/domains/domains.dart';
import 'package:pi_hole_client/ui/domains/viewmodel/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/viewmodel/groups_viewmodel.dart';
import 'package:provider/provider.dart';

/// Wrapper widget that provides route-scoped [DomainsViewModel] and
/// [GroupsViewModel] for the Domains bottom-navigation tab.
///
/// When the [RepositoryBundle] changes (e.g. server switch), the inner
/// content is recreated with fresh ViewModels via [ObjectKey].
class DomainsPage extends StatelessWidget {
  const DomainsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bundle = context.watch<RepositoryBundle?>();
    if (bundle == null) return const SizedBox.shrink();

    return _DomainsPageContent(key: ObjectKey(bundle), bundle: bundle);
  }
}

class _DomainsPageContent extends StatelessWidget {
  const _DomainsPageContent({required this.bundle, super.key});

  final RepositoryBundle bundle;

  @override
  Widget build(BuildContext context) {
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
}

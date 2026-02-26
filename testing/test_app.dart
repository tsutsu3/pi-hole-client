import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/globals.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:provider/provider.dart';

import 'fakes/repositories/api/fake_actions_repository.dart';
import 'fakes/repositories/api/fake_adlist_repository.dart';
import 'fakes/repositories/api/fake_auth_repository.dart';
import 'fakes/repositories/api/fake_client_repository.dart';
import 'fakes/repositories/api/fake_config_repository.dart';
import 'fakes/repositories/api/fake_dhcp_repository.dart';
import 'fakes/repositories/api/fake_dns_repository.dart';
import 'fakes/repositories/api/fake_domain_repository.dart';
import 'fakes/repositories/api/fake_ftl_repository.dart';
import 'fakes/repositories/api/fake_group_repository.dart';
import 'fakes/repositories/api/fake_local_dns_repository.dart';
import 'fakes/repositories/api/fake_metrics_repository.dart';
import 'fakes/repositories/api/fake_network_repository.dart';
import 'fakes/repositories/api/fake_realtime_status_repository.dart';
import 'fakes/repositories/local/fake_app_config_repository.dart';

Future<void> initTestApp() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();
  FlutterSecureStorage.setMockInitialValues({});
}

Widget buildTestApp(
  Widget child, {
  AppConfigViewModel? appConfigViewModel,
  ServersViewModel? serversViewModel,
  StatusViewModel? statusViewModel,
  LogsViewModel? logsViewModel,
  DomainsViewModel? domainsViewModel,
  GroupsViewModel? groupsViewModel,
  RepositoryBundle? repositoryBundle,
  CreateRepositoryBundle? createRepositoryBundle,
  SecureStorageService? secureStorageService,
  bool useScaffold = true,
  GoRouter? router,
}) {
  final Widget app;
  if (router != null) {
    app = MaterialApp.router(
      routerConfig: router,
      theme: lightTheme(null),
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  } else {
    app = MaterialApp(
      theme: lightTheme(null),
      home: useScaffold ? Scaffold(body: child) : child,
      locale: const Locale('en'),
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      scaffoldMessengerKey: scaffoldMessengerKey,
    );
  }

  return MultiProvider(
    providers: [
      ChangeNotifierProvider<AppConfigViewModel>.value(
        value: appConfigViewModel ??
            AppConfigViewModel(FakeAppConfigRepository()),
      ),
      if (serversViewModel != null)
        ChangeNotifierProvider<ServersViewModel>.value(
          value: serversViewModel,
        ),
      if (statusViewModel != null)
        ChangeNotifierProvider<StatusViewModel>.value(
          value: statusViewModel,
        ),
      if (logsViewModel != null)
        ChangeNotifierProvider<LogsViewModel>.value(
          value: logsViewModel,
        ),
      if (domainsViewModel != null)
        ChangeNotifierProvider<DomainsViewModel>.value(
          value: domainsViewModel,
        ),
      if (groupsViewModel != null)
        ChangeNotifierProvider<GroupsViewModel>.value(
          value: groupsViewModel,
        ),
      if (repositoryBundle != null)
        Provider<RepositoryBundle?>.value(value: repositoryBundle),
      if (createRepositoryBundle != null)
        Provider<CreateRepositoryBundle>.value(value: createRepositoryBundle),
      if (secureStorageService != null)
        Provider<SecureStorageService>.value(value: secureStorageService),
    ],
    child: app,
  );
}

/// Creates a [RepositoryBundle] backed by fake repositories.
///
/// Individual repositories can be overridden for tests that need to control
/// specific behaviour (e.g. `shouldFail` on [FakeActionsRepository]).
RepositoryBundle createFakeRepositoryBundle({
  FakeActionsRepository? actions,
  FakeAdlistRepository? adlist,
  FakeConfigRepository? config,
  FakeDnsRepository? dns,
  FakeDomainRepository? domain,
  String serverAddress = 'http://localhost:8081',
  String apiVersion = 'v6',
}) {
  return RepositoryBundle(
    actions: actions ?? FakeActionsRepository(),
    adlist: adlist ?? FakeAdlistRepository(),
    auth: FakeAuthRepository(),
    client: FakeClientRepository(),
    config: config ?? FakeConfigRepository(),
    dhcp: FakeDhcpRepository(),
    dns: dns ?? FakeDnsRepository(),
    domain: domain ?? FakeDomainRepository(),
    ftl: FakeFtlRepository(),
    group: FakeGroupRepository(),
    localDns: FakeLocalDnsRepository(),
    metrics: FakeMetricsRepository(),
    network: FakeNetworkRepository(),
    realtimeStatus: FakeRealTimeStatusRepository(),
    serverAddress: serverAddress,
    apiVersion: apiVersion,
  );
}

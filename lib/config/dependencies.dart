import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/data/repositories/api/repository_factory.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/app_config_repository.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/data/services/local/database_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

/// Builds the full Provider tree for the application.
///
/// Layers:
/// 1. Services (DatabaseService, SecureStorageService)
/// 2. Repositories (AppConfigRepository, ServerRepository)
/// 3. ViewModels (AppConfigViewModel, ServersViewModel)
/// 3.5. RepositoryBundle — recreated when the selected server changes
/// 4. Dependent ViewModels (StatusViewModel, LogsViewModel, GravityUpdateViewModel)
List<SingleChildWidget> createProviders({
  required DatabaseService dbService,
  required SecureStorageService secureStorageService,
  required AppConfigRepository appConfigRepository,
  required ServerRepository serverRepository,
  required AppConfigViewModel configProvider,
  required ServersViewModel serversViewModel,
  required StatusViewModel statusViewModel,
  required LogsViewModel logsViewModel,
  required GravityUpdateViewModel gravityUpdateViewModel,
}) {
  return [
    // Layer 1: Services
    Provider<DatabaseService>(create: (_) => dbService),
    Provider<SecureStorageService>(create: (_) => secureStorageService),
    Provider<CreateRepositoryBundle>(
      create: (context) {
        final storage = context.read<SecureStorageService>();
        return ({required Server server}) =>
            RepositoryBundleFactory.create(server: server, storage: storage);
      },
    ),

    // Layer 2: Repositories
    Provider<AppConfigRepository>(create: (_) => appConfigRepository),
    Provider<ServerRepository>(create: (_) => serverRepository),

    // Layer 3: ViewModels
    ChangeNotifierProvider(create: (_) => configProvider),
    ChangeNotifierProxyProvider<AppConfigViewModel, ServersViewModel>(
      create: (_) => serversViewModel,
      update: (_, appConfig, servers) =>
          servers!..update(() => appConfig.setSelectedTab(0)),
    ),

    // Layer 3.5: RepositoryBundle
    //
    // Provides version-specific API repositories (v5/v6)
    // for route-level ViewModel creation via context.read().
    // Recreated only when the selected server changes.
    ProxyProvider2<ServersViewModel, SecureStorageService, RepositoryBundle?>(
      update: (_, servers, storage, previous) {
        final server = servers.selectedServer;
        if (server == null) return null;
        if (previous?.serverAddress == server.address) return previous;
        return RepositoryBundleFactory.create(server: server, storage: storage);
      },
    ),

    // Layer 4: Dependent ViewModels
    ChangeNotifierProxyProvider3<
      RepositoryBundle?,
      ServersViewModel,
      AppConfigViewModel,
      StatusViewModel
    >(
      create: (_) => statusViewModel,
      update: (_, bundle, servers, appConfig, previous) => previous!
        ..update(
          realtimeStatusRepository: bundle?.realtimeStatus,
          metricsRepository: bundle?.metrics,
          dnsRepository: bundle?.dns,
          ftlRepository: bundle?.ftl,
          apiVersion: bundle?.apiVersion,
          selectedServerAddress: servers.selectedServer?.address,
          selectedServerAlias: servers.selectedServer?.alias,
          isConnecting: servers.connectingServer != null,
          onUpdateServerStatus: servers.updateselectedServerStatus,
          autoRefreshTime: appConfig.getAutoRefreshTime,
        ),
    ),
    ChangeNotifierProxyProvider2<
      RepositoryBundle?,
      StatusViewModel,
      LogsViewModel
    >(
      create: (_) => logsViewModel,
      update: (_, bundle, statusVM, previous) => previous!
        ..update(
          metricsRepository: bundle?.metrics,
          domainRepository: bundle?.domain,
          apiVersion: bundle?.apiVersion,
          topClientNames: statusVM.topClientNames,
          onRefreshClients: statusVM.refreshOnce,
        ),
    ),
    ChangeNotifierProxyProvider2<
      RepositoryBundle?,
      ServersViewModel,
      GravityUpdateViewModel
    >(
      create: (_) => gravityUpdateViewModel,
      update: (_, bundle, serversViewModel, previous) => previous!
        ..update(
          actionsRepository: bundle?.actions,
          ftlRepository: bundle?.ftl,
          serverAddress: serversViewModel.selectedServer?.address,
        ),
    ),
  ];
}

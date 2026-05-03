import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/api_versions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/ui/components/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:provider/provider.dart';

/// Minimum API version required by a server-scoped route.
enum RequiredApiVersion {
  /// Works on any supported Pi-hole version.
  any,

  /// Requires Pi-hole v6.
  v6Only,
}

/// Guard wrapper for every `/settings/server/*` and `/domains` route.
///
/// Centralizes three concerns that used to be handled ad-hoc across the
/// router and individual screens:
///
/// 1. **No server selected** — renders a titled empty screen.
/// 2. **v6-only feature on v5 server** — renders a titled
///    [PiHoleV5NotSupportedScreen].
/// 3. **Happy path** — invokes [builder] with the non-null bundle and server,
///    wrapped in a [KeyedSubtree] keyed on server identity so switching
///    servers tears down stale ViewModels instead of leaking state.
class ServerScopedRoute extends StatelessWidget {
  const ServerScopedRoute({
    required this.title,
    required this.builder,
    this.required = RequiredApiVersion.any,
    super.key,
  });

  /// AppBar title used by the fallback scaffolds (unselected / v5-not-supported).
  final String title;

  /// Minimum API version required by the wrapped screen.
  final RequiredApiVersion required;

  /// Builds the actual screen. `bundle` and `server` are guaranteed non-null.
  final Widget Function(RepositoryBundle bundle, Server server) builder;

  @override
  Widget build(BuildContext context) {
    final bundle = context.watch<RepositoryBundle?>();
    final server = context.select<ServersViewModel, Server?>(
      (vm) => vm.selectedServer,
    );

    if (bundle == null || server == null) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: const SafeArea(child: EmptyDataScreen()),
      );
    }

    if (required == RequiredApiVersion.v6Only &&
        server.apiVersion == SupportedApiVersions.v5) {
      return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: const SafeArea(child: PiHoleV5NotSupportedScreen()),
      );
    }

    return KeyedSubtree(key: ObjectKey(server), child: builder(bundle, server));
  }
}

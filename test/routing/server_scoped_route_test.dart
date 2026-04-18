import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/repository_bundle.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/routing/server_scoped_route.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/ui/components/pi_hole_v5_not_supported_screen.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:provider/provider.dart';

import '../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../testing/test_app.dart';

const _v5Server = Server(
  address: 'http://localhost:8081',
  alias: 'v5 server',
  apiVersion: 'v5',
);

const _v6Server = Server(
  address: 'http://localhost:8082',
  alias: 'v6 server',
  apiVersion: 'v6',
);

class _BuilderCounter extends StatelessWidget {
  const _BuilderCounter({required this.label, required this.onBuild});

  final String label;
  final VoidCallback onBuild;

  @override
  Widget build(BuildContext context) {
    onBuild();
    return Text(label);
  }
}

Widget _wrap({
  required Widget child,
  required FakeServersViewModel serversViewModel,
  required RepositoryBundle? bundle,
}) {
  return MaterialApp(
    theme: lightTheme(null),
    locale: const Locale('en'),
    supportedLocales: AppLocalizations.supportedLocales,
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    home: MultiProvider(
      providers: [
        ChangeNotifierProvider<ServersViewModel>.value(value: serversViewModel),
        Provider<RepositoryBundle?>.value(value: bundle),
      ],
      child: child,
    ),
  );
}

void main() async {
  await initTestApp();

  group('ServerScopedRoute', () {
    testWidgets('renders EmptyDataScreen when bundle is null', (tester) async {
      final vm = FakeServersViewModel()..selectedServer = _v6Server;

      await tester.pumpWidget(
        _wrap(
          serversViewModel: vm,
          bundle: null,
          child: ServerScopedRoute(
            title: 'Adlists',
            builder: (_, _) => const Text('SHOULD_NOT_SHOW'),
          ),
        ),
      );

      expect(find.byType(EmptyDataScreen), findsOneWidget);
      expect(find.text('Adlists'), findsOneWidget);
      expect(find.text('SHOULD_NOT_SHOW'), findsNothing);
    });

    testWidgets('renders EmptyDataScreen when selectedServer is null', (
      tester,
    ) async {
      final vm = FakeServersViewModel();
      final bundle = createFakeRepositoryBundle();

      await tester.pumpWidget(
        _wrap(
          serversViewModel: vm,
          bundle: bundle,
          child: ServerScopedRoute(
            title: 'Adlists',
            builder: (_, _) => const Text('SHOULD_NOT_SHOW'),
          ),
        ),
      );

      expect(find.byType(EmptyDataScreen), findsOneWidget);
      expect(find.text('SHOULD_NOT_SHOW'), findsNothing);
    });

    testWidgets(
      'renders PiHoleV5NotSupportedScreen when v6Only and selected server is v5',
      (tester) async {
        final vm = FakeServersViewModel()..selectedServer = _v5Server;
        final bundle = createFakeRepositoryBundle(apiVersion: 'v5');

        await tester.pumpWidget(
          _wrap(
            serversViewModel: vm,
            bundle: bundle,
            child: ServerScopedRoute(
              title: 'Sessions',
              required: RequiredApiVersion.v6Only,
              builder: (_, _) => const Text('SHOULD_NOT_SHOW'),
            ),
          ),
        );

        expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
        expect(find.text('Sessions'), findsOneWidget);
        expect(find.text('SHOULD_NOT_SHOW'), findsNothing);
      },
    );

    testWidgets('invokes builder when v6Only and server is v6', (tester) async {
      final vm = FakeServersViewModel()..selectedServer = _v6Server;
      final bundle = createFakeRepositoryBundle();
      var buildCount = 0;

      await tester.pumpWidget(
        _wrap(
          serversViewModel: vm,
          bundle: bundle,
          child: ServerScopedRoute(
            title: 'Sessions',
            required: RequiredApiVersion.v6Only,
            builder: (_, _) =>
                _BuilderCounter(label: 'OK', onBuild: () => buildCount++),
          ),
        ),
      );

      expect(find.text('OK'), findsOneWidget);
      expect(find.byType(PiHoleV5NotSupportedScreen), findsNothing);
      expect(find.byType(EmptyDataScreen), findsNothing);
      expect(buildCount, 1);
    });

    testWidgets('invokes builder when required is any and server is v5', (
      tester,
    ) async {
      final vm = FakeServersViewModel()..selectedServer = _v5Server;
      final bundle = createFakeRepositoryBundle(apiVersion: 'v5');

      await tester.pumpWidget(
        _wrap(
          serversViewModel: vm,
          bundle: bundle,
          child: ServerScopedRoute(
            title: 'Server Info',
            builder: (_, _) => const Text('INFO_V5'),
          ),
        ),
      );

      expect(find.text('INFO_V5'), findsOneWidget);
      expect(find.byType(PiHoleV5NotSupportedScreen), findsNothing);
    });

    testWidgets('passes non-null bundle and server to builder', (tester) async {
      final vm = FakeServersViewModel()..selectedServer = _v6Server;
      final bundle = createFakeRepositoryBundle();
      RepositoryBundle? capturedBundle;
      Server? capturedServer;

      await tester.pumpWidget(
        _wrap(
          serversViewModel: vm,
          bundle: bundle,
          child: ServerScopedRoute(
            title: 'Adlists',
            builder: (b, s) {
              capturedBundle = b;
              capturedServer = s;
              return const Text('OK');
            },
          ),
        ),
      );

      expect(capturedBundle, same(bundle));
      expect(capturedServer, _v6Server);
    });

    testWidgets('rebuilds subtree when bundle identity changes', (tester) async {
      final vm = FakeServersViewModel()..selectedServer = _v6Server;
      final bundle1 = createFakeRepositoryBundle();
      final bundle2 = createFakeRepositoryBundle();
      var buildCount = 0;

      Widget app(RepositoryBundle bundle) => _wrap(
        serversViewModel: vm,
        bundle: bundle,
        child: ServerScopedRoute(
          title: 'Adlists',
          builder: (_, _) =>
              _BuilderCounter(label: 'OK', onBuild: () => buildCount++),
        ),
      );

      await tester.pumpWidget(app(bundle1));
      expect(buildCount, 1);

      await tester.pumpWidget(app(bundle2));
      // Identity changed → KeyedSubtree creates a new element, builder runs again.
      expect(buildCount, 2);
      expect(find.text('OK'), findsOneWidget);
    });

    testWidgets(
      'switches from PiHoleV5NotSupportedScreen to builder when server changes v5 -> v6',
      (tester) async {
        final vm = FakeServersViewModel()..selectedServer = _v5Server;
        final bundle = createFakeRepositoryBundle();

        await tester.pumpWidget(
          _wrap(
            serversViewModel: vm,
            bundle: bundle,
            child: ServerScopedRoute(
              title: 'Sessions',
              required: RequiredApiVersion.v6Only,
              builder: (_, _) => const Text('SESSIONS_OK'),
            ),
          ),
        );

        expect(find.byType(PiHoleV5NotSupportedScreen), findsOneWidget);
        expect(find.text('SESSIONS_OK'), findsNothing);

        vm.selectedServer = _v6Server;
        await tester.pump();

        expect(find.byType(PiHoleV5NotSupportedScreen), findsNothing);
        expect(find.text('SESSIONS_OK'), findsOneWidget);
      },
    );
  });
}

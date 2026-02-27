import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';

import '../../../testing/fakes/repositories/api/fake_dns_repository.dart';
import '../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../testing/fakes/viewmodels/fake_status_viewmodel.dart';
import '../../../testing/test_app.dart';

const _serverV6 = Server(
  address: 'http://localhost:8081',
  alias: 'test v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowSelfSignedCert: true,
  ignoreCertificateErrors: false,
);

void main() async {
  await initTestApp();

  group('Add Server Full Screen Widget Tests', () {
    late FakeServersViewModel serversViewModel;
    late FakeStatusViewModel statusViewModel;
    late AppConfigViewModel appConfigViewModel;
    late FakeDnsRepository fakeDnsRepository;

    setUp(() {
      final repo = FakeAppConfigRepository()..importantInfoReadenValue = true;
      appConfigViewModel = AppConfigViewModel(repo);
      appConfigViewModel.saveFromDb(repo.appConfig.getOrThrow());

      serversViewModel = FakeServersViewModel()
        ..selectedServer = _serverV6
        ..selectedServerEnabled = true;

      statusViewModel = FakeStatusViewModel();
      fakeDnsRepository = FakeDnsRepository();
    });

    Widget buildWidget(Widget child) {
      final bundle = createFakeRepositoryBundle(dns: fakeDnsRepository);
      return buildTestApp(
        child,
        appConfigViewModel: appConfigViewModel,
        serversViewModel: serversViewModel,
        statusViewModel: statusViewModel,
        repositoryBundle: bundle,
        createRepositoryBundle: ({required server, required storage}) =>
            createFakeRepositoryBundle(
              dns: fakeDnsRepository,
              serverAddress: server.address,
              apiVersion: server.apiVersion,
            ),
        secureStorageService: SecureStorageService(),
      );
    }

    testWidgets('should show the page with window', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(window: true, title: 'test'),
        ),
      );

      expect(find.byType(AddServerFullscreen), findsOneWidget);
      expect(find.byIcon(Icons.login_rounded), findsOneWidget);
      expect(find.text('Token'), findsNothing);
      expect(find.text('Password'), findsOne);
    });

    testWidgets('should show the successful snackbar when adding a server', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(window: false, title: 'test'),
        ),
      );

      expect(find.byType(AddServerFullscreen), findsOneWidget);
      expect(find.byIcon(Icons.login_rounded), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), 'v5'); // Alias
      await tester.tap(find.text('v5').last);
      await tester.pump();
      await tester.enterText(
        find.byType(TextField).at(1),
        'localhost',
      ); // IP Address
      await tester.enterText(find.byType(TextField).at(3), 'test123'); // token

      await tester.tap(find.byIcon(Icons.login_rounded));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(find.text('Connected to server successfully.'), findsOneWidget);
    });

    testWidgets(
      'should show the error snackbar when adding a server (socket exception)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(503);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(window: false, title: 'test'),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.tap(find.text('Advanced Options'));
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(find.byType(TextField).at(1), 'localhost');
        await tester.enterText(find.byType(TextField).at(2), '8080');
        await tester.enterText(find.byType(TextField).at(3), '/test');
        await tester.enterText(find.byType(TextField).at(4), 'test123');

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Check address.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (timeout)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(504);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(window: false, title: 'test'),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.tap(find.text('Advanced Options'));
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(find.byType(TextField).at(1), 'localhost');
        await tester.enterText(find.byType(TextField).at(2), '8080');
        await tester.enterText(find.byType(TextField).at(3), '/test');
        await tester.enterText(find.byType(TextField).at(4), 'test123');

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text(
            'Failed. Connection timeout. Check if server is reachable.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (noConnection)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(500);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(window: false, title: 'test'),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.tap(find.text('Advanced Options'));
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(find.byType(TextField).at(1), 'localhost');
        await tester.enterText(find.byType(TextField).at(2), '8080');
        await tester.enterText(find.byType(TextField).at(3), '/test');
        await tester.enterText(find.byType(TextField).at(4), 'test123');

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("Can't reach the server. Check IP address and port."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (authError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(401);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(window: false, title: 'test'),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.tap(find.text('Advanced Options'));
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(find.byType(TextField).at(1), 'localhost');
        await tester.enterText(find.byType(TextField).at(2), '8080');
        await tester.enterText(find.byType(TextField).at(3), '/test');
        await tester.enterText(find.byType(TextField).at(4), 'test123');

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Password not valid.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (sslError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(495);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(window: false, title: 'test'),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.tap(find.text('Advanced Options'));
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(find.byType(TextField).at(1), 'localhost');
        await tester.enterText(find.byType(TextField).at(2), '8080');
        await tester.enterText(find.byType(TextField).at(3), '/test');
        await tester.enterText(find.byType(TextField).at(4), 'test123');

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("SSL error. Check if the server's certificate is valid."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the error snackbar when adding a server (unknownError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = null; // Generic Exception → unknown error

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(window: false, title: 'test'),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.login_rounded), findsOneWidget);

        await tester.tap(find.text('Advanced Options'));
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(find.byType(TextField).at(1), 'localhost');
        await tester.enterText(find.byType(TextField).at(2), '8080');
        await tester.enterText(find.byType(TextField).at(3), '/test');
        await tester.enterText(find.byType(TextField).at(4), 'test123');

        await tester.tap(find.byIcon(Icons.login_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Unknown error.'), findsOneWidget);
      },
    );

    testWidgets('should show validation error when adding a server', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(window: false, title: 'test'),
        ),
      );

      expect(find.byType(AddServerFullscreen), findsOneWidget);
      expect(find.byIcon(Icons.login_rounded), findsOneWidget);

      await tester.tap(find.text('Advanced Options'));
      await tester.pump();

      await tester.enterText(find.byType(TextField).at(1), '@'); // IP Address
      await tester.enterText(find.byType(TextField).at(2), '@'); // port
      await tester.enterText(find.byType(TextField).at(3), '@'); // subroute

      await tester.pump();
      await tester.pump();
      await tester.pump();

      expect(find.text('Invalid IP or domain'), findsOneWidget);
      expect(
        find.text(
          "Invalid subroute. Remember not to finish with a '/', '.' or ':'.",
        ),
        findsOneWidget,
      );
      expect(find.text('Invalid port'), findsOneWidget);
    });

    // --------------------- edit ----------------------------

    testWidgets('should show the successful snackbar when editing a server', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      expect(find.byType(AddServerFullscreen), findsOneWidget);
      expect(find.byIcon(Icons.save_rounded), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
      await tester.enterText(find.byType(TextField).at(3), 'test123'); // token

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));
      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Server settings updated successfully.'),
        findsOneWidget,
      );
    });

    testWidgets(
      'should show the failed snackbar when editing a server (socketError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(503);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(3),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Check address.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (timeout)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(504);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(3),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text(
            'Failed. Connection timeout. Check if server is reachable.',
          ),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (noConnection)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(500);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(3),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("Can't reach the server. Check IP address and port."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (authError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(401);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(3),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Password not valid.'), findsOneWidget);
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (sslError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(495);

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(3),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(
          find.text("SSL error. Check if the server's certificate is valid."),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'should show the failed snackbar when editing a server (unknownError)',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = null; // Generic Exception → unknown error

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        expect(find.byType(AddServerFullscreen), findsOneWidget);
        expect(find.byIcon(Icons.save_rounded), findsOneWidget);

        await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
        await tester.enterText(
          find.byType(TextField).at(3),
          'test123',
        ); // token

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));
        expect(find.byType(SnackBar), findsOneWidget);
        expect(find.text('Failed. Unknown error.'), findsOneWidget);
      },
    );
  });
}

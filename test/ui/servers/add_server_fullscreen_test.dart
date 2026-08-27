import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../testing/fakes/repositories/api/fake_auth_repository.dart';
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
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

const _serverV6Default = Server(
  address: 'http://localhost:8081',
  alias: 'test v6 default',
  defaultServer: true,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

const _serverV5 = Server(
  address: 'http://localhost:8081',
  alias: 'test v5',
  defaultServer: false,
  apiVersion: 'v5',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

const _serverHttpsPinned = Server(
  address: 'https://pi.hole',
  alias: 'https v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
  pinnedCertificateSha256: 'old:fingerprint',
);

const _serverHttpsIgnore = Server(
  address: 'https://pi.hole',
  alias: 'https v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: true,
);

const _serverHttpsNoPin = Server(
  address: 'https://pi.hole',
  alias: 'https v6',
  defaultServer: false,
  apiVersion: 'v6',
  allowUntrustedCert: true,
  ignoreCertificateErrors: false,
);

/// Builds a certificate inspection for the certificate-flow tests. A trusted
/// inspection auto-pins; an untrusted one drives the pin-confirmation dialog.
CertificateInspection _inspection({
  required bool trusted,
  String sha256 = 'new:fingerprint',
}) {
  return CertificateInspection(
    sha256: sha256,
    subject: 'CN=pi.hole',
    issuer: 'CN=test',
    startValidity: DateTime(2020),
    endValidity: DateTime(2030),
    trustedByPlatform: trusted,
  );
}

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

    // [authByAddress] maps a server address to the auth fake that its bundle
    // should use, so the new-address and old-address bundles can be controlled
    // independently (e.g. fail createSession on the new host, or
    // deleteCurrentSession on the old host). Addresses not listed fall back to
    // a default succeeding auth.
    Widget buildWidget(
      Widget child, {
      Map<String, FakeAuthRepository>? authByAddress,
    }) {
      final bundle = createFakeRepositoryBundle(dns: fakeDnsRepository);
      return buildTestApp(
        child,
        appConfigViewModel: appConfigViewModel,
        serversViewModel: serversViewModel,
        statusViewModel: statusViewModel,
        repositoryBundle: bundle,
        createRepositoryBundle: ({required server}) =>
            createFakeRepositoryBundle(
              dns: fakeDnsRepository,
              auth: authByAddress?[server.address],
              serverAddress: server.address,
              apiVersion: server.apiVersion,
            ),
        secureStorageService: SecureStorageService(),
      );
    }

    // Gives the test surface enough room so the save/login button and the
    // form fields are laid out and tappable.
    void useLargeView(WidgetTester tester) {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;
      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });
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
        buildWidget(const AddServerFullscreen(window: true, title: 'test')),
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
        buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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

    testWidgets('connects a v6 server with no app password (empty password)', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      await tester.pumpWidget(
        buildWidget(const AddServerFullscreen(window: false, title: 'test')),
      );

      expect(find.byIcon(Icons.login_rounded), findsOneWidget);

      await tester.enterText(find.byType(TextField).at(0), 'v6'); // Alias
      await tester.enterText(
        find.byType(TextField).at(1),
        'localhost',
      ); // IP Address
      await tester.pump();

      final loginButton = tester.widget<IconButton>(
        find.ancestor(
          of: find.byIcon(Icons.login_rounded),
          matching: find.byType(IconButton),
        ),
      );
      expect(loginButton.onPressed, isNotNull);

      await tester.tap(find.byIcon(Icons.login_rounded));
      await tester.pump(const Duration(milliseconds: 1000));
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
          buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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
          buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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
          buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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
          buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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
          find.text('Login failed. The app password is incorrect.'),
          findsOneWidget,
        );
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
          buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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
            "SSL error. The server's certificate may be invalid, self-signed, or have an incomplete chain.",
          ),
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
          ..failureException = null; // Generic Exception -> unknown error

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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
        buildWidget(const AddServerFullscreen(window: false, title: 'test')),
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

    testWidgets('connection fields are editable in edit mode', (
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

      // Address and port text fields are no longer locked.
      expect(
        tester.widget<TextField>(find.byType(TextField).at(1)).enabled,
        isNot(false),
      );
      expect(
        tester.widget<TextField>(find.byType(TextField).at(2)).enabled,
        isNot(false),
      );

      // Connection type and API version segments are no longer locked.
      final connectionSegments = tester
          .widget<SegmentedButton<ConnectionType>>(
            find.byType(SegmentedButton<ConnectionType>),
          )
          .segments;
      for (final segment in connectionSegments) {
        expect(segment.enabled, isNot(false));
      }
      final versionSegments = tester
          .widget<SegmentedButton<String>>(find.byType(SegmentedButton<String>))
          .segments;
      for (final segment in versionSegments) {
        expect(segment.enabled, isNot(false));
      }
    });

    testWidgets('editing the address replaces the server', (
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

      // Change the host so the resulting URL (primary key) differs.
      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(find.byType(SnackBar), findsOneWidget);
      expect(
        find.text('Server settings updated successfully.'),
        findsOneWidget,
      );
      expect(serversViewModel.replaceServerCallCount, 1);
      expect(serversViewModel.lastReplacedOldAddress, _serverV6.address);
      expect(
        serversViewModel.lastReplacedNewServer?.address,
        'http://192.168.1.10:8081',
      );
    });

    testWidgets('editing to an existing address shows an error', (
      WidgetTester tester,
    ) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      serversViewModel.urlExistsResult = true;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(find.text('This connection already exists'), findsOneWidget);
      expect(serversViewModel.replaceServerCallCount, 0);
    });

    testWidgets(
      'preserves a multi-segment subroute and an alias-only edit stays in place',
      (WidgetTester tester) async {
        useLargeView(tester);

        const serverMultiSeg = Server(
          address: 'http://localhost:8081/api/v1',
          alias: 'multi',
          defaultServer: false,
          apiVersion: 'v6',
          allowUntrustedCert: true,
          ignoreCertificateErrors: false,
        );

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: serverMultiSeg,
            ),
          ),
        );
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(0), 'renamed');
        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
      },
    );

    testWidgets('uppercase host with an alias-only edit stays in place', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      const serverUpper = Server(
        address: 'http://MyPi',
        alias: 'upper',
        defaultServer: false,
        apiVersion: 'v6',
        allowUntrustedCert: true,
        ignoreCertificateErrors: false,
      );

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: serverUpper,
          ),
        ),
      );
      await tester.pump();

      // Alias-only edit: the host case difference must not trigger replace.
      await tester.enterText(find.byType(TextField).at(0), 'renamed');
      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.editServerCallCount, 1);
      expect(serversViewModel.replaceServerCallCount, 0);
    });

    testWidgets('clearing the password keeps Save enabled for a v6 server', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );
      await tester.pump();

      // password field is the last visible TextField (index 3). A password-less
      // Pi-hole is valid, so clearing it must not disable Save.
      await tester.enterText(find.byType(TextField).at(3), '');
      await tester.pump();

      final saveButton = tester.widget<IconButton>(
        find.ancestor(
          of: find.byIcon(Icons.save_rounded),
          matching: find.byType(IconButton),
        ),
      );
      expect(saveButton.onPressed, isNotNull);
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
        expect(
          find.text('Login failed. The app password is incorrect.'),
          findsOneWidget,
        );
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
          find.text(
            "SSL error. The server's certificate may be invalid, self-signed, or have an incomplete chain.",
          ),
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
          ..failureException = null; // Generic Exception -> unknown error

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

    // Certificate flow tests (R25/R26/R28/R29) — drive the pin/dialog branches
    // via FakeServersViewModel.certificateInspection so they run without a real
    // TLS handshake. R27 (retry without re-prompt) is out of scope until the
    // _certValidatedForAddress memory lands on this branch.

    testWidgets('HTTPS edit without address change reuses the existing pin '
        'and shows no dialog', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      serversViewModel.certificateInspection = _inspection(trusted: true);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverHttpsPinned,
          ),
        ),
      );

      // Change only the alias so the address (primary key) is unchanged.
      await tester.enterText(find.byType(TextField).at(0), 'renamed');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(find.byType(CertificateDetailsDialog), findsNothing);
      expect(serversViewModel.inspectCertificateCallCount, 0);
      expect(serversViewModel.editServerCallCount, 1);
      expect(serversViewModel.replaceServerCallCount, 0);
    });

    testWidgets('HTTPS address change resets the pin, prompts the dialog and '
        'pins the new fingerprint on confirm', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      serversViewModel.certificateInspection = _inspection(
        trusted: false,
        sha256: 'new:fingerprint',
      );

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverHttpsPinned,
          ),
        ),
      );

      // Change the host so the resulting URL (primary key) differs.
      await tester.enterText(find.byType(TextField).at(1), 'pi.hole.new');

      await tester.tap(find.byIcon(Icons.save_rounded));
      // Cannot pumpAndSettle: the in-progress spinner animates indefinitely.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CertificateDetailsDialog), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, 'Confirm'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(
        serversViewModel.lastReplacedOldAddress,
        _serverHttpsPinned.address,
      );
      expect(
        serversViewModel.lastReplacedNewServer?.address,
        'https://pi.hole.new',
      );
      expect(
        serversViewModel.lastReplacedNewServer?.pinnedCertificateSha256,
        'new:fingerprint',
      );
    });

    testWidgets('cancelling the certificate dialog aborts the save and keeps '
        'the old server', (WidgetTester tester) async {
      tester.view.physicalSize = const Size(1080, 2400);
      tester.view.devicePixelRatio = 2.0;

      addTearDown(() {
        tester.view.resetPhysicalSize();
        tester.view.resetDevicePixelRatio();
      });

      serversViewModel.certificateInspection = _inspection(trusted: false);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverHttpsPinned,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), 'pi.hole.new');

      await tester.tap(find.byIcon(Icons.save_rounded));
      // Cannot pumpAndSettle: the in-progress spinner animates indefinitely.
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 500));

      expect(find.byType(CertificateDetailsDialog), findsOneWidget);

      await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
      await tester.pump();
      await tester.pump(const Duration(milliseconds: 1000));

      expect(find.byType(CertificateDetailsDialog), findsNothing);
      expect(serversViewModel.replaceServerCallCount, 0);
      expect(serversViewModel.editServerCallCount, 0);
      expect(find.text('Server settings updated successfully.'), findsNothing);
      // No secret may be persisted for the new address: cancelling the
      // certificate dialog must not leave orphaned credentials behind.
      expect(serversViewModel.savePasswordCallCount, 0);
      expect(serversViewModel.saveTokenCallCount, 0);
    });

    testWidgets(
      'cancelling the certificate dialog on a same-address edit keeps '
      "the existing server's credentials untouched",
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        serversViewModel.certificateInspection = _inspection(trusted: false);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsNoPin,
            ),
          ),
        );

        // Change only the alias so the address (primary key) is unchanged.
        await tester.enterText(find.byType(TextField).at(0), 'renamed');

        await tester.tap(find.byIcon(Icons.save_rounded));
        // Cannot pumpAndSettle: the in-progress spinner animates indefinitely.
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        expect(find.byType(CertificateDetailsDialog), findsOneWidget);

        await tester.tap(find.widgetWithText(TextButton, 'Cancel'));
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 1000));

        expect(find.byType(CertificateDetailsDialog), findsNothing);
        expect(serversViewModel.replaceServerCallCount, 0);
        expect(serversViewModel.editServerCallCount, 0);
        expect(serversViewModel.savePasswordCallCount, 0);
        expect(serversViewModel.saveTokenCallCount, 0);
      },
    );

    testWidgets(
      'R29: ignoreCertificateErrors skips certificate validation, clears the '
      'pin and never calls the fetcher',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        serversViewModel.certificateInspection = _inspection(trusted: true);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsIgnore,
            ),
          ),
        );

        await tester.enterText(find.byType(TextField).at(1), 'pi.hole.new');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(find.byType(CertificateDetailsDialog), findsNothing);
        expect(serversViewModel.inspectCertificateCallCount, 0);
        expect(serversViewModel.replaceServerCallCount, 1);
        expect(
          serversViewModel.lastReplacedNewServer?.pinnedCertificateSha256,
          isNull,
        );
      },
    );

    // Server-edit flow tests.
    testWidgets(
      'address change with a failing connection does not replace and shows an error',
      (WidgetTester tester) async {
        useLargeView(tester);

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(503);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );

        await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(serversViewModel.replaceServerCallCount, 0);
        expect(find.text('Failed. Check address.'), findsOneWidget);
      },
    );

    testWidgets('replaceServer DB failure shows the cant-save error', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      serversViewModel.shouldFailReplaceServer = true;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(find.text("Connection data couldn't be saved"), findsOneWidget);
    });

    testWidgets(
      'address change carries the default flag into the replaced server',
      (WidgetTester tester) async {
        useLargeView(tester);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6Default,
            ),
          ),
        );

        await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(serversViewModel.replaceServerCallCount, 1);
        expect(serversViewModel.lastReplacedNewServer?.defaultServer, isTrue);
      },
    );

    testWidgets('v5 server replaces on address change', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV5,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(serversViewModel.lastReplacedNewServer?.apiVersion, 'v5');
    });

    testWidgets('port-only change rebuilds the URL correctly', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverHttpsIgnore,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(2), '9999');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(
        serversViewModel.lastReplacedNewServer?.address,
        'https://pi.hole:9999',
      );
    });

    testWidgets('subroute-only change rebuilds the URL correctly', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverHttpsIgnore,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(3), '/admin');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(
        serversViewModel.lastReplacedNewServer?.address,
        'https://pi.hole/admin',
      );
    });

    testWidgets('editServer DB failure shows the cant-save error', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      serversViewModel.shouldFailEditServer = true;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      // Same address (only the alias changes) so save() takes the edit path.
      await tester.enterText(find.byType(TextField).at(0), 'renamed');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      // The edit was attempted (not a replace); its DB failure surfaces.
      expect(serversViewModel.editServerCallCount, 1);
      expect(serversViewModel.replaceServerCallCount, 0);
      expect(find.text("Connection data couldn't be saved"), findsOneWidget);
    });

    testWidgets('inconclusive URL uniqueness check aborts the save', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      serversViewModel.checkUrlExistsFails = true;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 0);
      expect(
        find.text('Cannot check if this URL is already saved.'),
        findsOneWidget,
      );
    });

    testWidgets('with no selected server, auto-refresh is not toggled', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      serversViewModel.selectedServer = null;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(statusViewModel.stopAutoRefreshCallCount, 0);
      expect(statusViewModel.startAutoRefreshCallCount, 0);
    });

    testWidgets('createSession failure on the new address aborts the replace', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      final failingAuth = FakeAuthRepository()..shouldFail = true;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
          authByAddress: {'http://192.168.1.10:8081': failingAuth},
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      // Outcome: the replace is aborted and the user sees the failure.
      expect(serversViewModel.replaceServerCallCount, 0);
      expect(find.text('Failed. Unknown error.'), findsOneWidget);
    });

    testWidgets('v5 address change never deletes the old session', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      final oldAuth = FakeAuthRepository();

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV5,
          ),
          authByAddress: {_serverV5.address: oldAuth},
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(oldAuth.deleteCurrentSessionCallCount, 0);
    });

    testWidgets('replace still succeeds when the old session logout fails', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      final oldAuth = FakeAuthRepository()..shouldFail = true;

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
          authByAddress: {_serverV6.address: oldAuth},
        ),
      );

      await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(oldAuth.deleteCurrentSessionCallCount, 1);
      expect(serversViewModel.replaceServerCallCount, 1);
      expect(
        find.text('Server settings updated successfully.'),
        findsOneWidget,
      );
    });

    testWidgets(
      'replace DB failure keeps the old session and cleans up the new one',
      (WidgetTester tester) async {
        useLargeView(tester);

        serversViewModel.shouldFailReplaceServer = true;

        final oldAuth = FakeAuthRepository();
        final newAuth = FakeAuthRepository();

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
            authByAddress: {
              _serverV6.address: oldAuth,
              'http://192.168.1.10:8081': newAuth,
            },
          ),
        );

        await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        // Old session must survive a failed commit.
        expect(oldAuth.deleteCurrentSessionCallCount, 0);
        // New-address session + SID must be reclaimed.
        expect(newAuth.deleteCurrentSessionCallCount, 1);
        expect(serversViewModel.deleteSidCallCount, 1);
      },
    );

    testWidgets(
      'connection failure cleans up the newly created session and SID',
      (WidgetTester tester) async {
        useLargeView(tester);

        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(503);

        final newAuth = FakeAuthRepository();

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
            authByAddress: {'http://192.168.1.10:8081': newAuth},
          ),
        );

        await tester.enterText(find.byType(TextField).at(1), '192.168.1.10');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(newAuth.createSessionCallCount, 1);
        expect(newAuth.deleteCurrentSessionCallCount, 1);
        expect(serversViewModel.deleteSidCallCount, 1);
      },
    );

    Finder apiVersionSegment(String label) => find.descendant(
      of: find.byType(SegmentedButton<String>),
      matching: find.text(label),
    );

    Finder connectionTypeSegment(String label) => find.descendant(
      of: find.byType(SegmentedButton<ConnectionType>),
      matching: find.text(label),
    );

    testWidgets(
      'switching a same-address server from v6 to v5 logs out the old '
      'session and drops its SID',
      (WidgetTester tester) async {
        useLargeView(tester);

        final oldAuth = FakeAuthRepository();

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
            authByAddress: {_serverV6.address: oldAuth},
          ),
        );

        await tester.tap(apiVersionSegment('v5'));
        await tester.pump();

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        // Same address: editServer, not replaceServer.
        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
        // The orphaned v6 session and SID must be cleaned up.
        expect(oldAuth.deleteCurrentSessionCallCount, 1);
        expect(serversViewModel.deleteSidCallCount, 1);
      },
    );

    testWidgets('a same-address v6 edit keeps the session and SID intact', (
      WidgetTester tester,
    ) async {
      useLargeView(tester);

      final oldAuth = FakeAuthRepository();

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
          authByAddress: {_serverV6.address: oldAuth},
        ),
      );

      // Change only the alias; stay on v6 and the same address.
      await tester.enterText(find.byType(TextField).at(0), 'renamed');

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.editServerCallCount, 1);
      expect(serversViewModel.replaceServerCallCount, 0);
      // No teardown: the v6 session is still in use under the same address.
      expect(oldAuth.deleteCurrentSessionCallCount, 0);
      expect(serversViewModel.deleteSidCallCount, 0);
    });

    testWidgets(
      'B3: switching a same-address server from v5 to v6 edits in place',
      (WidgetTester tester) async {
        useLargeView(tester);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV5,
            ),
          ),
        );

        await tester.tap(apiVersionSegment('v6'));
        await tester.pump();

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
        // The old server was v5, so there is no v6 session/SID to reclaim.
        expect(serversViewModel.deleteSidCallCount, 0);
      },
    );

    testWidgets(
      'switching v5 -> v6 -> v5 clears the v5 token so it does not reappear',
      (WidgetTester tester) async {
        useLargeView(tester);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV5,
            ),
          ),
        );
        // Let the stored credentials load into the fields.
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        TextField authField() =>
            tester.widget<TextField>(find.byType(TextField).at(3));

        // v5 loads with its stored token populated.
        expect(authField().controller!.text, 'stored-token');

        // Leaving v5 for v6 clears the v5 token.
        await tester.tap(apiVersionSegment('v6'));
        await tester.pump();

        // Returning to v5 must show an empty token, not the previous value.
        await tester.tap(apiVersionSegment('v5'));
        await tester.pump();
        expect(authField().controller!.text, '');
      },
    );

    testWidgets(
      'switching v6 -> v5 -> v6 clears the v6 password so it does not reappear',
      (WidgetTester tester) async {
        useLargeView(tester);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        TextField authField() =>
            tester.widget<TextField>(find.byType(TextField).at(3));

        // v6 loads with its stored password populated.
        expect(authField().controller!.text, 'stored-pass');

        // Leaving v6 for v5 clears the v6 password.
        await tester.tap(apiVersionSegment('v5'));
        await tester.pump();

        // Returning to v6 must show an empty password, not the previous value.
        await tester.tap(apiVersionSegment('v6'));
        await tester.pump();
        expect(authField().controller!.text, '');
      },
    );

    testWidgets(
      'switching HTTPS to HTTP changes the address, clears the pin and '
      'replaces the server',
      (WidgetTester tester) async {
        useLargeView(tester);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsPinned,
            ),
          ),
        );

        await tester.tap(connectionTypeSegment('HTTP'));
        await tester.pump();

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(serversViewModel.replaceServerCallCount, 1);
        expect(serversViewModel.lastReplacedOldAddress, 'https://pi.hole');
        // Dropping TLS must drop the stale pinned fingerprint.
        expect(
          serversViewModel.lastReplacedNewServer?.address,
          'http://pi.hole',
        );
        expect(
          serversViewModel.lastReplacedNewServer?.pinnedCertificateSha256,
          null,
        );
      },
    );

    testWidgets('switching HTTP to HTTPS changes the address and pins the new '
        'fingerprint', (WidgetTester tester) async {
      useLargeView(tester);

      serversViewModel.certificateInspection = _inspection(trusted: true);

      await tester.pumpWidget(
        buildWidget(
          const AddServerFullscreen(
            window: false,
            title: 'test',
            server: _serverV6,
          ),
        ),
      );

      await tester.tap(connectionTypeSegment('HTTPS'));
      await tester.pump();

      await tester.tap(find.byIcon(Icons.save_rounded));
      await tester.pump(const Duration(milliseconds: 1000));

      expect(serversViewModel.replaceServerCallCount, 1);
      expect(
        serversViewModel.lastReplacedNewServer?.address,
        'https://localhost:8081',
      );
      expect(
        serversViewModel.lastReplacedNewServer?.pinnedCertificateSha256,
        'new:fingerprint',
      );
    });

    testWidgets(
      'same-address v6 password change validates the new password and aborts the save when authentication fails',
      (WidgetTester tester) async {
        useLargeView(tester);

        // The bundle for the (unchanged) address must re-authenticate with the
        // edited password; force that createSession to fail.
        final failingAuth = FakeAuthRepository()..shouldFail = true;

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
            authByAddress: {_serverV6.address: failingAuth},
          ),
        );
        await tester.pump();

        // Change only the password (address stays the same).
        await tester.enterText(find.byType(TextField).at(3), 'new-password');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        // The edited password is validated up-front and the save is aborted.
        expect(failingAuth.createSessionCallCount, 1);
        expect(serversViewModel.editServerCallCount, 0);
        expect(find.text('Failed. Unknown error.'), findsOneWidget);
      },
    );

    testWidgets(
      'same-address v6 password change re-authenticates with the new password',
      (WidgetTester tester) async {
        useLargeView(tester);

        final auth = FakeAuthRepository();

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
            authByAddress: {_serverV6.address: auth},
          ),
        );
        await tester.pump();

        await tester.enterText(find.byType(TextField).at(3), 'new-password');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        // Editing the password forces a session create to validate it, but the
        // edit still commits in place.
        expect(auth.createSessionCallCount, 1);
        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
        expect(
          find.text('Server settings updated successfully.'),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      'a failed credential load does not wipe the stored secret when the save '
      'fails',
      (WidgetTester tester) async {
        useLargeView(tester);

        // Secure-storage read fails on load, so initPassword is an empty
        // placeholder even though a real secret still exists in storage.
        serversViewModel.failFetchCredentials = true;
        fakeDnsRepository
          ..shouldFail = true
          ..failureException = HttpStatusCodeException(503);

        await tester.pumpWidget(
          buildWidget(
            const AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverV6,
            ),
          ),
        );
        // Let the (failing) credential load settle before editing the field so
        // it can't overwrite the value entered below. pumpAndSettle is unusable
        // here because the connecting spinner animates indefinitely.
        await tester.pump();
        await tester.pump(const Duration(milliseconds: 500));

        // Re-enter the (correct) password and save; the connection then fails.
        await tester.enterText(find.byType(TextField).at(3), 'real-pass');
        await tester.pump();

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        // The rollback must not restore the empty placeholder over the secret.
        expect(find.text('Failed. Check address.'), findsOneWidget);
        expect(serversViewModel.lastSavedPassword, 'real-pass');
      },
    );
  });
}

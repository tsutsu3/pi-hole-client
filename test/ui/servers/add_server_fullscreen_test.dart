import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/servers/widgets/add_server_fullscreen.dart';
import 'package:pi_hole_client/ui/servers/widgets/certificate_details_dialog.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

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

TlsCertificateInfo _certInfo({String sha256 = 'new:fingerprint'}) {
  return TlsCertificateInfo(
    sha256: sha256,
    subject: 'CN=pi.hole',
    issuer: 'CN=test',
    startValidity: DateTime(2020),
    endValidity: DateTime(2030),
  );
}

/// A recording [TlsCertificateFetcher] for the certificate-flow tests.
class _FakeFetcher {
  _FakeFetcher({this.onStrict, this.strictError, this.onAllowBad});

  final TlsCertificateInfo? onStrict;
  final Exception? strictError;
  final TlsCertificateInfo? onAllowBad;
  int callCount = 0;

  Future<TlsCertificateInfo?> call(
    Uri uri, {
    required bool allowBadCertificates,
    Duration timeout = const Duration(seconds: 5),
  }) async {
    callCount++;
    if (!allowBadCertificates) {
      if (strictError != null) throw strictError!;
      return onStrict;
    }
    return onAllowBad;
  }
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

    // Certificate flow tests (R25/R26/R28/R29) — exercise the injected
    // TlsCertificateFetcher so the pin/dialog branches run without a real
    // TLS handshake. R27 (retry without re-prompt) is out of scope until the
    // _certValidatedForAddress memory lands on this branch.

    testWidgets(
      'R25: HTTPS edit without address change reuses the existing pin '
      'and shows no dialog',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final fetcher = _FakeFetcher(onStrict: _certInfo());

        await tester.pumpWidget(
          buildWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsPinned,
              fetchTlsCertificate: fetcher.call,
            ),
          ),
        );

        // Change only the alias so the address (primary key) is unchanged.
        await tester.enterText(find.byType(TextField).at(0), 'renamed');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(find.byType(CertificateDetailsDialog), findsNothing);
        expect(fetcher.callCount, 0);
        expect(serversViewModel.editServerCallCount, 1);
        expect(serversViewModel.replaceServerCallCount, 0);
      },
    );

    testWidgets(
      'R26: HTTPS address change resets the pin, prompts the dialog and '
      'pins the new fingerprint on confirm',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final fetcher = _FakeFetcher(
          strictError: const HandshakeException(),
          onAllowBad: _certInfo(sha256: 'new:fingerprint'),
        );

        await tester.pumpWidget(
          buildWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsPinned,
              fetchTlsCertificate: fetcher.call,
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
      },
    );

    testWidgets(
      'R28: cancelling the certificate dialog aborts the save and keeps '
      'the old server',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1080, 2400);
        tester.view.devicePixelRatio = 2.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        final fetcher = _FakeFetcher(
          strictError: const HandshakeException(),
          onAllowBad: _certInfo(),
        );

        await tester.pumpWidget(
          buildWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsPinned,
              fetchTlsCertificate: fetcher.call,
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
        expect(
          find.text('Server settings updated successfully.'),
          findsNothing,
        );
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

        final fetcher = _FakeFetcher(onStrict: _certInfo());

        await tester.pumpWidget(
          buildWidget(
            AddServerFullscreen(
              window: false,
              title: 'test',
              server: _serverHttpsIgnore,
              fetchTlsCertificate: fetcher.call,
            ),
          ),
        );

        await tester.enterText(find.byType(TextField).at(1), 'pi.hole.new');

        await tester.tap(find.byIcon(Icons.save_rounded));
        await tester.pump(const Duration(milliseconds: 1000));

        expect(find.byType(CertificateDetailsDialog), findsNothing);
        expect(fetcher.callCount, 0);
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
  });
}

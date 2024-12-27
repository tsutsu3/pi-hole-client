import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/screens/domains/domain_details_screen.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/domains_list_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/domains/domains.dart';
import 'package:pi_hole_client/config/globals.dart';
import './domains_test.mocks.dart';

@GenerateMocks(
  [AppConfigProvider, DomainsListProvider, ServersProvider, ApiGatewayV6],
)
void main() {
  final server = Server(
    address: 'address',
    alias: 'test',
    defaultServer: false,
    apiVersion: 'v6',
  );

  group('Domain detail screen tests', () {
    late MockApiGatewayV6 mockApiGatewayV6;
    late MockAppConfigProvider mockConfigProvider;
    late MockServersProvider mockServersProvider;
    late MockDomainsListProvider mockDomainsListProvider;

    setUp(() async {
      mockApiGatewayV6 = MockApiGatewayV6();
      mockConfigProvider = MockAppConfigProvider();
      mockServersProvider = MockServersProvider();
      mockDomainsListProvider = MockDomainsListProvider();

      when(mockApiGatewayV6.removeDomainFromList(any)).thenAnswer((_) async {
        return RemoveDomainFromListResponse(result: APiResponseType.success);
      });

      bool showingSnackbar = false;
      when(mockConfigProvider.showingSnackbar).thenReturn(showingSnackbar);
      when(mockConfigProvider.setShowingSnackbar(any)).thenAnswer((_) {});

      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);

      when(mockDomainsListProvider.fetchDomainsList(any))
          .thenAnswer((_) async {});
      when(mockDomainsListProvider.setSelectedTab(any)).thenReturn(null);
      when(mockDomainsListProvider.searchMode).thenReturn(false);
      when(mockDomainsListProvider.searchTerm).thenReturn('');
      when(mockDomainsListProvider.setSearchMode(any)).thenReturn(null);
      when(mockDomainsListProvider.onSearch(any)).thenReturn(null);
      when(mockDomainsListProvider.setBlacklistDomains(any)).thenReturn(null);
      when(mockDomainsListProvider.removeDomainFromList(any)).thenReturn(null);
      when(mockDomainsListProvider.blacklistDomains).thenReturn(
        [
          Domain(
            id: 1,
            type: 1,
            domain: 'black.example.com',
            enabled: 1,
            dateAdded: DateTime.now(),
            dateModified: DateTime.now(),
            comment: null,
            groups: [0],
          ),
        ],
      );
      when(mockDomainsListProvider.whitelistDomains).thenReturn(
        [
          Domain(
            id: 1,
            type: 1,
            domain: 'white.example.com',
            enabled: 1,
            dateAdded: DateTime.now(),
            dateModified: DateTime.now(),
            comment: null,
            groups: [0],
          ),
        ],
      );
      when(mockDomainsListProvider.loadingStatus).thenReturn(LoadStatus.loaded);
    });

    testWidgets(
      'Delete domain from whitelist',
      (WidgetTester tester) async {
        tester.view.physicalSize = const Size(1000, 400);
        tester.view.devicePixelRatio = 1.0;

        addTearDown(() {
          tester.view.resetPhysicalSize();
          tester.view.resetDevicePixelRatio();
        });

        await tester.pumpWidget(
          MultiProvider(
            providers: [
              ChangeNotifierProvider<ServersProvider>(
                create: (context) => mockServersProvider,
              ),
              ChangeNotifierProxyProvider<ServersProvider, DomainsListProvider>(
                create: (context) => mockDomainsListProvider,
                update: (context, serverConfig, servers) =>
                    servers!..update(serverConfig),
              ),
              ChangeNotifierProvider<AppConfigProvider>(
                create: (context) => mockConfigProvider,
              ),
              ChangeNotifierProxyProvider<AppConfigProvider, ServersProvider>(
                create: (context) => mockServersProvider,
                update: (context, appConfig, servers) =>
                    servers!..update(appConfig),
              ),
            ],
            child: MaterialApp(
              home: const Scaffold(
                body: DomainLists(),
              ),
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                AppLocalizations.delegate,
              ],
              scaffoldMessengerKey: scaffoldMessengerKey,
            ),
          ),
        );

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);

        // Tap whitelist domain to open domain detail screen
        await tester.tap(find.text('white.example.com'));
        await tester.pumpAndSettle();

        // Show domain detail screen
        expect(find.byType(DomainDetailsScreen), findsOneWidget);
        expect(find.byIcon(Icons.delete_rounded), findsOneWidget);

        // Tap delete button
        await tester.tap(find.byIcon(Icons.delete_rounded));
        await tester.pumpAndSettle();

        // Show delete domain modal
        expect(
          find.text('Are you sure you want to delete this domain?'),
          findsOneWidget,
        );
        expect(find.text('Confirm'), findsOneWidget);

        // Tap confirm button
        await tester.tap(find.text('Confirm'));
        await tester.pump(const Duration(milliseconds: 500));

        // show snackbar
        expect(find.text('Domain removed successfully'), findsWidgets);

        // Show whiltelist domains screen
        expect(find.byType(DomainLists), findsOneWidget);
      },
    );
  });
}

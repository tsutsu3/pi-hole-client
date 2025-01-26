// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:pi_hole_client/screens/logs/logs_filters_modal.dart';

// import '../helpers.dart';

// TODO: couse
// ═╡ EXCEPTION CAUGHT BY RENDERING LIBRARY ╞═════════════════════════════════════════════════════════
// The following assertion was thrown during layout:

// void main() async {
//   await initializeApp();

//   group(
//     'Query logs screen tests',
//     () {
//       late TestSetupHelper testSetup;

//       setUp(() async {
//         testSetup = TestSetupHelper();
//         testSetup.initializeMock(useApiGatewayVersion: 'v6');
//       });

//       testWidgets(
//         'should show logs screen on mobile layout',
//         (WidgetTester tester) async {
//           tester.view.physicalSize = const Size(1080, 2400);
//           tester.view.devicePixelRatio = 2.0;

//           addTearDown(() {
//             tester.view.resetPhysicalSize();
//             tester.view.resetDevicePixelRatio();
//           });

//           await tester.pumpWidget(
//             testSetup.buildTestWidget(
//               LogsFiltersModal(
//                 statusBarHeight: 24.0,
//                 bottomNavBarHeight: 48.0,
//                 filterLogs: () {},
//                 window: true,
//               ),
//             ),
//           );

//           expect(find.byType(LogsFiltersModal), findsOneWidget);
//         },
//       );
//     },
//   );
// }

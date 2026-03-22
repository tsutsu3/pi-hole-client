import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/ui/core/view_models/servers_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/log_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../../testing/fakes/viewmodels/fake_logs_viewmodel.dart';
import '../../../../testing/fakes/viewmodels/fake_servers_viewmodel.dart';
import '../../../../testing/test_app.dart';

/// Overrides [isAllowedOrRetried] to return false so the whitelist button
/// is shown instead of the blacklist button.
class _FakeLogsViewModelAllowWhitelist extends FakeLogsViewModel {
  @override
  bool isAllowedOrRetried(QueryStatusType? status) => false;
}

final _forwardedLog = Log(
  dateTime: DateTime(2025, 6, 1, 10, 30),
  type: DnsRecordType.a,
  url: 'example.com',
  device: '192.168.1.42',
  replyTime: 0.012,
  status: QueryStatusType.forwarded,
  replyType: ReplyType.ip,
  answeredBy: 'upstream.dns',
);

final _blockedLog = Log(
  dateTime: DateTime(2025, 6, 1, 10, 30),
  type: DnsRecordType.aaaa,
  url: 'blocked.example.com',
  device: '192.168.1.10',
  replyTime: 0.005,
  status: QueryStatusType.gravity,
  replyType: ReplyType.nxdomain,
);

Widget _buildScreen(
  Log log, {
  FakeLogsViewModel? viewModel,
  void Function(String, Log)? whiteBlackList,
}) {
  final vm = viewModel ?? FakeLogsViewModel();
  final serversVm = FakeServersViewModel();
  final callback = whiteBlackList ?? (_, _) {};

  final router = GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => MultiProvider(
          providers: [
            ChangeNotifierProvider<LogsViewModel>.value(value: vm),
            ChangeNotifierProvider<ServersViewModel>.value(value: serversVm),
          ],
          child: LogDetailsScreen(log: log, whiteBlackList: callback),
        ),
      ),
    ],
  );

  return buildTestApp(
    const SizedBox.shrink(),
    logsViewModel: vm,
    serversViewModel: serversVm,
    router: router,
  );
}

void main() async {
  await initTestApp();

  group('LogDetailsScreen rendering', () {
    testWidgets('shows appbar title', (WidgetTester tester) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.text('Log details'), findsOneWidget);
    });

    testWidgets('shows URL', (WidgetTester tester) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.text('example.com'), findsOneWidget);
    });

    testWidgets('shows DNS record type', (WidgetTester tester) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.text('A'), findsOneWidget);
    });

    testWidgets('shows device address', (WidgetTester tester) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.text('192.168.1.42'), findsOneWidget);
    });

    testWidgets('shows reply tile', (WidgetTester tester) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.text('Reply'), findsOneWidget);
    });
  });

  group('LogDetailsScreen answeredBy', () {
    testWidgets('shows answeredBy when status is forwarded', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.text('upstream.dns'), findsOneWidget);
    });

    testWidgets('hides answeredBy when status is not forwarded', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(_buildScreen(_blockedLog));
      expect(find.text('upstream.dns'), findsNothing);
      expect(find.text('Answered by'), findsNothing);
    });
  });

  group('LogDetailsScreen action buttons', () {
    testWidgets('shows blacklist button when isAllowedOrRetried is true', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.byIcon(Icons.gpp_bad_rounded), findsOneWidget);
      expect(find.byIcon(Icons.verified_user_rounded), findsNothing);
    });

    testWidgets('shows whitelist button when isAllowedOrRetried is false', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        _buildScreen(
          _blockedLog,
          viewModel: _FakeLogsViewModelAllowWhitelist(),
        ),
      );
      expect(find.byIcon(Icons.verified_user_rounded), findsOneWidget);
      expect(find.byIcon(Icons.gpp_bad_rounded), findsNothing);
    });

    testWidgets('blacklist button invokes whiteBlackList with "black"', (
      WidgetTester tester,
    ) async {
      String? calledWith;
      await tester.pumpWidget(
        _buildScreen(
          _forwardedLog,
          whiteBlackList: (list, _) => calledWith = list,
        ),
      );

      await tester.tap(find.byIcon(Icons.gpp_bad_rounded));
      await tester.pump();

      expect(calledWith, 'black');
    });

    testWidgets('whitelist button invokes whiteBlackList with "white"', (
      WidgetTester tester,
    ) async {
      String? calledWith;
      await tester.pumpWidget(
        _buildScreen(
          _blockedLog,
          viewModel: _FakeLogsViewModelAllowWhitelist(),
          whiteBlackList: (list, _) => calledWith = list,
        ),
      );

      await tester.tap(find.byIcon(Icons.verified_user_rounded));
      await tester.pump();

      expect(calledWith, 'white');
    });

    testWidgets('search online button is shown', (WidgetTester tester) async {
      await tester.pumpWidget(_buildScreen(_forwardedLog));
      expect(find.byIcon(Icons.travel_explore_rounded), findsOneWidget);
    });
  });
}

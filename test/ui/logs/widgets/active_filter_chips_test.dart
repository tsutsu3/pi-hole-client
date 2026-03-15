import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/active_filter_chips.dart';

import '../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('ActiveFilterChips', () {
    late LogsViewModel viewModel;

    setUp(() {
      viewModel = LogsViewModel();
    });

    tearDown(() {
      viewModel.dispose();
    });

    Widget buildChips({
      VoidCallback? onResetFilters,
      VoidCallback? onResetTimeFilters,
      VoidCallback? onScrollToTop,
    }) {
      return buildTestApp(
        ActiveFilterChips(
          logsViewModel: viewModel,
          onResetFilters: onResetFilters ?? () {},
          onResetTimeFilters: onResetTimeFilters ?? () {},
          onScrollToTop: onScrollToTop,
        ),
      );
    }

    testWidgets('renders empty when no filters are active', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsNothing);
    });

    testWidgets('shows time chip when time filter is set', (
      WidgetTester tester,
    ) async {
      viewModel.setStartTime(DateTime(2024, 1, 1));
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('Time'), findsOneWidget);
    });

    testWidgets('time chip calls resetTime and onResetTimeFilters on delete', (
      WidgetTester tester,
    ) async {
      viewModel.setStartTime(DateTime(2024, 1, 1));
      var resetTimeCalled = false;

      await tester.pumpWidget(
        buildChips(onResetTimeFilters: () => resetTimeCalled = true),
      );

      await tester.tap(find.byIcon(Icons.cancel).first);
      await tester.pump();

      expect(viewModel.startTime, isNull);
      expect(resetTimeCalled, true);
    });

    testWidgets('shows status chip when status filter is narrowed', (
      WidgetTester tester,
    ) async {
      viewModel.setRequestStatus(RequestStatus.blocked);
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsOneWidget);
    });

    testWidgets('status chip calls resetStatus and onResetFilters on delete', (
      WidgetTester tester,
    ) async {
      viewModel.setRequestStatus(RequestStatus.blocked);
      var resetFiltersCalled = false;

      await tester.pumpWidget(
        buildChips(onResetFilters: () => resetFiltersCalled = true),
      );

      await tester.tap(find.byIcon(Icons.cancel).first);
      await tester.pump();

      expect(resetFiltersCalled, true);
    });

    testWidgets('shows client chip when client subset selected', (
      WidgetTester tester,
    ) async {
      viewModel.setClients(['client1', 'client2']);
      viewModel.setSelectedClients(['client1']);
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('client1'), findsOneWidget);
    });

    testWidgets('shows count label when multiple clients selected', (
      WidgetTester tester,
    ) async {
      viewModel.setClients(['c1', 'c2', 'c3']);
      viewModel.setSelectedClients(['c1', 'c2']);
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsOneWidget);
      expect(find.textContaining('clients selected'), findsOneWidget);
    });

    testWidgets('shows domain chip when domain filter is set', (
      WidgetTester tester,
    ) async {
      viewModel.setSelectedDomain('example.com');
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsOneWidget);
      expect(find.text('example.com'), findsOneWidget);
    });

    testWidgets('domain chip calls setSelectedDomain(null) on delete', (
      WidgetTester tester,
    ) async {
      viewModel.setSelectedDomain('example.com');
      var resetFiltersCalled = false;

      await tester.pumpWidget(
        buildChips(onResetFilters: () => resetFiltersCalled = true),
      );

      await tester.tap(find.byIcon(Icons.cancel).first);
      await tester.pump();

      expect(viewModel.selectedDomain, isNull);
      expect(resetFiltersCalled, true);
    });

    testWidgets('shows multiple chips when multiple filters active', (
      WidgetTester tester,
    ) async {
      viewModel.setStartTime(DateTime(2024, 1, 1));
      viewModel.setRequestStatus(RequestStatus.blocked);
      viewModel.setSelectedDomain('example.com');
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsNWidgets(3));
    });

    testWidgets('shows statusSelectedString when exactly one status selected', (
      WidgetTester tester,
    ) async {
      viewModel.setStatusSelected([1]); // single status
      await tester.pumpWidget(buildChips());

      expect(find.byType(Chip), findsOneWidget);
    });

    testWidgets('client chip delete calls onScrollToTop and resetClients', (
      WidgetTester tester,
    ) async {
      viewModel.setClients(['c1', 'c2']);
      viewModel.setSelectedClients(['c1']);
      var scrollCalled = false;
      var resetCalled = false;

      await tester.pumpWidget(
        buildChips(
          onScrollToTop: () => scrollCalled = true,
          onResetFilters: () => resetCalled = true,
        ),
      );

      await tester.tap(find.byIcon(Icons.cancel).first);
      await tester.pump();

      expect(scrollCalled, true);
      expect(resetCalled, true);
    });

    testWidgets('onScrollToTop is called when status chip deleted', (
      WidgetTester tester,
    ) async {
      viewModel.setRequestStatus(RequestStatus.blocked);
      var scrollCalled = false;

      await tester.pumpWidget(
        buildChips(onScrollToTop: () => scrollCalled = true),
      );

      await tester.tap(find.byIcon(Icons.cancel).first);
      await tester.pump();

      expect(scrollCalled, true);
    });
  });
}

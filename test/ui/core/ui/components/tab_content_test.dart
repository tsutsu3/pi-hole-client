import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content_list.dart';

void main() {
  Widget buildNestedApp(Widget body) {
    return MaterialApp(
      home: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (context, _) => [
            SliverOverlapAbsorber(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              sliver: const SliverAppBar(title: Text('title'), pinned: true),
            ),
          ],
          body: Builder(builder: (context) => body),
        ),
      ),
    );
  }

  group('CustomTabContent error state', () {
    testWidgets('shows the error and can be pulled to refresh', (tester) async {
      var refreshCount = 0;

      await tester.pumpWidget(
        buildNestedApp(
          CustomTabContent(
            loadingGenerator: () => const SizedBox(),
            contentGenerator: () => const [],
            errorGenerator: () => const ErrorMessage(message: 'error'),
            loadStatus: LoadStatus.error,
            onRefresh: () async => refreshCount++,
          ),
        ),
      );

      expect(find.text('error'), findsOneWidget);

      await tester.fling(find.text('error'), const Offset(0, 300), 1000);
      await tester.pumpAndSettle();

      expect(refreshCount, 1);
    });
  });

  group('CustomTabContentList error state', () {
    testWidgets('shows the error and can be pulled to refresh', (tester) async {
      var refreshCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: CustomTabContentList(
              loadingGenerator: () => const SizedBox(),
              itemsCount: 0,
              contentWidget: (_) => const SizedBox(),
              noData: const SizedBox(),
              errorGenerator: () => const ErrorMessage(message: 'error'),
              loadStatus: LoadStatus.error,
              onRefresh: () async => refreshCount++,
            ),
          ),
        ),
      );

      expect(find.text('error'), findsOneWidget);

      await tester.fling(find.text('error'), const Offset(0, 300), 1000);
      await tester.pumpAndSettle();

      expect(refreshCount, 1);
    });
  });
}

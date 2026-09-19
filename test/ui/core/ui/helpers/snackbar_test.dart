import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('showSaveFailedSnackBar', () {
    Future<AppColors> pumpAndShow(WidgetTester tester, Object error) async {
      final appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => showSaveFailedSnackBar(
                context: context,
                appConfigViewModel: appConfigViewModel,
                error: error,
                alreadyExistsLabel: 'Already exists',
                failedLabel: 'Save failed',
              ),
              child: const Text('show'),
            ),
          ),
          appConfigViewModel: appConfigViewModel,
        ),
      );
      await tester.tap(find.text('show'));
      await tester.pump();

      return Theme.of(
        tester.element(find.text('show')),
      ).extension<AppColors>()!;
    }

    testWidgets('shows a caution for AlreadyExistsException', (tester) async {
      final colors = await pumpAndShow(tester, AlreadyExistsException());

      expect(find.text('Already exists'), findsOneWidget);
      expect(find.text('Save failed'), findsNothing);
      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, colors.snackBarCaution);
    });

    testWidgets('shows an error for other errors', (tester) async {
      final colors = await pumpAndShow(tester, Exception('error'));

      expect(find.text('Save failed'), findsOneWidget);
      expect(find.text('Already exists'), findsNothing);
      final snackBar = tester.widget<SnackBar>(find.byType(SnackBar));
      expect(snackBar.backgroundColor, colors.snackBarError);
    });
  });
}

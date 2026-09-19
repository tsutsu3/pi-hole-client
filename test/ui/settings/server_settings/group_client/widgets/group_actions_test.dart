import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/widgets/group_actions.dart';
import 'package:pi_hole_client/utils/exceptions.dart';

import '../../../../../../testing/fakes/repositories/api/fake_group_repository.dart';
import '../../../../../../testing/fakes/repositories/local/fake_app_config_repository.dart';
import '../../../../../../testing/test_app.dart';

void main() async {
  await initTestApp();

  group('deleteGroup', () {
    late FakeGroupRepository fakeGroupRepository;
    late GroupsViewModel viewModel;
    late AppConfigViewModel appConfigViewModel;

    final group = Group(
      id: 5,
      name: 'test',
      enabled: true,
      dateAdded: DateTime(2025, 1, 1),
      dateModified: DateTime(2025, 1, 1),
    );

    setUp(() {
      fakeGroupRepository = FakeGroupRepository();
      viewModel = GroupsViewModel(groupRepository: fakeGroupRepository);
      appConfigViewModel = AppConfigViewModel(FakeAppConfigRepository());
    });

    tearDown(() => viewModel.dispose());

    Future<void> pumpAndDelete(WidgetTester tester) async {
      await tester.pumpWidget(
        buildTestApp(
          Builder(
            builder: (context) => TextButton(
              onPressed: () => deleteGroup(
                context: context,
                viewModel: viewModel,
                appConfigViewModel: appConfigViewModel,
                group: group,
              ),
              child: const Text('delete'),
            ),
          ),
          appConfigViewModel: appConfigViewModel,
        ),
      );
      await tester.tap(find.text('delete'));
      await tester.pumpAndSettle();
    }

    testWidgets('shows success snackbar when deleted', (tester) async {
      await pumpAndDelete(tester);

      expect(find.text('Group removed successfully'), findsOneWidget);
    });

    testWidgets('explains why when the group is in use', (tester) async {
      fakeGroupRepository.deleteGroupError = GroupInUseException();

      await pumpAndDelete(tester);

      expect(
        find.text(
          'This group is used by clients, domains or adlists. '
          'Remove it from them first, then delete the group',
        ),
        findsOneWidget,
      );
      expect(find.text('Could not remove group'), findsNothing);
    });

    testWidgets('shows failure snackbar on other errors', (tester) async {
      fakeGroupRepository.shouldFail = true;

      await pumpAndDelete(tester);

      expect(find.text('Could not remove group'), findsOneWidget);
    });
  });
}

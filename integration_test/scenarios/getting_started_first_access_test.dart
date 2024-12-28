import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:pi_hole_client/widgets/start_warning_modal.dart';
import '../helpers.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  await initializeApp('.env');

  final dbPath = 'integration_test.db';

  group('E2E test', () {
    late SecureStorageRepository ssRepository;
    late DatabaseRepository dbRepository;
    late TestSetupHelper setupHelper;

    setUp(() async {
      ssRepository = SecureStorageRepository();
      dbRepository = DatabaseRepository(ssRepository);
      await dbRepository.initialize(path: dbPath);

      setupHelper = TestSetupHelper(dbRepository, ssRepository);
      await setupHelper.initializeProviders();
    });

    tearDown(() async {
      await setupHelper.tearDown(dbPath);
    });

    testWidgets(
      'should show getting started screen when first accessing the app',
      (tester) async {
        await tester.pumpWidget(buildTestWidget(setupHelper));

        expect(find.text('Servers'), findsOneWidget);
        await tester.pumpAndSettle();
        expect(find.byType(StartInfoModal), findsOneWidget);
        expect(find.text('Getting Started'), findsOneWidget);
      },
    );
  });
}

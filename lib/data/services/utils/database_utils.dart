import 'package:pi_hole_client/data/services/local/database_service.dart';

/// Opens the database if not already open.
/// Useful as a shared helper in repositories or services.
Future<void> openDbIfNeeded(DatabaseService database) async {
  if (!database.isOpen) {
    await database.open();
  }
}

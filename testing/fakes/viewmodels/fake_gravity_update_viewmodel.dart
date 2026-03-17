import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/gravity_update_viewmodel.dart';

import '../repositories/local/fake_gravity_repository.dart';

/// A fake [GravityUpdateViewModel] for widget tests.
///
/// Bypasses `GravityUpdateService` entirely and exposes every piece of state
/// as a simple settable property. Call counters let tests verify that
/// methods such as [start], [load], and [removeMessage] were invoked.
class FakeGravityUpdateViewModel extends GravityUpdateViewModel {
  FakeGravityUpdateViewModel() : super(repository: FakeGravityRepository());

  // --- Settable state ---
  GravityStatus _status = GravityStatus.idle;
  List<String> _logs = [];
  List<FtlMessage> _messages = [];
  DateTime? _startedAtTime;
  DateTime? _completedAtTime;
  bool _isLoaded = false;

  @override
  GravityStatus get status => _status;

  set status(GravityStatus value) {
    _status = value;
    notifyListeners();
  }

  @override
  List<String> get logs => _logs;

  set logs(List<String> value) {
    _logs = value;
    notifyListeners();
  }

  @override
  List<FtlMessage> get messages => _messages;

  set messages(List<FtlMessage> value) {
    _messages = value;
    notifyListeners();
  }

  @override
  DateTime? get startedAtTime => _startedAtTime;

  set startedAtTime(DateTime? value) {
    _startedAtTime = value;
    notifyListeners();
  }

  @override
  DateTime? get completedAtTime => _completedAtTime;

  set completedAtTime(DateTime? value) {
    _completedAtTime = value;
    notifyListeners();
  }

  @override
  bool get isLoaded => _isLoaded;

  set isLoaded(bool value) {
    _isLoaded = value;
    notifyListeners();
  }

  // --- Call tracking ---
  int startCallCount = 0;
  int loadCallCount = 0;
  int resetCallCount = 0;

  @override
  Future<void> start() async {
    startCallCount++;
  }

  @override
  Future<void> load() async {
    loadCallCount++;
  }

  @override
  void reset() {
    resetCallCount++;
  }
}

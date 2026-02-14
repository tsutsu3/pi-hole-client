import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/use_cases/gravity_update_service.dart';
import 'package:pi_hole_client/utils/logger.dart';

/// ViewModel for the Gravity Update screen.
///
/// Manages gravity update state (logs, status, messages) and exposes it to
/// the UI. Delegates business logic to [GravityUpdateService]. Registered as
/// a global-scope provider in `main.dart` because gravity updates persist
/// across navigation.
class GravityUpdateProvider with ChangeNotifier {
  GravityUpdateProvider({required GravityRepository repository})
      : _repository = repository;

  final GravityRepository _repository;
  String? _serverAddress;
  GravityUpdateService? _service;

  GravityStatus _status = GravityStatus.idle;
  List<String> _logs = [];
  List<FtlMessage> _messages = [];
  DateTime? _startedAt;
  DateTime? _completedAt;
  bool _loaded = false;

  GravityStatus get status => _status;
  List<String> get logs => _logs;
  DateTime? get startedAtTime => _startedAt;
  DateTime? get completedAtTime => _completedAt;
  bool get isLoaded => _loaded;
  List<FtlMessage> get messages => List.unmodifiable(_messages);

  void clearMessages() {
    _messages.clear();
    notifyListeners();
  }

  void clearLogs() {
    _logs.clear();
    notifyListeners();
  }

  void setStatus(GravityStatus status) {
    _status = status;
    notifyListeners();
  }

  void setStartedAt(DateTime? time) {
    _startedAt = time;
    notifyListeners();
  }

  void setCompletedAt(DateTime? time) {
    _completedAt = time;
    notifyListeners();
  }

  void appendLogs(List<String>? entries) {
    if (entries == null) return;
    _logs.addAll(entries);
    notifyListeners();
  }

  /// Re-initializes the service when the active server changes.
  ///
  /// Called by `ChangeNotifierProxyProvider2` whenever `RepositoryBundle` or
  /// `ServersProvider` updates. Creates a new [GravityUpdateService] with the
  /// provided repositories, or sets it to `null` if repositories are absent.
  void update({
    ActionsRepository? actionsRepository,
    FtlRepository? ftlRepository,
    String? serverAddress,
  }) {
    _service?.cancelUpdate();
    _serverAddress = serverAddress;
    if (actionsRepository != null && ftlRepository != null) {
      _service = GravityUpdateService(
        repository: _repository,
        actionsRepository: actionsRepository,
        ftlRepository: ftlRepository,
      );
    } else {
      _service = null;
    }
    reset();
  }

  /// Removes an info message by [id] from both the API and local database.
  Future<bool> removeMessage(int id) async {
    if (_service == null) {
      logger.d('Service is null. removeMessage() cannot be performed.');
      return false;
    }
    final address = _serverAddress ?? '';
    final result = await _service!.removeMessage(address, id);
    if (result) {
      _messages.removeWhere((msg) => msg.id == id);
    }
    notifyListeners();
    return result;
  }

  /// Loads persisted gravity data (logs, messages, status) from local storage.
  Future<void> load() async {
    if (_service == null) {
      logger.d('Service is null. load() cannot be performed.');
      return;
    }
    if (_loaded) return;
    final address = _serverAddress ?? '';
    final data = await _service!.loadGravityData(address);
    _messages = data['messages'];
    _logs = data['logs'];
    _status = data['status'];
    _startedAt = data['startedAt'];
    _completedAt = data['completedAt'];

    // When the status is running, it means app force killed or the app was
    // terminated while the gravity update was in progress.
    if (_status == GravityStatus.running) {
      _status = GravityStatus.error;
    }

    _loaded = true;
    notifyListeners();
  }

  /// Starts a new gravity update, streaming logs and status to the UI.
  Future<void> start() async {
    if (_service == null) {
      logger.d('Service is null. start() cannot be performed.');
      return;
    }

    final address = _serverAddress ?? '';

    // Reset the state before starting the update
    _logs.clear();
    _messages.clear();
    _startedAt = DateTime.now();
    _completedAt = null;
    _status = GravityStatus.running;
    notifyListeners();

    await _service!.startUpdate(
      address: address,
      onStarted: (startTime) {
        _startedAt = startTime;
        notifyListeners();
      },
      onStatusChanged: (status) {
        _status = status;
        notifyListeners();
      },
      onCompleted: (completeTime) {
        _completedAt = completeTime;
        notifyListeners();
      },
      onLogsUpdated: (logs) {
        _logs = logs;
        notifyListeners();
      },
      onMessagesUpdated: (messages) {
        _messages = messages;
        notifyListeners();
      },
    );
  }

  /// Resets all state to idle and cancels any active update.
  void reset() {
    if (_service == null) {
      logger.d('Service is null. reset() cannot be performed.');
      return;
    }
    _messages.clear();
    _logs.clear();
    _status = GravityStatus.idle;
    _startedAt = null;
    _completedAt = null;
    _loaded = false;
    _service!.cancelUpdate();
    notifyListeners();
  }
}

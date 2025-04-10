import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/models/messages.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/services/gravity_update_service.dart';

class GravityUpdateProvider with ChangeNotifier {
  GravityUpdateProvider({
    required DatabaseRepository repository,
    required ServersProvider serversProvider,
  })  : _repository = repository,
        _serversProvider = serversProvider {
    if (_serversProvider.selectedApiGateway != null) {
      _service = GravityUpdateService(
        repository: _repository,
        apiGateway: _serversProvider.selectedApiGateway!,
      );
    }
  }

  final DatabaseRepository _repository;
  ServersProvider _serversProvider;
  GravityUpdateService? _service;

  GravityStatus _status = GravityStatus.idle;
  List<String> _logs = [];
  List<Message> _messages = [];
  DateTime? _startedAt;
  DateTime? _completedAt;
  bool _loaded = false;

  GravityStatus get status => _status;
  List<String> get logs => _logs;
  DateTime? get startedAtTime => _startedAt;
  DateTime? get completedAtTime => _completedAt;
  bool get isLoaded => _loaded;
  List<Message> get messages => List.unmodifiable(_messages);

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

  void setMessages(MessagesInfo? messagesInfo) {
    if (messagesInfo == null || messagesInfo.messages.isEmpty) return;
    _messages.clear();
    _messages.addAll(messagesInfo.messages);
    notifyListeners();
  }

  void appendLogs(List<String>? entries) {
    if (entries == null) return;
    _logs.addAll(entries);
    notifyListeners();
  }

  /// Updates the GravityProvider with a new ServersProvider instance.
  ///
  /// This method sets the internal `_serversProvider` to the provided [provider].
  /// If the `selectedApiGateway` in the [provider] is not null, it initializes
  /// the `_service` with a new instance of `GravityUpdateService` using the
  /// current `_repository` and the selected API gateway. Otherwise, `_service`
  /// is set to null.
  ///
  /// After updating the `_service`, the `reset` method is called to reset
  /// the state of the provider.
  ///
  /// - Parameter [provider]: The new instance of `ServersProvider` to update
  ///   the GravityProvider with.
  void update(ServersProvider provider) {
    _service?.cancelUpdate();

    _serversProvider = provider;
    if (_serversProvider.selectedApiGateway != null) {
      _service = GravityUpdateService(
        repository: _repository,
        apiGateway: _serversProvider.selectedApiGateway!,
      );
    } else {
      _service = null;
    }
    reset();
  }

  /// Removes a message with the specified [id].
  ///
  /// This method attempts to remove a message by its [id] from the server
  /// and the local list of messages. If the `_service` is `null`, the operation
  /// cannot be performed, and `false` is returned.
  ///
  /// Returns `true` if the message was successfully removed, otherwise `false`.
  ///
  /// - Parameters:
  ///   - [id]: The unique identifier of the message to be removed.
  Future<bool> removeMessage(int id) async {
    if (_service == null) {
      logger.d('API Gateway is null. removeMessag() cannot be performed.');
      return false;
    }
    final address = _serversProvider.selectedServer?.address ?? '';
    final result = await _service!.removeMessage(address, id);
    if (result) {
      _messages.removeWhere((msg) => msg.id == id);
    }
    notifyListeners();
    return result;
  }

  /// Loads the gravity data from the service and updates the provider's state.
  ///
  /// This method is asynchronous and should be awaited to ensure proper execution.
  Future<void> load() async {
    if (_service == null) {
      logger.d('API Gateway is null. load() cannot be performed.');
      return;
    }
    if (_loaded) return;
    final address = _serversProvider.selectedServer?.address ?? '';
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

  /// Initiates the update process by calling the `startUpdate` method of the service.
  ///
  /// This method is asynchronous and returns a `Future` that completes when the update process is finished.
  Future<void> start() async {
    if (_service == null) {
      logger.d('API Gateway is null. start() cannot be performed.');
      return;
    }

    final address = _serversProvider.selectedServer?.address ?? '';

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

  /// Resets the state of the GravityUpdateProvider.
  void reset() {
    if (_service == null) {
      logger.d('API Gateway is null. reset() cannot be performed.');
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

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/messages.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/repository/database.dart';

class GravityUpdateProvider with ChangeNotifier {
  GravityUpdateProvider({
    required DatabaseRepository repository,
    required ServersProvider serversProvider,
  })  : _repository = repository,
        _serversProvider = serversProvider;

  final DatabaseRepository _repository;
  ServersProvider? _serversProvider;
  ApiGateway? _apiGateway;

  GravityStatus _status = GravityStatus.idle;

  List<String> _logs = [];

  List<Message> _messages = [];

  DateTime? _startedAt;

  DateTime? _completedAt;

  bool _loaded = false;

  StreamSubscription<GravityResponse>? _subscription;

  GravityStatus get status => _status;

  List<String> get logs => _logs;

  DateTime? get startedAtTime => _startedAt;

  DateTime? get completedAtTime => _completedAt;

  bool get isLoaded => _loaded;

  List<Message> get messages => List.unmodifiable(_messages);

  void update(ServersProvider? provider) {
    _subscription?.cancel();
    _subscription = null;

    _serversProvider = provider;
    _apiGateway = _serversProvider?.selectedApiGateway;

    reset();
  }

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

  Future<bool> removeMessage(int id) async {
    // Delete from pi-hole server
    final resp = await _apiGateway?.removeMessage(id);

    if (resp == null || resp.result == APiResponseType.error) {
      notifyListeners();
      return false;
    }

    // Delete from database
    final address = _serversProvider?.selectedServer?.address ?? '';
    final respDeleteMsg = await _repository.deleteMessageQuery(address, id);
    if (!respDeleteMsg) {
      notifyListeners();
      return false;
    }

    // Delete from provider
    _messages.removeWhere((message) => message.id == id);

    notifyListeners();
    return true;
  }

  Future<void> load() async {
    if (_loaded) return;

    final gravityData = await _repository.getGravityDataQuery(
      _serversProvider?.selectedServer?.address ?? '',
    );
    logger.d('Load gravity data');

    _messages = gravityData?.gravityMessages?.map(
          (data) {
            return Message(
              id: data.id,
              timestamp: data.timestamp,
              message: data.message,
              url: data.url,
            );
          },
        ).toList() ??
        [];

    final logs = gravityData?.gravityLogs;
    if (logs != null) {
      final sortedLogs = logs.toList()
        ..sort((a, b) => a.line.compareTo(b.line));
      _logs = sortedLogs.map((e) => e.message).toList();
    } else {
      _logs = [];
    }

    _status = gravityData?.gravityUpdate?.status != null
        ? GravityStatus.values[gravityData!.gravityUpdate!.status]
        : GravityStatus.idle;

    _startedAt = gravityData?.gravityUpdate?.startTime;

    _completedAt = gravityData?.gravityUpdate?.endTime;

    _loaded = true;

    // If the status is running when the app is opened, it means the gravity
    //update was forcibly stopped, and the status should be set to error.
    if (_status == GravityStatus.running) {
      _status = GravityStatus.error;
    }

    notifyListeners();
  }

  /// Start update gravity
  Future<void> start() async {
    if (_status != GravityStatus.running) {
      _status = GravityStatus.running;
    }

    final address = _serversProvider?.selectedServer?.address ?? '';

    _logs.clear();
    _messages.clear();
    _startedAt = DateTime.now();
    _completedAt = null;

    await _repository.clearGravityDataQuery(address);
    await _repository.upsertGravityUpdateQuery(
      GravityUpdateData(
        address: address,
        startTime: _startedAt == null ? DateTime.now() : _startedAt!,
        endTime: _completedAt == null ? DateTime.now() : _completedAt!,
        status: _status.index,
      ),
    );

    notifyListeners();

    final stream = _apiGateway?.updateGravity();
    if (stream == null) {
      _status = GravityStatus.error;
      _completedAt = DateTime.now();
      await _repository.upsertGravityUpdateQuery(
        GravityUpdateData(
          address: address,
          startTime: _startedAt == null ? DateTime.now() : _startedAt!,
          endTime: _completedAt == null ? DateTime.now() : _completedAt!,
          status: _status.index,
        ),
      );
      notifyListeners();
      return;
    }

    _subscription = stream.listen(
      (chunk) async {
        if (chunk.result == APiResponseType.error) {
          _status = GravityStatus.error;
          _completedAt = DateTime.now();
          await _repository.upsertGravityUpdateQuery(
            GravityUpdateData(
              address: address,
              startTime: _startedAt == null ? DateTime.now() : _startedAt!,
              endTime: _completedAt == null ? DateTime.now() : _completedAt!,
              status: _status.index,
            ),
          );
          notifyListeners();
          await _subscription?.cancel();
          return;
        }

        final baseIndex = _logs.length;

        if (chunk.data != null && chunk.data!.isNotEmpty) {
          _logs.addAll(chunk.data!);

          final logsToInsert = chunk.data!.asMap().entries.map((entry) {
            final index = baseIndex + entry.key;
            final logMessage = entry.value;
            return GravityLogsData(
              address: address,
              line: index,
              message: logMessage,
              timestamp: DateTime.now(),
            );
          }).toList();

          await _repository.insertGravityLogQuery(logsToInsert);
          notifyListeners();
        }
      },
      onError: (e) async {
        _status = GravityStatus.error;
        _completedAt = DateTime.now();
        await _repository.upsertGravityUpdateQuery(
          GravityUpdateData(
            address: address,
            startTime: _startedAt == null ? DateTime.now() : _startedAt!,
            endTime: _completedAt == null ? DateTime.now() : _completedAt!,
            status: _status.index,
          ),
        );
        notifyListeners();
      },
      onDone: () async {
        if (_status == GravityStatus.error) {
          logger.d('onDone skipped due to error status');
          return;
        }

        _status = GravityStatus.success;
        _completedAt = DateTime.now();

        await _repository.upsertGravityUpdateQuery(
          GravityUpdateData(
            address: address,
            startTime: _startedAt == null ? DateTime.now() : _startedAt!,
            endTime: _completedAt == null ? DateTime.now() : _completedAt!,
            status: _status.index,
          ),
        );

        await Future.delayed(const Duration(milliseconds: 500));
        var msgs = await _apiGateway?.getMessages();

        /// Retry fetching messages if the first attempt fails
        if (msgs == null || msgs.result == APiResponseType.error) {
          logger.d('Retrying to fetch messages...');
          await Future.delayed(const Duration(milliseconds: 500));
          msgs = await _apiGateway?.getMessages();
        }

        final messages = msgs?.data?.messages;

        if (messages == null || messages.isEmpty) {
          notifyListeners();
          return;
        }

        _messages.addAll(messages);

        final messagesToInsert = messages.map((entry) {
          return GravityMessagesData(
            id: entry.id,
            address: address,
            message: entry.message,
            url: entry.url,
            timestamp: entry.timestamp,
          );
        }).toList();

        if (messagesToInsert.isNotEmpty) {
          await _repository.insertGravityMessageQuery(messagesToInsert);
        }

        notifyListeners();
      },
      cancelOnError: true,
    );
  }

  void reset() {
    _messages.clear();
    _logs.clear();
    _status = GravityStatus.idle;
    _startedAt = null;
    _completedAt = null;
    _loaded = false;
    _subscription?.cancel();
    _subscription = null;
  }
}

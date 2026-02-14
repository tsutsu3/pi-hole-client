import 'dart:async';

import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:result_dart/result_dart.dart';

/// Orchestrates Pi-hole gravity database updates.
///
/// Manages the full lifecycle of a gravity update: streaming log output from
/// the API, persisting progress to the local database, and fetching
/// post-update info messages. Depends on [ActionsRepository] for the update
/// stream, [FtlRepository] for info messages, and [GravityRepository] for
/// local persistence.
class GravityUpdateService {
  GravityUpdateService({
    required GravityRepository repository,
    required ActionsRepository actionsRepository,
    required FtlRepository ftlRepository,
  }) : _repository = repository,
       _actionsRepository = actionsRepository,
       _ftlRepository = ftlRepository;

  final GravityRepository _repository;
  final ActionsRepository _actionsRepository;
  final FtlRepository _ftlRepository;

  StreamSubscription<Result<List<String>>>? _subscription;

  /// Starts a gravity update and streams progress via callbacks.
  ///
  /// Clears previous data for [address], then listens to the update stream.
  /// On completion, fetches info messages from the API and persists them.
  Future<void> startUpdate({
    required String address,
    required void Function(List<String> logs) onLogsUpdated,
    required void Function(GravityStatus status) onStatusChanged,
    required void Function(DateTime startTime) onStarted,
    required void Function(DateTime completeTime) onCompleted,
    required void Function(List<FtlMessage> messages) onMessagesUpdated,
  }) async {
    final logs = <String>[];
    final startedAt = DateTime.now();
    var status = GravityStatus.running;
    DateTime? completedAt;

    // Clear previous gravity data from the database
    await _repository.deleteGravityData(address);
    await _repository.upsertGravityUpdate(
      GravityUpdateData(
        address: address,
        startTime: startedAt,
        endTime: startedAt,
        status: status.index,
      ),
    );
    onStarted(startedAt);
    onStatusChanged(status);

    // Start the gravity update process
    final stream = _actionsRepository.updateGravity();

    _subscription = stream.listen(
      (result) async {
        await result.fold(
          (data) async {
            if (data.isNotEmpty) {
              final baseIndex = logs.length;
              logs.addAll(data);

              final logsToInsert = data.asMap().entries.map((entry) {
                final index = baseIndex + entry.key;
                return GravityLogData(
                  address: address,
                  line: index,
                  message: entry.value,
                  timestamp: DateTime.now(),
                );
              }).toList();
              await _repository.insertGravityLogs(logsToInsert);
              onLogsUpdated(logs);
            }
          },
          (error) async {
            status = GravityStatus.error;
            completedAt = DateTime.now();
            await _repository.upsertGravityUpdate(
              GravityUpdateData(
                address: address,
                startTime: startedAt,
                endTime: completedAt!,
                status: status.index,
              ),
            );
            onStatusChanged(status);
            onCompleted(completedAt!);
            await _subscription?.cancel();
          },
        );
      },
      onError: (error) async {
        status = GravityStatus.error;
        completedAt = DateTime.now();
        await _repository.upsertGravityUpdate(
          GravityUpdateData(
            address: address,
            startTime: startedAt,
            endTime: completedAt!,
            status: status.index,
          ),
        );
        onStatusChanged(status);
        onCompleted(completedAt!);
      },
      onDone: () async {
        if (status == GravityStatus.error) return;

        status = GravityStatus.success;
        completedAt = DateTime.now();
        await _repository.upsertGravityUpdate(
          GravityUpdateData(
            address: address,
            startTime: startedAt,
            endTime: completedAt!,
            status: status.index,
          ),
        );

        // Delay to ensure the messages are fetched after the update is complete
        await Future.delayed(const Duration(milliseconds: 500));
        final msgsResult = await _ftlRepository.fetchInfoMessages();
        final messages = msgsResult.getOrElse((_) => []);
        if (messages.isNotEmpty) {
          final messagesToInsert = messages.map((entry) {
            return GravityMessageData(
              id: entry.id,
              address: address,
              message: entry.message,
              url: entry.url,
              timestamp: entry.timestamp,
            );
          }).toList();
          await _repository.insertGravityMessages(messagesToInsert);
          onMessagesUpdated(messages);
        }
        onStatusChanged(status);
        onCompleted(completedAt!);
      },
      cancelOnError: true,
    );
  }

  /// Removes an info message from both the API and local database.
  ///
  /// Returns `true` if both deletions succeed, `false` otherwise.
  Future<bool> removeMessage(String address, int id) async {
    final resp = await _ftlRepository.deleteInfoMessage(id);
    if (resp.isError()) {
      return false;
    }
    final respDeleteMsg = await _repository.deleteGravityMessage(address, id);
    if (respDeleteMsg.isError()) {
      return false;
    }
    return true;
  }

  /// Loads persisted gravity data (logs, messages, status) from the local
  /// database for the given server [address].
  Future<Map<String, dynamic>> loadGravityData(String address) async {
    final data = await _repository.fetchGravityData(address);
    final gravityData = data.getOrNull();

    final messages =
        gravityData?.gravityMessages?.map((data) {
          return FtlMessage(
            id: data.id,
            timestamp: data.timestamp,
            message: data.message,
            url: data.url,
          );
        }).toList() ??
        [];

    var logs = <String>[];
    if (gravityData?.gravityLogs != null) {
      final sortedLogs = gravityData!.gravityLogs!.toList()
        ..sort((a, b) => a.line.compareTo(b.line));
      logs = sortedLogs.map((e) => e.message).toList();
    }
    final status = gravityData?.gravityUpdate?.status != null
        ? GravityStatus.values[gravityData!.gravityUpdate!.status]
        : GravityStatus.idle;
    final startedAt = gravityData?.gravityUpdate?.startTime;
    final completedAt = gravityData?.gravityUpdate?.endTime;

    return {
      'messages': messages,
      'logs': logs,
      'status': status,
      'startedAt': startedAt,
      'completedAt': completedAt,
    };
  }

  /// Cancels the active gravity update stream subscription.
  void cancelUpdate() {
    _subscription?.cancel();
    _subscription = null;
  }
}

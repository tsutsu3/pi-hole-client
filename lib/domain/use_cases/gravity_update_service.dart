import 'dart:async';

import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/local/gravity_repository.dart';
import 'package:pi_hole_client/data/services/api/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/models_old/database.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/messages.dart';

/// A service responsible for managing gravity updates by interacting with
/// the database repository and API gateway.
///
/// This service handles the logic for updating gravity data and manages
/// a subscription to listen for gravity responses.
///
/// Parameters:
/// - [_repository]: The database repository used for storing and retrieving data.
/// - [_apiGateway]: The API gateway used for making network requests.
class GravityUpdateService {
  GravityUpdateService({
    required GravityRepository repository,
    required ApiGateway apiGateway,
  })  : _repository = repository,
        _apiGateway = apiGateway;

  final GravityRepository _repository;
  final ApiGateway _apiGateway;

  StreamSubscription<GravityResponse>? _subscription;

  /// Starts the gravity update process and notifies each event via callbacks.
  ///
  /// This method initiates the gravity update process by clearing previous gravity
  /// data, updating the database with the initial state, and listening to the
  /// update stream from the API. It provides real-time updates through the provided
  /// callback functions for logs, status changes, start time, completion time, and
  /// messages.
  ///
  /// The process involves:
  /// - Clearing previous gravity data from the database.
  /// - Inserting the initial gravity update state into the database.
  /// - Listening to the API stream for updates and handling logs, errors, and completion.
  /// - Fetching and storing messages after the update is complete.
  ///
  /// If an error occurs during the update process, the status is updated to `error`,
  /// and the process is terminated. On successful completion, the status is updated
  /// to `success`, and messages are fetched and stored.
  ///
  /// Parameters:
  /// - [address] The address associated with the gravity update.
  /// - [onLogsUpdated] Callback invoked with updated logs during the process.
  /// - [onStatusChanged] Callback invoked when the gravity update status changes.
  /// - [onStarted] Callback invoked with the start time of the update process.
  /// - [onCompleted] Callback invoked with the completion time of the update process.
  /// - [onMessagesUpdated] Callback invoked with the list of messages after the update.
  Future<void> startUpdate({
    required String address,
    required void Function(List<String> logs) onLogsUpdated,
    required void Function(GravityStatus status) onStatusChanged,
    required void Function(DateTime startTime) onStarted,
    required void Function(DateTime completeTime) onCompleted,
    required void Function(List<Message> messages) onMessagesUpdated,
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
    final stream = _apiGateway.updateGravity();

    _subscription = stream.listen(
      (chunk) async {
        // When the API returns an error, update the status and complete time
        if (chunk.result == APiResponseType.error) {
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
          return;
        }

        // Update the logs with the received data
        if (chunk.data != null && chunk.data!.isNotEmpty) {
          final baseIndex = logs.length;
          logs.addAll(chunk.data!);

          final logsToInsert = chunk.data!.asMap().entries.map((entry) {
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
        final msgs = await _apiGateway.getMessages();
        final messages = msgs.data?.messages ?? [];
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

  /// Removes a message from both the database and the Pi-hole server.
  ///
  /// This method first attempts to remove the message from the Pi-hole server
  /// using the provided `id`. If the removal fails, it returns `false`.
  /// If the removal is successful, it proceeds to delete the message from
  /// the local database using the provided `address` and `id`. If the database
  /// deletion fails, it also returns `false`.
  ///
  /// Returns `true` if both the server and database deletions are successful,
  /// otherwise returns `false`.
  ///
  /// - Parameters:
  ///   - address: The address associated with the message to be removed.
  ///   - id: The unique identifier of the message to be removed.
  ///
  /// - Returns: A `Future<bool>` indicating the success or failure of the operation.
  /// Removes a message from the database and pi-hole server.
  Future<bool> removeMessage(String address, int id) async {
    final resp = await _apiGateway.removeMessage(id);
    if (resp.result == APiResponseType.error) {
      return false;
    }
    final respDeleteMsg = await _repository.deleteGravityMessage(address, id);
    if (respDeleteMsg.isError()) {
      return false;
    }
    return true;
  }

  /// Loads the gravity data from the database for a given address.
  ///
  /// This method retrieves gravity-related data from the repository and processes
  /// it into a structured format. The returned data includes:
  /// - A list of gravity messages, each represented as a `Message` object.
  /// - A list of gravity logs, sorted by their line numbers.
  /// - The current gravity update status, represented as a `GravityStatus` enum.
  /// - The start time of the gravity update, if available.
  /// - The completion time of the gravity update, if available.
  ///
  /// Returns a `Future` that resolves to a `Map<String, dynamic>` containing:
  /// - `'messages'`: A list of `Message` objects.
  /// - `'logs'`: A list of log messages as strings.
  /// - `'status'`: The current gravity update status (`GravityStatus`).
  /// - `'startedAt'`: The start time of the gravity update (`DateTime?`).
  /// - `'completedAt'`: The completion time of the gravity update (`DateTime?`).
  ///
  /// If the gravity data or its components are null, default values are used:
  /// - An empty list for messages and logs.
  /// - `GravityStatus.idle` for the status.
  Future<Map<String, dynamic>> loadGravityData(String address) async {
    final data = await _repository.fetchGravityData(address);
    final gravityData = data.getOrNull();

    final messages = gravityData?.gravityMessages?.map((data) {
          return Message(
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

  /// Cancels the gravity update subscription.
  void cancelUpdate() {
    _subscription?.cancel();
    _subscription = null;
  }
}

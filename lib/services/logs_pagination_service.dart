import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';

/// A service class responsible for paginated retrieval of log entries from an API.
///
/// [LogsPaginationService] abstracts the logic required to fetch logs in time-based
/// windows with support for pagination across API versions (v5 and v6).
///
/// It tracks the current time window and cursor, handles retries for transient failures,
/// and provides a clean interface to reset and iterate over log pages.
///
/// - Supports both cursor-based (v6) and time-range-based (v5) pagination strategies.
/// - Tracks whether loading has finished or failed using [LoadStatus].
/// - Offers a unified method [loadNextPage] to fetch the next page, delegating
///   to the appropriate API version implementation.
///
/// Typical usage:
/// ```dart
/// final service = LogsPaginationService(apiGateway: gateway);
/// service.reset(start, end);
/// final logs = await service.loadNextPage();
/// ```
///
/// This service is designed to be consumed by UI-layer helpers like `LogsScreenService`
/// or other pagination-aware widgets/controllers.
class LogsPaginationService {
  LogsPaginationService({
    required ApiGateway apiGateway,
    int pageSize = 500,
  })  : _apiGateway = apiGateway,
        _pageSize = pageSize;

  final ApiGateway _apiGateway;
  final int _pageSize;

  DateTime? _startTime;
  DateTime? _endTime;

  int? _currentCursor;
  LoadStatus _finished = LoadStatus.loading;

  LoadStatus get finished => _finished;
  DateTime? get startTime => _startTime;
  DateTime? get endTime => _endTime;

  /// Resets the pagination service with a new start and end time.
  ///
  /// Sets the internal `_startTime` and `_endTime` to the provided [start] and [until] values,
  /// and marks the pagination as not finished.
  ///
  /// [start] - The new start time for log pagination.
  /// [until] - The new end time for log pagination.
  void reset(DateTime start, DateTime until) {
    _startTime = start;
    _endTime = until;
    _finished = LoadStatus.loading;
    _currentCursor = null;
  }

  /// Loads the next page of logs based on the current pagination state.
  ///
  /// Returns a [Future] that completes with a list of [Log] objects.
  ///
  /// Throws an [ArgumentError] if either [_startTime] or [_endTime] is not set.
  /// If all available logs have already been loaded ([_finished] is true), returns an empty list.
  ///
  /// The method automatically selects the appropriate API version for loading logs.
  ///
  /// - For API version v6, it delegates to [_loadNextPageV6].
  /// - For other versions, it delegates to [_loadNextPageV5].
  Future<List<Log>> loadNextPage() async {
    if (_finished == LoadStatus.loaded) {
      logger.d('No more logs to load, pagination is finished. Please reset.');
      return [];
    }

    if (_startTime == null || _endTime == null) {
      throw ArgumentError(
        'Start time and end time must be set before loading logs.',
      );
    }

    if (_apiGateway.server.apiVersion == SupportedApiVersions.v6) {
      return _loadNextPageV6();
    } else {
      return _loadNextPageV5();
    }
  }

  /// Loads the next page of logs using API version 6.
  ///
  /// This method attempts to fetch the next set of logs from the API, handling pagination
  /// via a cursor and retrying once if the API call fails. It updates the internal cursor
  /// to the ID of the last log fetched, and marks the pagination as finished if there are
  /// no more logs to retrieve or if the maximum number of retries is exceeded.
  ///
  /// Returns a [Future] that completes with a [List] of [Log] objects. If no logs are found
  /// or the API call fails after the allowed retries, an empty list is returned.
  ///
  /// Logging is performed for API errors, retries, and when no logs are found.
  Future<List<Log>> _loadNextPageV6() async {
    const maxRetries = 1;
    var retryCount = 0;

    while (retryCount <= maxRetries) {
      final result = await _apiGateway.fetchLogs(
        _startTime!,
        _endTime!,
        size: _pageSize,
        cursor: _currentCursor != null ? _currentCursor! - 1 : null,
      );

      if (result.result != APiResponseType.success) {
        retryCount++;
        logger.w('API v6 error: ${result.result.name}, retry $retryCount');
        if (retryCount > maxRetries) {
          _finished = LoadStatus.error;
          logger.e('Failed to fetch logs after $maxRetries retries.');
          return [];
        }
        continue;
      }

      // Fetched all logs, no more logs to fetch
      if (result.data!.recordsFiltered == 0) {
        _finished = LoadStatus.loaded;
        logger.d('No logs found in the specified time range.');
        return [];
      }

      logger.d(
        'startTime: $_startTime, endTime: $_endTime, cursor: $_currentCursor, nums: ${result.data?.recordsFiltered}',
      );

      final logs = result.data?.logs ?? [];

      // Important: Expected desc order of logs, so the last log is the oldest one.
      _currentCursor = logs.last.id;

      _finished = LoadStatus.loading;
      return logs;
    }

    logger.e('Failed to load logs after $maxRetries retries.');
    _finished = LoadStatus.error;
    return [];
  }

  /// Loads the next page of logs using API version 5.
  ///
  /// This method attempts to fetch logs within the specified time range
  /// (`_startTime` to `_endTime`) and with a page size of `_pageSize`.
  /// If the API call fails, it will retry up to `maxRetries` times before
  /// marking the operation as finished and returning an empty list.
  ///
  /// Returns a [Future] that completes with a list of [Log] objects.
  /// If the fetch fails after all retries, an empty list is returned.
  Future<List<Log>> _loadNextPageV5() async {
    const maxRetries = 1;
    var retryCount = 0;

    while (retryCount <= maxRetries) {
      // If V5, we specify from and until to get all logs in the period
      final result = await _apiGateway.fetchLogs(
        _startTime!,
        _endTime!,
        size: _pageSize,
      );

      if (result.result != APiResponseType.success) {
        retryCount++;
        logger.w('API v5 error: ${result.result.name}, retry $retryCount');
        if (retryCount > maxRetries) {
          _finished = LoadStatus.error;
          logger.e('Failed to fetch logs after $maxRetries retries.');
          return [];
        }
        continue;
      }

      logger.d(
        'startTime: $_startTime, endTime: $_endTime, cursor: $_currentCursor, nums: ${result.data!.logs.length}',
      );

      _finished = LoadStatus.loaded;
      return result.data!.logs;
    }

    logger.e('Failed to load logs after $maxRetries retries.');
    _finished = LoadStatus.error;
    return [];
  }
}

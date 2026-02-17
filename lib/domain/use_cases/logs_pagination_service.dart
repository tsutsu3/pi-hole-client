import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/metrics_repository.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/utils/logger.dart';

/// A service class responsible for paginated retrieval of log entries.
///
/// [LogsPaginationService] abstracts the logic required to fetch logs in time-based
/// windows with support for offset-based pagination (DataTables style).
///
/// For V6, it uses a fixed cursor (snapshot anchor from the first response) and
/// an incrementing offset (`start`) to advance through pages.
/// For V5, all logs are returned in a single response (no pagination).
///
/// Typical usage:
/// ```dart
/// final service = LogsPaginationService(repository: metricsRepository);
/// service.reset(start, end);
/// final logs = await service.loadNextPage();
/// ```
class LogsPaginationService {
  LogsPaginationService({
    required MetricsRepository repository,
    int pageSize = 500,
  }) : _repository = repository,
       _pageSize = pageSize;

  final MetricsRepository _repository;
  final int _pageSize;

  DateTime? _startTime;
  DateTime? _endTime;

  /// Fixed cursor captured from the first API response (snapshot anchor).
  /// Reused across all subsequent pages within the same [reset] cycle.
  int? _fixedCursor;

  /// Current offset for pagination (0, 500, 1000, ...).
  int _currentOffset = 0;

  LoadStatus _finished = LoadStatus.loading;

  /// Current pagination status.
  ///
  /// - [LoadStatus.loading] — more pages available.
  /// - [LoadStatus.loaded]  — all pages consumed; call [reset] to start over.
  /// - [LoadStatus.error]   — last fetch failed after retries.
  LoadStatus get finished => _finished;

  /// The start of the current time window (set by [reset]).
  DateTime? get startTime => _startTime;

  /// The end of the current time window (set by [reset]).
  DateTime? get endTime => _endTime;

  /// Resets the pagination service with a new start and end time.
  void reset(DateTime start, DateTime until) {
    _startTime = start;
    _endTime = until;
    _finished = LoadStatus.loading;
    _fixedCursor = null;
    _currentOffset = 0;
  }

  /// Loads the next page of logs based on the current pagination state.
  ///
  /// Returns a list of [Log] objects. Returns an empty list when all logs
  /// have been loaded or if loading fails after retries.
  ///
  /// Throws an [ArgumentError] if start/end time is not set.
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

    const maxRetries = 1;
    var retryCount = 0;

    while (retryCount <= maxRetries) {
      final result = await _repository.fetchQueries(
        from: _startTime!,
        until: _endTime!,
        length: _pageSize,
        cursor: _fixedCursor,
        start: _currentOffset,
      );

      final logs = result.fold((success) => success, (failure) => null);

      if (logs == null) {
        retryCount++;
        logger.w('API error, retry $retryCount');
        if (retryCount > maxRetries) {
          _finished = LoadStatus.error;
          logger.e('Failed to fetch logs after $maxRetries retries.');
          return [];
        }
        continue;
      }

      // V5 returns all logs at once (no cursor), so mark as finished.
      if (logs.cursor == null) {
        _finished = LoadStatus.loaded;
        return logs.logs;
      }

      // Capture the cursor from the first response as a fixed snapshot anchor.
      _fixedCursor ??= logs.cursor;

      if (logs.recordsFiltered == 0 || logs.logs.isEmpty) {
        _finished = LoadStatus.loaded;
        logger.d('No logs found in the specified time range.');
        return [];
      }

      logger.d(
        'Fetched ${logs.logs.length} logs '
        '(startTime: $_startTime, endTime: $_endTime, '
        'lastId: ${logs.logs.last.id}, '
        'cursor: $_fixedCursor, '
        'offset: $_currentOffset, '
        'recordsFiltered: ${logs.recordsFiltered})',
      );

      // Advance offset for the next page.
      _currentOffset += logs.logs.length;

      // If fewer logs than page size were returned, this is the last page.
      if (logs.logs.length < _pageSize) {
        _finished = LoadStatus.loaded;
      }

      return logs.logs;
    }

    logger.e('Failed to load logs after $maxRetries retries.');
    _finished = LoadStatus.error;
    return [];
  }
}

import 'dart:async';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/log.dart';
import 'package:pi_hole_client/domain/use_cases/logs_pagination_service.dart';
import 'package:pi_hole_client/utils/logger.dart';

/// A service for fetching live log differences in a specific time window.
///
/// This service uses a [LogsPaginationService] to load logs
/// incrementally from the last known end time to the current time.
class LiveLogsService {
  LiveLogsService({
    required LogsPaginationService paginationService,
    required DateTime endTime,
  }) : _paginationService = paginationService,
       _lastEnd = endTime;

  final LogsPaginationService _paginationService;

  DateTime _lastEnd;

  bool _liveLoading = false;

  bool get isLoading => _liveLoading;

  DateTime? get lastEnd => _lastEnd;

  /// Fetches a new batch of live logs since the last tick.
  ///
  /// This method retrieves logs from the last recorded end time (`_lastEnd`) up to the current time.
  /// It uses a pagination service to load logs in pages until all available logs in the time window are collected.
  /// If a loading operation is already in progress, it returns an empty list immediately.
  ///
  /// Returns a [Future] that completes with a list of [Log] objects collected during this tick.
  /// If an error occurs during loading, it logs the error and returns an empty list.
  ///
  /// The method ensures that only one loading operation can run at a time using the `_liveLoading` flag.
  Future<List<Log>> tickOnce() async {
    logger.d('Ticking live logs');
    if (_liveLoading) return const [];

    _liveLoading = true;
    try {
      const maxPagesPerTick = 10;
      final end = DateTime.now();
      final start = _lastEnd;

      _paginationService.reset(start, end);

      final collected = <Log>[];
      for (var i = 0; i < maxPagesPerTick; i++) {
        final page = await _paginationService.loadNextPage();
        if (page.isEmpty) break;
        collected.addAll(page);
        if (_paginationService.finished != LoadStatus.loading) break;

        if (i == 9) {
          logger.w(
            'Live logs tick reached max page limit (10), there might be more logs.',
          );
        }
      }

      _lastEnd = end;
      logger.d('Live tick ${collected.length} logs, window: $start -> $end');
      return collected;
    } catch (e, s) {
      logger.e('Live tick error: $e\n$s');
      return const [];
    } finally {
      _liveLoading = false;
    }
  }
}

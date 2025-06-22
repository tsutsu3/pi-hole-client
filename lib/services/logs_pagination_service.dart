import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/log.dart';

class LogsPaginationService {
  LogsPaginationService({
    required ApiGateway apiGateway,
    required DateTime startTime,
    required DateTime endTime,
    required double logPeriodHours,
    int pageSize = 100,
  })  : _apiGateway = apiGateway,
        _startTime = startTime,
        _endTime = endTime,
        _logPeriodHours = logPeriodHours,
        _pageSize = pageSize {
    _currentFrom = _endTime;
  }

  final ApiGateway _apiGateway;
  final DateTime _startTime;
  final DateTime _endTime;
  final int _pageSize;
  final double _logPeriodHours;

  DateTime? _currentFrom;
  int? _currentCursor;
  bool _finished = false;

  bool get finished => _finished;
  DateTime get startTime => _startTime;
  DateTime get endTime => _endTime;

  Future<List<Log>> loadNextPage() async {
    if (_finished) return [];

    if (_apiGateway.server.apiVersion == SupportedApiVersions.v6) {
      return _loadNextPageV6();
    } else {
      return _loadNextPageV5();
    }
  }

  Future<List<Log>> _loadNextPageV6() async {
    final result = await _apiGateway.fetchLogs(
      _startTime,
      _endTime,
      size: _pageSize,
      cursor: _currentCursor != null ? _currentCursor! - 1 : null,
    );

    // Important: Expected asc order of logs, so the last log is the oldest one.
    if (result.data!.logs.isNotEmpty) {
      _currentCursor = result.data?.logs.last.id;
    }

    logger.d(
      'startTime: $_startTime, endTime: $_endTime, cursor: $_currentCursor',
    );

    if (result.result != APiResponseType.success) {
      _finished = true;
      logger.w(
        'Error while fetching logs: ${result.result.name}',
      );
      return [];
    }

    // All logs have been fetched
    final recordsFiltered = result.data?.recordsFiltered;
    if (recordsFiltered == null || recordsFiltered == 0) {
      logger.d('No logs found in the specified time range.');
      _finished = true;
      return [];
    }

    return result.data?.logs ?? [];
  }

  Future<List<Log>> _loadNextPageV5() async {
    if (_currentFrom == null) {
      _finished = true;
      logger.w('Current from date is null, cannot fetch logs.');
      return [];
    }

    final until = _currentFrom!;
    final from =
        until.subtract(Duration(minutes: (_logPeriodHours * 60).toInt()));
    final actualFrom = from.isBefore(_startTime) ? _startTime : from;

    logger.d('startTime: $actualFrom, endTime: $until');

    final result = await _apiGateway.fetchLogs(
      actualFrom,
      until,
      size: _pageSize,
    );

    if (result.result != APiResponseType.success) {
      _finished = true;
      logger.w(
        'Error while fetching logs: ${result.result.name}',
      );
      return [];
    }

    // All logs have been fetched
    if (result.data!.logs.isEmpty) {
      _finished = true;
      return [];
    }

    // Get the oldest log from the result
    final oldestLog = result.data!.logs.reduce(
      (a, b) => a.dateTime.isBefore(b.dateTime) ? a : b,
    );

    if (result.data!.logs.length < _pageSize) {
      // All logs have been fetched
      _finished = true;
    } else {
      // There are more logs to fetch within this time range,
      // so update currentFrom to continue fetching older logs.
      _currentFrom = oldestLog.dateTime;
    }

    return result.data!.logs;
  }
}

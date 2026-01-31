import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:result_dart/result_dart.dart';

class ActionsRepositoryV6 extends BaseV6SidRepository
    implements ActionsRepository {
  ActionsRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<Unit>> flushArp() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postActionFlushArp(sid);
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> flushLogs() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postActionFlushLogs(sid);
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Stream<Result<List<String>>> updateGravity() async* {
    final stream = await runWithRetry<Stream<Result<List<String>>>>(
      action: () async {
        final sid = await getSid();
        return Future.value(_client.postActionGravity(sid));
      },
      maxRetries: 1,
      delay: const Duration(milliseconds: 10),
      onRetry: (attempt, error, st) => clearSid(),
    );

    yield* stream;
  }

  @override
  Future<Result<Unit>> restartDns() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final sid = await getSid();
        final result = await _client.postActionRestartDns(sid);
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }
}

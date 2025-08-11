import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
import 'package:result_dart/result_dart.dart';

class ActionsRepositoryV6 implements ActionsRepository {
  ActionsRepositoryV6({
    required String sid,
    required PiholeV6ApiClient client,
  })  : _sid = sid,
        _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<Unit>> flushArp() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result = await _client.postActionFlushArp(_sid);
        if (result.isSuccess()) {
          return Success.unit();
        }

        return Failure(result.exceptionOrNull()!);
      },
    );
  }

  @override
  Future<Result<Unit>> flushLogs() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result = await _client.postActionFlushLogs(_sid);
        if (result.isSuccess()) {
          return Success.unit();
        }

        return Failure(result.exceptionOrNull()!);
      },
    );
  }

  @override
  Stream<Result<List<String>>> updateGravity() async* {
    final stream = await runWithRetry<Stream<Result<List<String>>>>(
      action: () => Future.value(_client.postActionGravity(_sid)),
    );

    yield* stream;
  }

  @override
  Future<Result<Unit>> restartDns() async {
    return runWithResultRetry<Unit>(
      action: () async {
        final result = await _client.postActionRestartDns(_sid);
        if (result.isSuccess()) {
          return Success.unit();
        }

        return Failure(result.exceptionOrNull()!);
      },
    );
  }
}

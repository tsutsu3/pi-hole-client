import 'package:pi_hole_client/data/repositories/api/interfaces/actions_respository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:result_dart/result_dart.dart';

class ActionsRepositoryV5 extends BaseV5TokenRepository
    implements ActionsRepository {
  ActionsRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) {
    // "Use" the parameters to suppress Lint
    client.hashCode;
  }

  @override
  Future<Result<Unit>> flushArp() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> flushLogs() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Stream<Result<List<String>>> updateGravity() async* {
    yield* Stream.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> restartDns() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}

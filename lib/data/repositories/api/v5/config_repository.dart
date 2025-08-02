import 'package:pi_hole_client/data/repositories/api/interfaces/config_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/config.dart';
import 'package:result_dart/result_dart.dart';

class ConfigRepositoryV5 implements ConfigRepository {
  ConfigRepositoryV5({
    required String sid,
    required PiholeV5ApiClient client,
  }) {
    // "Use" the parameters to suppress Lint
    sid.hashCode;
    client.hashCode;
  }

  @override
  Future<Result<Config>> fetchDnsQueryLogging() async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Config>> setDnsQueryLogging(bool status) async {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }
}

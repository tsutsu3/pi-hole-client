import 'package:pi_hole_client/data/mapper/v5/ftl_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/model/ftl/client.dart';
import 'package:pi_hole_client/domain/model/ftl/ftl.dart';
import 'package:pi_hole_client/domain/model/ftl/host.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';
import 'package:pi_hole_client/domain/model/ftl/metrics.dart';
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart';
import 'package:pi_hole_client/domain/model/ftl/sensor.dart';
import 'package:pi_hole_client/domain/model/ftl/system.dart';
import 'package:pi_hole_client/domain/model/ftl/version.dart';
import 'package:result_dart/result_dart.dart';

class FtlRepositoryV5 extends BaseV5TokenRepository implements FtlRepository {
  FtlRepositoryV5({
    required PiholeV5ApiClient client,
    required super.creds,
    super.token,
  }) : _client = client;

  final PiholeV5ApiClient _client;

  @override
  Future<Result<InfoClient>> getInfoClient() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<InfoFtl>> getInfoFtl() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<InfoHost>> getInfoHost() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<List<InfoMessage>>> getInfoMessages() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<Unit>> deleteInfoMessage(int messageId) {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<InfoDnsMetrics>> getInfoMetrics() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<InfoSensor>> getInfoSensors() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<InfoSystem>> getInfoSystem() {
    return Future.value(
      Failure(NotSupportedException(kNotSupportedInV5Message)),
    );
  }

  @override
  Future<Result<InfoVersion>> getInfoVersion() {
    return runWithResultRetry(
      action: () async {
        final token = await getToken();
        final result = await _client.getVersions(token);
        return result.map((v) => v.toDomain());
      },
      onRetry: (_) => clearToken(),
    );
  }

  @override
  Future<Result<InfoPiholeServer>> fetchAllServerInfo() {
    return runWithResultRetry(
      action: () async {
        final token = await getToken();
        final result = await _client.getVersions(token);
        return result.map((v) => InfoPiholeServer(version: v.toDomain()));
      },
      onRetry: (_) => clearToken(),
    );
  }
}

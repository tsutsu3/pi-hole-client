import 'package:pi_hole_client/data/mapper/v5/ftl_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/repositories/utils/constants.dart';
import 'package:pi_hole_client/data/repositories/utils/exceptions.dart';
import 'package:pi_hole_client/data/services/api/pihole_v5_api_client.dart';
import 'package:pi_hole_client/domain/models/ftl/client.dart';
import 'package:pi_hole_client/domain/models/ftl/ftl.dart';
import 'package:pi_hole_client/domain/models/ftl/host.dart';
import 'package:pi_hole_client/domain/models/ftl/message.dart';
import 'package:pi_hole_client/domain/models/ftl/metrics.dart';
import 'package:pi_hole_client/domain/models/ftl/pihole_server.dart';
import 'package:pi_hole_client/domain/models/ftl/sensor.dart';
import 'package:pi_hole_client/domain/models/ftl/system.dart';
import 'package:pi_hole_client/domain/models/ftl/version.dart';
import 'package:result_dart/result_dart.dart';

class FtlRepositoryV5 implements FtlRepository {
  FtlRepositoryV5({
    required String token,
    required PiholeV5ApiClient client,
  })  : _token = token,
        _client = client;

  final String _token;
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
  Future<Result<Unit>> deleteInfoMessages(int messageId) {
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
    return runWithResultRetry(action: () async {
      final result = await _client.getVersions(_token);
      return Success(result.getOrThrow().toDomain());
    });
  }

  @override
  Future<Result<InfoPiholeServer>> fetchAllServerInfo() {
    return runWithResultRetry(action: () async {
      final result = await _client.getVersions(_token);
      return Success(InfoPiholeServer(version: result.getOrThrow().toDomain()));
    });
  }
}

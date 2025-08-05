import 'package:pi_hole_client/data/mapper/v6/ftl_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
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

class FtlRepositoryV6 implements FtlRepository {
  FtlRepositoryV6({required String sid, required PiholeV6ApiClient client})
    : _sid = sid,
      _client = client;

  final String _sid;
  final PiholeV6ApiClient _client;

  @override
  Future<Result<InfoClient>> getInfoClient() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoClient(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<InfoFtl>> getInfoFtl() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoFtl(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<InfoHost>> getInfoHost() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoHost(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<List<InfoMessage>>> getInfoMessages() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoMessages(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<Unit>> deleteInfoMessage(int messageId) {
    return runWithResultRetry(
      action: () async {
        final result = await _client.deleteInfoMessages(
          _sid,
          messageId: messageId,
        );
        return result.map((_) => unit);
      },
    );
  }

  @override
  Future<Result<InfoDnsMetrics>> getInfoMetrics() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoMetrics(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<InfoSensor>> getInfoSensors() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoSensors(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<InfoSystem>> getInfoSystem() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoSystem(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<InfoVersion>> getInfoVersion() {
    return runWithResultRetry(
      action: () async {
        final result = await _client.getInfoVersion(_sid);
        return Success(result.getOrThrow().toDomain());
      },
    );
  }

  @override
  Future<Result<InfoPiholeServer>> fetchAllServerInfo() {
    return runWithResultRetry(
      action: () async {
        final result = await Future.wait([
          getInfoHost(),
          getInfoSensors(),
          getInfoSystem(),
          getInfoVersion(),
        ]);

        return Success(
          InfoPiholeServer(
            host: (result[0] as Result<InfoHost>).getOrThrow(),
            sensor: (result[1] as Result<InfoSensor>).getOrThrow(),
            system: (result[2] as Result<InfoSystem>).getOrThrow(),
            version: (result[3] as Result<InfoVersion>).getOrThrow(),
          ),
        );
      },
    );
  }
}

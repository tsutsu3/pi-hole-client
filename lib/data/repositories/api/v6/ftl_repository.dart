import 'package:pi_hole_client/data/mapper/v6/ftl_mapper.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/v6/base_v6_sid_repository.dart';
import 'package:pi_hole_client/data/repositories/utils/call_with_retry.dart';
import 'package:pi_hole_client/data/services/api/pihole_v6_api_client.dart';
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

class FtlRepositoryV6 extends BaseV6SidRepository implements FtlRepository {
  FtlRepositoryV6({
    required PiholeV6ApiClient client,
    required super.creds,
    super.sid,
  }) : _client = client;

  final PiholeV6ApiClient _client;

  @override
  Future<Result<InfoClient>> fetchInfoClient() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoClient(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoFtl>> fetchInfoFtl() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoFtl(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoHost>> fetchInfoHost() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoHost(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<List<InfoMessage>>> fetchInfoMessages() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoMessages(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<Unit>> deleteInfoMessage(int messageId) {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.deleteInfoMessages(
          sid,
          messageId: messageId,
        );
        return result.map((_) => unit);
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoDnsMetrics>> fetchInfoMetrics() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoMetrics(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoSensor>> fetchInfoSensors() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoSensors(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoSystem>> fetchInfoSystem() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoSystem(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoVersion>> fetchInfoVersion() {
    return runWithResultRetry(
      action: () async {
        final sid = await getSid();
        final result = await _client.getInfoVersion(sid);
        return result.map((e) => e.toDomain());
      },
      onRetry: (_) => clearSid(),
    );
  }

  @override
  Future<Result<InfoPiholeServer>> fetchAllServerInfo() {
    return runWithResultRetry(
      action: () async {
        final result = await Future.wait([
          fetchInfoHost(),
          fetchInfoSensors(),
          fetchInfoSystem(),
          fetchInfoVersion(),
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
      onRetry: (_) => clearSid(),
    );
  }
}

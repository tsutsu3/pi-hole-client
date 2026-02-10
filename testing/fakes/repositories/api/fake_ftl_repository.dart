import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
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

import '../../../models/v6/ftl.dart';

class FakeFtlRepository implements FtlRepository {
  bool shouldFail = false;

  @override
  Future<Result<FtlClient>> fetchInfoClient() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoClient failure'));
    }
    return const Success(kRepoFetchFtlClient);
  }

  @override
  Future<Result<FtlInfo>> fetchInfoFtl() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoFtl failure'));
    }
    return const Success(kRepoFetchFtlInfo);
  }

  @override
  Future<Result<FtlHost>> fetchInfoHost() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoHost failure'));
    }
    return const Success(kRepoFetchFtlHost);
  }

  @override
  Future<Result<List<FtlMessage>>> fetchInfoMessages() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoMessages failure'));
    }
    return Success(kRepoFetchFtlMessages);
  }

  @override
  Future<Result<Unit>> deleteInfoMessage(int messageId) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteInfoMessage failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<FtlDnsMetrics>> fetchInfoMetrics() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoMetrics failure'));
    }
    return const Success(kRepoFetchFtlMetrics);
  }

  @override
  Future<Result<FtlSensor>> fetchInfoSensors() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoSensors failure'));
    }
    return const Success(kRepoFetchFtlSensors);
  }

  @override
  Future<Result<FtlSystem>> fetchInfoSystem() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoSystem failure'));
    }
    return const Success(kRepoFetchFtlSystem);
  }

  @override
  Future<Result<FtlVersion>> fetchInfoVersion() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoVersion failure'));
    }
    return const Success(kRepoFetchFtlVersion);
  }

  @override
  Future<Result<PiholeServer>> fetchAllServerInfo() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchAllServerInfo failure'));
    }
    return const Success(kRepoFetchAllServerInfo);
  }
}

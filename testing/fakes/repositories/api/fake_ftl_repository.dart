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
  Future<Result<InfoClient>> fetchInfoClient() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoClient failure'));
    }
    return const Success(kRepoFetchInfoClient);
  }

  @override
  Future<Result<InfoFtl>> fetchInfoFtl() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoFtl failure'));
    }
    return const Success(kRepoFetchInfoFtl);
  }

  @override
  Future<Result<InfoHost>> fetchInfoHost() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoHost failure'));
    }
    return const Success(kRepoFetchInfoHost);
  }

  @override
  Future<Result<List<InfoMessage>>> fetchInfoMessages() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoMessages failure'));
    }
    return Success(kRepoFetchInfoMessages);
  }

  @override
  Future<Result<Unit>> deleteInfoMessage(int messageId) async {
    if (shouldFail) {
      return Failure(Exception('Force deleteInfoMessage failure'));
    }
    return const Success(unit);
  }

  @override
  Future<Result<InfoDnsMetrics>> fetchInfoMetrics() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoMetrics failure'));
    }
    return const Success(kRepoFetchInfoMetrics);
  }

  @override
  Future<Result<InfoSensor>> fetchInfoSensors() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoSensors failure'));
    }
    return const Success(kRepoFetchInfoSensors);
  }

  @override
  Future<Result<InfoSystem>> fetchInfoSystem() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoSystem failure'));
    }
    return const Success(kRepoFetchInfoSystem);
  }

  @override
  Future<Result<InfoVersion>> fetchInfoVersion() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchInfoVersion failure'));
    }
    return const Success(kRepoFetchInfoVersion);
  }

  @override
  Future<Result<InfoPiholeServer>> fetchAllServerInfo() async {
    if (shouldFail) {
      return Failure(Exception('Force fetchAllServerInfo failure'));
    }
    return const Success(kRepoFetchAllServerInfo);
  }
}

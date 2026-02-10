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

abstract interface class FtlRepository {
  Future<Result<FtlClient>> fetchInfoClient();

  Future<Result<FtlInfo>> fetchInfoFtl();

  Future<Result<FtlHost>> fetchInfoHost();

  Future<Result<List<FtlMessage>>> fetchInfoMessages();

  Future<Result<Unit>> deleteInfoMessage(int messageId);

  Future<Result<FtlDnsMetrics>> fetchInfoMetrics();

  Future<Result<FtlSensor>> fetchInfoSensors();

  Future<Result<FtlSystem>> fetchInfoSystem();

  Future<Result<FtlVersion>> fetchInfoVersion();

  Future<Result<PiholeServer>> fetchAllServerInfo();
}

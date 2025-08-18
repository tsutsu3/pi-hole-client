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
  Future<Result<InfoClient>> fetchInfoClient();

  Future<Result<InfoFtl>> fetchInfoFtl();

  Future<Result<InfoHost>> fetchInfoHost();

  Future<Result<List<InfoMessage>>> fetchInfoMessages();

  Future<Result<Unit>> deleteInfoMessage(int messageId);

  Future<Result<InfoDnsMetrics>> fetchInfoMetrics();

  Future<Result<InfoSensor>> fetchInfoSensors();

  Future<Result<InfoSystem>> fetchInfoSystem();

  Future<Result<InfoVersion>> fetchInfoVersion();

  Future<Result<InfoPiholeServer>> fetchAllServerInfo();
}

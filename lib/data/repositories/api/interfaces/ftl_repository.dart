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
  Future<Result<InfoClient>> getInfoClient();

  Future<Result<InfoFtl>> getInfoFtl();

  Future<Result<InfoHost>> getInfoHost();

  Future<Result<List<InfoMessage>>> getInfoMessages();

  Future<Result<Unit>> deleteInfoMessage(int messageId);

  Future<Result<InfoDnsMetrics>> getInfoMetrics();

  Future<Result<InfoSensor>> getInfoSensors();

  Future<Result<InfoSystem>> getInfoSystem();

  Future<Result<InfoVersion>> getInfoVersion();

  Future<Result<InfoPiholeServer>> fetchAllServerInfo();
}

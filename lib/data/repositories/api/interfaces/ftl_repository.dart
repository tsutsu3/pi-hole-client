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

abstract interface class FtlRepository {
  Future<Result<InfoClient>> getInfoClient();

  Future<Result<InfoFtl>> getInfoFtl();

  Future<Result<InfoHost>> getInfoHost();

  Future<Result<List<InfoMessage>>> getInfoMessages();

  Future<Result<Unit>> deleteInfoMessages(int messageId);

  Future<Result<InfoDnsMetrics>> getInfoMetrics();

  Future<Result<InfoSensor>> getInfoSensors();

  Future<Result<InfoSystem>> getInfoSystem();

  Future<Result<InfoVersion>> getInfoVersion();

  Future<InfoPiholeServer> fetchAllServerInfo();
}

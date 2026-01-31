import 'package:pi_hole_client/data/model/v6/config/config.dart';

class ConfigInfo {
  ConfigInfo({
    this.dns,
    this.dhcp,
    this.ntp,
    this.resolver,
    this.database,
    this.webserver,
    this.files,
    this.misc,
    this.debug,
  });

  factory ConfigInfo.fromV6(Config config) {
    return ConfigInfo(
      dns: config.config?.dns,
      dhcp: config.config?.dhcp,
      ntp: config.config?.ntp,
      resolver: config.config?.resolver,
      database: config.config?.database,
      webserver: config.config?.webserver,
      files: config.config?.files,
      misc: config.config?.misc,
      debug: config.config?.debug,
    );
  }

  final Dns? dns;
  final Dhcp? dhcp;
  final Ntp? ntp;
  final Resolver? resolver;
  final Database? database;
  final Webserver? webserver;
  final Files? files;
  final Misc? misc;
  final Debug? debug;

  Map<String, dynamic> toJson() {
    return {
      'dns': dns?.toJson(),
      'dhcp': dhcp?.toJson(),
      'ntp': ntp?.toJson(),
      'resolver': resolver?.toJson(),
      'database': database?.toJson(),
      'webserver': webserver?.toJson(),
      'files': files?.toJson(),
      'misc': misc?.toJson(),
      'debug': debug?.toJson(),
    };
  }
}

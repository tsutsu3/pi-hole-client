import 'package:sqflite/sqflite.dart';

class PiHoleClientData {
  final List<ServerDbData>? servers;
  final AppDbData appConfig;
  final Database dbInstance;

  PiHoleClientData({
    required this.servers,
    required this.appConfig,
    required this.dbInstance,
  });

  toDict() {
    return {
      "servers": servers,
      "appConfig": appConfig,
      "dbInstance": dbInstance,
    };
  }
}

class ServerDbData {
  final String address;
  final String alias;
  final String? token;
  final int isDefaultServer;
  final String? apiVersion;
  final String? basicAuthUser;
  final String? basicAuthPassword;

  ServerDbData({
    required this.address,
    required this.alias,
    required this.token,
    required this.isDefaultServer,
    required this.apiVersion,
    required this.basicAuthUser,
    required this.basicAuthPassword,
  });

  factory ServerDbData.fromMap(Map<String, Object?> map) {
    return ServerDbData(
      address: map['address'] as String,
      alias: map['alias'] as String,
      token: map['token'] as String?,
      isDefaultServer: map['isDefaultServer'] as int,
      apiVersion: map['apiVersion'] as String?,
      basicAuthUser: map['basicAuthUser'] as String?,
      basicAuthPassword: map['basicAuthPassword'] as String?,
    );
  }

  toDict() {
    return {
      "address": address,
      "alias": alias,
      "token": token,
      "isDefaultServer": isDefaultServer,
      "apiVersion": apiVersion,
      "basicAuthUser": basicAuthUser,
      "basicAuthPassword": basicAuthPassword,
    };
  }
}

class AppDbData {
  final int autoRefreshTime;
  final int theme;
  final String language;
  final int overrideSslCheck;
  final int oneColumnLegend;
  final int reducedDataCharts;
  final int logsPerQuery;
  final String? passCode;
  final int useBiometricAuth;
  final int importantInfoReaden;
  final int hideZeroValues;
  final int statisticsVisualizationMode;

  AppDbData({
    required this.autoRefreshTime,
    required this.theme,
    required this.language,
    required this.overrideSslCheck,
    required this.oneColumnLegend,
    required this.reducedDataCharts,
    required this.logsPerQuery,
    required this.passCode,
    required this.useBiometricAuth,
    required this.importantInfoReaden,
    required this.hideZeroValues,
    required this.statisticsVisualizationMode,
  });

  factory AppDbData.fromMap(Map<String, Object?> map) {
    return AppDbData(
      autoRefreshTime: map['autoRefreshTime'] as int,
      theme: map['theme'] as int,
      language: map['language'] as String,
      overrideSslCheck: map['overrideSslCheck'] as int,
      oneColumnLegend: map['oneColumnLegend'] as int,
      reducedDataCharts: map['reducedDataCharts'] as int,
      logsPerQuery: map['logsPerQuery'] as int,
      passCode: map['passCode'] as String?,
      useBiometricAuth: map['useBiometricAuth'] as int,
      importantInfoReaden: map['importantInfoReaden'] as int,
      hideZeroValues: map['hideZeroValues'] as int,
      statisticsVisualizationMode: map['statisticsVisualizationMode'] as int,
    );
  }

  toDict() {
    return {
      "autoRefreshTime": autoRefreshTime,
      "theme": theme,
      "language": language,
      "overrideSslCheck": overrideSslCheck,
      "oneColumnLegend": oneColumnLegend,
      "reducedDataCharts": reducedDataCharts,
      "logsPerQuery": logsPerQuery,
      "passCode": passCode,
      "useBiometricAuth": useBiometricAuth,
      "importantInfoReaden": importantInfoReaden,
      "hideZeroValues": hideZeroValues,
      "statisticsVisualizationMode": statisticsVisualizationMode,
    };
  }
}

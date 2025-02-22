import 'package:sqflite/sqflite.dart';

class PiHoleClientData {
  PiHoleClientData({
    required this.servers,
    required this.appConfig,
    required this.dbInstance,
  });

  final List<ServerDbData>? servers;
  final AppDbData appConfig;
  final Database dbInstance;

  Map<String, dynamic> toDict() {
    return {
      'servers': servers,
      'appConfig': appConfig,
      'dbInstance': dbInstance,
    };
  }
}

class ServerDbData {
  ServerDbData({
    required this.address,
    required this.alias,
    required this.token,
    required this.isDefaultServer,
    required this.apiVersion,
    required this.sid,
  });

  factory ServerDbData.withSecrets(
    ServerDbData instance,
    String? token,
    String? sid,
  ) {
    return ServerDbData(
      address: instance.address,
      alias: instance.alias,
      token: token,
      isDefaultServer: instance.isDefaultServer,
      apiVersion: instance.apiVersion,
      sid: sid,
    );
  }

  factory ServerDbData.fromMap(Map<String, Object?> map) {
    return ServerDbData(
      address: map['address']! as String,
      alias: map['alias']! as String,
      token: map['token'] as String?,
      isDefaultServer: map['isDefaultServer']! as int,
      apiVersion: map['apiVersion']! as String,
      sid: map['sid'] as String?,
    );
  }

  final String address;
  final String alias;
  final String? token;
  final int isDefaultServer;
  final String apiVersion;
  final String? sid;

  Map<String, dynamic> toDict() {
    return {
      'address': address,
      'alias': alias,
      'token': token,
      'isDefaultServer': isDefaultServer,
      'apiVersion': apiVersion,
      'sid': sid,
    };
  }
}

class AppDbData {
  AppDbData({
    required this.autoRefreshTime,
    required this.theme,
    required this.language,
    required this.overrideSslCheck,
    required this.reducedDataCharts,
    required this.logsPerQuery,
    required this.passCode,
    required this.useBiometricAuth,
    required this.importantInfoReaden,
    required this.hideZeroValues,
    required this.statisticsVisualizationMode,
    required this.sendCrashReports,
  });

  factory AppDbData.fromMap(Map<String, Object?> map) {
    return AppDbData(
      autoRefreshTime: map['autoRefreshTime']! as int,
      theme: map['theme']! as int,
      language: map['language']! as String,
      overrideSslCheck: map['overrideSslCheck']! as int,
      reducedDataCharts: map['reducedDataCharts']! as int,
      logsPerQuery: map['logsPerQuery']! as int,
      passCode: map['passCode'] as String?,
      useBiometricAuth: map['useBiometricAuth']! as int,
      importantInfoReaden: map['importantInfoReaden']! as int,
      hideZeroValues: map['hideZeroValues']! as int,
      statisticsVisualizationMode: map['statisticsVisualizationMode']! as int,
      sendCrashReports: map['sendCrashReports']! as int,
    );
  }

  factory AppDbData.withSecrets(
    AppDbData instance,
    String? passCode,
  ) {
    return AppDbData(
      autoRefreshTime: instance.autoRefreshTime,
      theme: instance.theme,
      language: instance.language,
      overrideSslCheck: instance.overrideSslCheck,
      reducedDataCharts: instance.reducedDataCharts,
      logsPerQuery: instance.logsPerQuery,
      passCode: passCode,
      useBiometricAuth: instance.useBiometricAuth,
      importantInfoReaden: instance.importantInfoReaden,
      hideZeroValues: instance.hideZeroValues,
      statisticsVisualizationMode: instance.statisticsVisualizationMode,
      sendCrashReports: instance.sendCrashReports,
    );
  }

  final int autoRefreshTime;
  final int theme;
  final String language;
  final int overrideSslCheck;
  final int reducedDataCharts;
  final int logsPerQuery;
  final String? passCode;
  final int useBiometricAuth;
  final int importantInfoReaden;
  final int hideZeroValues;
  final int statisticsVisualizationMode;
  final int sendCrashReports;

  Map<String, dynamic> toDict() {
    return {
      'autoRefreshTime': autoRefreshTime,
      'theme': theme,
      'language': language,
      'overrideSslCheck': overrideSslCheck,
      'reducedDataCharts': reducedDataCharts,
      'logsPerQuery': logsPerQuery,
      'passCode': passCode,
      'useBiometricAuth': useBiometricAuth,
      'importantInfoReaden': importantInfoReaden,
      'hideZeroValues': hideZeroValues,
      'statisticsVisualizationMode': statisticsVisualizationMode,
      'sendCrashReports': sendCrashReports,
    };
  }
}

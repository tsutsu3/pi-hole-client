// Mocks generated by Mockito 5.4.5 from annotations
// in pi_hole_client/test/widgets/logs/logs_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i12;
import 'dart:ui' as _i14;

import 'package:device_info_plus/device_info_plus.dart' as _i11;
import 'package:flutter/material.dart' as _i7;
import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:mockito/src/dummies.dart' as _i8;
import 'package:package_info_plus/package_info_plus.dart' as _i10;
import 'package:pi_hole_client/config/theme.dart' as _i2;
import 'package:pi_hole_client/gateways/api_gateway_interface.dart' as _i19;
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart' as _i20;
import 'package:pi_hole_client/models/app_log.dart' as _i9;
import 'package:pi_hole_client/models/domain.dart' as _i21;
import 'package:pi_hole_client/models/gateways.dart' as _i5;
import 'package:pi_hole_client/models/query_status.dart' as _i18;
import 'package:pi_hole_client/models/repository/database.dart' as _i13;
import 'package:pi_hole_client/models/server.dart' as _i3;
import 'package:pi_hole_client/providers/app_config_provider.dart' as _i6;
import 'package:pi_hole_client/providers/filters_provider.dart' as _i15;
import 'package:pi_hole_client/providers/servers_provider.dart' as _i17;
import 'package:pi_hole_client/screens/logs/logs_filters_modal.dart' as _i16;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: must_be_immutable
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeAppColors_0 extends _i1.SmartFake implements _i2.AppColors {
  _FakeAppColors_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeServer_1 extends _i1.SmartFake implements _i3.Server {
  _FakeServer_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_2 extends _i1.SmartFake implements _i4.Response {
  _FakeResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginQueryResponse_3 extends _i1.SmartFake
    implements _i5.LoginQueryResponse {
  _FakeLoginQueryResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRealtimeStatusResponse_4 extends _i1.SmartFake
    implements _i5.RealtimeStatusResponse {
  _FakeRealtimeStatusResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDisableServerResponse_5 extends _i1.SmartFake
    implements _i5.DisableServerResponse {
  _FakeDisableServerResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEnableServerResponse_6 extends _i1.SmartFake
    implements _i5.EnableServerResponse {
  _FakeEnableServerResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchOverTimeDataResponse_7 extends _i1.SmartFake
    implements _i5.FetchOverTimeDataResponse {
  _FakeFetchOverTimeDataResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchLogsResponse_8 extends _i1.SmartFake
    implements _i5.FetchLogsResponse {
  _FakeFetchLogsResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSetWhiteBlacklistResponse_9 extends _i1.SmartFake
    implements _i5.SetWhiteBlacklistResponse {
  _FakeSetWhiteBlacklistResponse_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetDomainLists_10 extends _i1.SmartFake
    implements _i5.GetDomainLists {
  _FakeGetDomainLists_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveDomainFromListResponse_11 extends _i1.SmartFake
    implements _i5.RemoveDomainFromListResponse {
  _FakeRemoveDomainFromListResponse_11(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddDomainToListResponse_12 extends _i1.SmartFake
    implements _i5.AddDomainToListResponse {
  _FakeAddDomainToListResponse_12(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [AppConfigProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockAppConfigProvider extends _i1.Mock implements _i6.AppConfigProvider {
  MockAppConfigProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AppColors get colors => (super.noSuchMethod(
        Invocation.getter(#colors),
        returnValue: _FakeAppColors_0(
          this,
          Invocation.getter(#colors),
        ),
      ) as _i2.AppColors);

  @override
  bool get showingSnackbar => (super.noSuchMethod(
        Invocation.getter(#showingSnackbar),
        returnValue: false,
      ) as bool);

  @override
  int get selectedTab => (super.noSuchMethod(
        Invocation.getter(#selectedTab),
        returnValue: 0,
      ) as int);

  @override
  _i7.ThemeMode get selectedTheme => (super.noSuchMethod(
        Invocation.getter(#selectedTheme),
        returnValue: _i7.ThemeMode.system,
      ) as _i7.ThemeMode);

  @override
  String get selectedLanguage => (super.noSuchMethod(
        Invocation.getter(#selectedLanguage),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#selectedLanguage),
        ),
      ) as String);

  @override
  int get selectedThemeNumber => (super.noSuchMethod(
        Invocation.getter(#selectedThemeNumber),
        returnValue: 0,
      ) as int);

  @override
  int get selectedLanguageNumber => (super.noSuchMethod(
        Invocation.getter(#selectedLanguageNumber),
        returnValue: 0,
      ) as int);

  @override
  bool get overrideSslCheck => (super.noSuchMethod(
        Invocation.getter(#overrideSslCheck),
        returnValue: false,
      ) as bool);

  @override
  bool get oneColumnLegend => (super.noSuchMethod(
        Invocation.getter(#oneColumnLegend),
        returnValue: false,
      ) as bool);

  @override
  bool get reducedDataCharts => (super.noSuchMethod(
        Invocation.getter(#reducedDataCharts),
        returnValue: false,
      ) as bool);

  @override
  double get logsPerQuery => (super.noSuchMethod(
        Invocation.getter(#logsPerQuery),
        returnValue: 0.0,
      ) as double);

  @override
  bool get biometricsSupport => (super.noSuchMethod(
        Invocation.getter(#biometricsSupport),
        returnValue: false,
      ) as bool);

  @override
  bool get useBiometrics => (super.noSuchMethod(
        Invocation.getter(#useBiometrics),
        returnValue: false,
      ) as bool);

  @override
  bool get appUnlocked => (super.noSuchMethod(
        Invocation.getter(#appUnlocked),
        returnValue: false,
      ) as bool);

  @override
  bool get validVibrator => (super.noSuchMethod(
        Invocation.getter(#validVibrator),
        returnValue: false,
      ) as bool);

  @override
  bool get importantInfoReaden => (super.noSuchMethod(
        Invocation.getter(#importantInfoReaden),
        returnValue: false,
      ) as bool);

  @override
  bool get hideZeroValues => (super.noSuchMethod(
        Invocation.getter(#hideZeroValues),
        returnValue: false,
      ) as bool);

  @override
  int get statisticsVisualizationMode => (super.noSuchMethod(
        Invocation.getter(#statisticsVisualizationMode),
        returnValue: 0,
      ) as int);

  @override
  bool get sendCrashReports => (super.noSuchMethod(
        Invocation.getter(#sendCrashReports),
        returnValue: false,
      ) as bool);

  @override
  List<_i9.AppLog> get logs => (super.noSuchMethod(
        Invocation.getter(#logs),
        returnValue: <_i9.AppLog>[],
      ) as List<_i9.AppLog>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void setShowingSnackbar(bool? status) => super.noSuchMethod(
        Invocation.method(
          #setShowingSnackbar,
          [status],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setSelectedTab(int? selectedTab) => super.noSuchMethod(
        Invocation.method(
          #setSelectedTab,
          [selectedTab],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setAppInfo(_i10.PackageInfo? appInfo) => super.noSuchMethod(
        Invocation.method(
          #setAppInfo,
          [appInfo],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setAndroidInfo(_i11.AndroidDeviceInfo? deviceInfo) => super.noSuchMethod(
        Invocation.method(
          #setAndroidInfo,
          [deviceInfo],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setIosInfo(_i11.IosDeviceInfo? deviceInfo) => super.noSuchMethod(
        Invocation.method(
          #setIosInfo,
          [deviceInfo],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setBiometricsSupport(bool? isSupported) => super.noSuchMethod(
        Invocation.method(
          #setBiometricsSupport,
          [isSupported],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setAppUnlocked(bool? status) => super.noSuchMethod(
        Invocation.method(
          #setAppUnlocked,
          [status],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setValidVibrator(bool? valid) => super.noSuchMethod(
        Invocation.method(
          #setValidVibrator,
          [valid],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addLog(_i9.AppLog? log) => super.noSuchMethod(
        Invocation.method(
          #addLog,
          [log],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setSelectedSettingsScreen({
    required int? screen,
    bool? notify,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setSelectedSettingsScreen,
          [],
          {
            #screen: screen,
            #notify: notify,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i12.Future<bool> setUseBiometrics(bool? biometrics) => (super.noSuchMethod(
        Invocation.method(
          #setUseBiometrics,
          [biometrics],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setImportantInfoReaden(bool? status) => (super.noSuchMethod(
        Invocation.method(
          #setImportantInfoReaden,
          [status],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setPassCode(String? code) => (super.noSuchMethod(
        Invocation.method(
          #setPassCode,
          [code],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setAutoRefreshTime(int? seconds) => (super.noSuchMethod(
        Invocation.method(
          #setAutoRefreshTime,
          [seconds],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setLogsPerQuery(double? time) => (super.noSuchMethod(
        Invocation.method(
          #setLogsPerQuery,
          [time],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setSendCrashReports(bool? status) => (super.noSuchMethod(
        Invocation.method(
          #setSendCrashReports,
          [status],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  void saveFromDb(_i13.AppDbData? dbData) => super.noSuchMethod(
        Invocation.method(
          #saveFromDb,
          [dbData],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i12.Future<bool> setOverrideSslCheck(bool? status) => (super.noSuchMethod(
        Invocation.method(
          #setOverrideSslCheck,
          [status],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setOneColumnLegend(bool? status) => (super.noSuchMethod(
        Invocation.method(
          #setOneColumnLegend,
          [status],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setReducedDataCharts(bool? status) => (super.noSuchMethod(
        Invocation.method(
          #setReducedDataCharts,
          [status],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setHideZeroValues(bool? status) => (super.noSuchMethod(
        Invocation.method(
          #setHideZeroValues,
          [status],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setSelectedTheme(int? value) => (super.noSuchMethod(
        Invocation.method(
          #setSelectedTheme,
          [value],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setSelectedLanguage(String? value) => (super.noSuchMethod(
        Invocation.method(
          #setSelectedLanguage,
          [value],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setStatisticsVisualizationMode(int? value) =>
      (super.noSuchMethod(
        Invocation.method(
          #setStatisticsVisualizationMode,
          [value],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> restoreAppConfig() => (super.noSuchMethod(
        Invocation.method(
          #restoreAppConfig,
          [],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  void addListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [FiltersProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockFiltersProvider extends _i1.Mock implements _i15.FiltersProvider {
  MockFiltersProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<int> get statusAllowedAndRetried => (super.noSuchMethod(
        Invocation.getter(#statusAllowedAndRetried),
        returnValue: <int>[],
      ) as List<int>);

  @override
  List<int> get defaultSelected => (super.noSuchMethod(
        Invocation.getter(#defaultSelected),
        returnValue: <int>[],
      ) as List<int>);

  @override
  List<int> get statusSelected => (super.noSuchMethod(
        Invocation.getter(#statusSelected),
        returnValue: <int>[],
      ) as List<int>);

  @override
  String get statusSelectedString => (super.noSuchMethod(
        Invocation.getter(#statusSelectedString),
        returnValue: _i8.dummyValue<String>(
          this,
          Invocation.getter(#statusSelectedString),
        ),
      ) as String);

  @override
  List<String> get totalClients => (super.noSuchMethod(
        Invocation.getter(#totalClients),
        returnValue: <String>[],
      ) as List<String>);

  @override
  List<String> get selectedClients => (super.noSuchMethod(
        Invocation.getter(#selectedClients),
        returnValue: <String>[],
      ) as List<String>);

  @override
  _i16.RequestStatus get requestStatus => (super.noSuchMethod(
        Invocation.getter(#requestStatus),
        returnValue: _i16.RequestStatus.all,
      ) as _i16.RequestStatus);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void update(_i17.ServersProvider? provider) => super.noSuchMethod(
        Invocation.method(
          #update,
          [provider],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setStatusSelected(List<int>? values) => super.noSuchMethod(
        Invocation.method(
          #setStatusSelected,
          [values],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setStartTime(DateTime? value) => super.noSuchMethod(
        Invocation.method(
          #setStartTime,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setEndTime(DateTime? value) => super.noSuchMethod(
        Invocation.method(
          #setEndTime,
          [value],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void resetFilters() => super.noSuchMethod(
        Invocation.method(
          #resetFilters,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void resetTime() => super.noSuchMethod(
        Invocation.method(
          #resetTime,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void resetStatus() => super.noSuchMethod(
        Invocation.method(
          #resetStatus,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setClients(List<String>? clients) => super.noSuchMethod(
        Invocation.method(
          #setClients,
          [clients],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setSelectedClients(List<String>? selectedClients) => super.noSuchMethod(
        Invocation.method(
          #setSelectedClients,
          [selectedClients],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setSelectedDomain(String? domain) => super.noSuchMethod(
        Invocation.method(
          #setSelectedDomain,
          [domain],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void resetClients() => super.noSuchMethod(
        Invocation.method(
          #resetClients,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void setRequestStatus(_i16.RequestStatus? status) => super.noSuchMethod(
        Invocation.method(
          #setRequestStatus,
          [status],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void addListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ServersProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockServersProvider extends _i1.Mock implements _i17.ServersProvider {
  MockServersProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.AppColors get colors => (super.noSuchMethod(
        Invocation.getter(#colors),
        returnValue: _FakeAppColors_0(
          this,
          Invocation.getter(#colors),
        ),
      ) as _i2.AppColors);

  @override
  List<_i3.Server> get getServersList => (super.noSuchMethod(
        Invocation.getter(#getServersList),
        returnValue: <_i3.Server>[],
      ) as List<_i3.Server>);

  @override
  int get numShown => (super.noSuchMethod(
        Invocation.getter(#numShown),
        returnValue: 0,
      ) as int);

  @override
  List<_i18.QueryStatus> get queryStatuses => (super.noSuchMethod(
        Invocation.getter(#queryStatuses),
        returnValue: <_i18.QueryStatus>[],
      ) as List<_i18.QueryStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void update(_i6.AppConfigProvider? provider) => super.noSuchMethod(
        Invocation.method(
          #update,
          [provider],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i19.ApiGateway? loadApiGateway(_i3.Server? server) =>
      (super.noSuchMethod(Invocation.method(
        #loadApiGateway,
        [server],
      )) as _i19.ApiGateway?);

  @override
  _i18.QueryStatus? getQueryStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getQueryStatus,
        [key],
      )) as _i18.QueryStatus?);

  @override
  _i18.QueryStatus? findQueryStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #findQueryStatus,
        [key],
      )) as _i18.QueryStatus?);

  @override
  _i12.Future<bool> addServer(_i3.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #addServer,
          [server],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> editServer(_i3.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #editServer,
          [server],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> removeServer(String? serverAddress) => (super.noSuchMethod(
        Invocation.method(
          #removeServer,
          [serverAddress],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> setDefaultServer(_i3.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #setDefaultServer,
          [server],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<dynamic> saveFromDb(List<_i13.ServerDbData>? servers) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFromDb,
          [servers],
        ),
        returnValue: _i12.Future<dynamic>.value(),
      ) as _i12.Future<dynamic>);

  @override
  _i12.FutureOr<Map<String, dynamic>> checkUrlExists(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkUrlExists,
          [url],
        ),
        returnValue:
            _i12.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i12.FutureOr<Map<String, dynamic>>);

  @override
  void setselectedServer({
    required _i3.Server? server,
    bool? toHomeTab,
  }) =>
      super.noSuchMethod(
        Invocation.method(
          #setselectedServer,
          [],
          {
            #server: server,
            #toHomeTab: toHomeTab,
          },
        ),
        returnValueForMissingStub: null,
      );

  @override
  void updateselectedServerStatus(bool? enabled) => super.noSuchMethod(
        Invocation.method(
          #updateselectedServerStatus,
          [enabled],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i12.Future<bool> deleteDbData() => (super.noSuchMethod(
        Invocation.method(
          #deleteDbData,
          [],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  _i12.Future<bool> resetSelectedServer() => (super.noSuchMethod(
        Invocation.method(
          #resetSelectedServer,
          [],
        ),
        returnValue: _i12.Future<bool>.value(false),
      ) as _i12.Future<bool>);

  @override
  void addListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i14.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #removeListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void dispose() => super.noSuchMethod(
        Invocation.method(
          #dispose,
          [],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void notifyListeners() => super.noSuchMethod(
        Invocation.method(
          #notifyListeners,
          [],
        ),
        returnValueForMissingStub: null,
      );
}

/// A class which mocks [ApiGatewayV6].
///
/// See the documentation for Mockito's code generation for more information.
class MockApiGatewayV6 extends _i1.Mock implements _i20.ApiGatewayV6 {
  MockApiGatewayV6() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i3.Server get server => (super.noSuchMethod(
        Invocation.getter(#server),
        returnValue: _FakeServer_1(
          this,
          Invocation.getter(#server),
        ),
      ) as _i3.Server);

  @override
  _i12.Future<_i4.Response> httpClient({
    required String? method,
    required String? url,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
    int? timeout = 10,
    int? maxRetries = 1,
  }) =>
      (super.noSuchMethod(
        Invocation.method(
          #httpClient,
          [],
          {
            #method: method,
            #url: url,
            #headers: headers,
            #body: body,
            #timeout: timeout,
            #maxRetries: maxRetries,
          },
        ),
        returnValue: _i12.Future<_i4.Response>.value(_FakeResponse_2(
          this,
          Invocation.method(
            #httpClient,
            [],
            {
              #method: method,
              #url: url,
              #headers: headers,
              #body: body,
              #timeout: timeout,
              #maxRetries: maxRetries,
            },
          ),
        )),
      ) as _i12.Future<_i4.Response>);

  @override
  _i12.Future<_i5.LoginQueryResponse> loginQuery() => (super.noSuchMethod(
        Invocation.method(
          #loginQuery,
          [],
        ),
        returnValue:
            _i12.Future<_i5.LoginQueryResponse>.value(_FakeLoginQueryResponse_3(
          this,
          Invocation.method(
            #loginQuery,
            [],
          ),
        )),
      ) as _i12.Future<_i5.LoginQueryResponse>);

  @override
  _i12.Future<_i5.RealtimeStatusResponse> realtimeStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #realtimeStatus,
          [],
        ),
        returnValue: _i12.Future<_i5.RealtimeStatusResponse>.value(
            _FakeRealtimeStatusResponse_4(
          this,
          Invocation.method(
            #realtimeStatus,
            [],
          ),
        )),
      ) as _i12.Future<_i5.RealtimeStatusResponse>);

  @override
  _i12.Future<_i5.DisableServerResponse> disableServerRequest(int? time) =>
      (super.noSuchMethod(
        Invocation.method(
          #disableServerRequest,
          [time],
        ),
        returnValue: _i12.Future<_i5.DisableServerResponse>.value(
            _FakeDisableServerResponse_5(
          this,
          Invocation.method(
            #disableServerRequest,
            [time],
          ),
        )),
      ) as _i12.Future<_i5.DisableServerResponse>);

  @override
  _i12.Future<_i5.EnableServerResponse> enableServerRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #enableServerRequest,
          [],
        ),
        returnValue: _i12.Future<_i5.EnableServerResponse>.value(
            _FakeEnableServerResponse_6(
          this,
          Invocation.method(
            #enableServerRequest,
            [],
          ),
        )),
      ) as _i12.Future<_i5.EnableServerResponse>);

  @override
  _i12.Future<_i5.FetchOverTimeDataResponse> fetchOverTimeData() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchOverTimeData,
          [],
        ),
        returnValue: _i12.Future<_i5.FetchOverTimeDataResponse>.value(
            _FakeFetchOverTimeDataResponse_7(
          this,
          Invocation.method(
            #fetchOverTimeData,
            [],
          ),
        )),
      ) as _i12.Future<_i5.FetchOverTimeDataResponse>);

  @override
  _i12.Future<_i5.FetchLogsResponse> fetchLogs(
    DateTime? from,
    DateTime? until,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchLogs,
          [
            from,
            until,
          ],
        ),
        returnValue:
            _i12.Future<_i5.FetchLogsResponse>.value(_FakeFetchLogsResponse_8(
          this,
          Invocation.method(
            #fetchLogs,
            [
              from,
              until,
            ],
          ),
        )),
      ) as _i12.Future<_i5.FetchLogsResponse>);

  @override
  _i12.Future<_i5.SetWhiteBlacklistResponse> setWhiteBlacklist(
    String? domain,
    String? list,
  ) =>
      (super.noSuchMethod(
        Invocation.method(
          #setWhiteBlacklist,
          [
            domain,
            list,
          ],
        ),
        returnValue: _i12.Future<_i5.SetWhiteBlacklistResponse>.value(
            _FakeSetWhiteBlacklistResponse_9(
          this,
          Invocation.method(
            #setWhiteBlacklist,
            [
              domain,
              list,
            ],
          ),
        )),
      ) as _i12.Future<_i5.SetWhiteBlacklistResponse>);

  @override
  _i12.Future<_i5.GetDomainLists> getDomainLists() => (super.noSuchMethod(
        Invocation.method(
          #getDomainLists,
          [],
        ),
        returnValue:
            _i12.Future<_i5.GetDomainLists>.value(_FakeGetDomainLists_10(
          this,
          Invocation.method(
            #getDomainLists,
            [],
          ),
        )),
      ) as _i12.Future<_i5.GetDomainLists>);

  @override
  _i12.Future<_i5.RemoveDomainFromListResponse> removeDomainFromList(
          _i21.Domain? domain) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeDomainFromList,
          [domain],
        ),
        returnValue: _i12.Future<_i5.RemoveDomainFromListResponse>.value(
            _FakeRemoveDomainFromListResponse_11(
          this,
          Invocation.method(
            #removeDomainFromList,
            [domain],
          ),
        )),
      ) as _i12.Future<_i5.RemoveDomainFromListResponse>);

  @override
  _i12.Future<_i5.AddDomainToListResponse> addDomainToList(
          Map<String, dynamic>? domainData) =>
      (super.noSuchMethod(
        Invocation.method(
          #addDomainToList,
          [domainData],
        ),
        returnValue: _i12.Future<_i5.AddDomainToListResponse>.value(
            _FakeAddDomainToListResponse_12(
          this,
          Invocation.method(
            #addDomainToList,
            [domainData],
          ),
        )),
      ) as _i12.Future<_i5.AddDomainToListResponse>);
}

// Mocks generated by Mockito 5.4.5 from annotations
// in pi_hole_client/test/ut/providers/domains_list_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i10;
import 'dart:ui' as _i12;

import 'package:http/http.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pi_hole_client/config/theme.dart' as _i2;
import 'package:pi_hole_client/gateways/api_gateway_interface.dart' as _i9;
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart' as _i13;
import 'package:pi_hole_client/models/domain.dart' as _i14;
import 'package:pi_hole_client/models/gateways.dart' as _i5;
import 'package:pi_hole_client/models/query_status.dart' as _i7;
import 'package:pi_hole_client/models/repository/database.dart' as _i11;
import 'package:pi_hole_client/models/server.dart' as _i3;
import 'package:pi_hole_client/providers/app_config_provider.dart' as _i8;
import 'package:pi_hole_client/providers/servers_provider.dart' as _i6;

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

/// A class which mocks [ServersProvider].
///
/// See the documentation for Mockito's code generation for more information.
class MockServersProvider extends _i1.Mock implements _i6.ServersProvider {
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
  List<_i7.QueryStatus> get queryStatuses => (super.noSuchMethod(
        Invocation.getter(#queryStatuses),
        returnValue: <_i7.QueryStatus>[],
      ) as List<_i7.QueryStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void update(_i8.AppConfigProvider? provider) => super.noSuchMethod(
        Invocation.method(
          #update,
          [provider],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i9.ApiGateway? loadApiGateway(_i3.Server? server) =>
      (super.noSuchMethod(Invocation.method(
        #loadApiGateway,
        [server],
      )) as _i9.ApiGateway?);

  @override
  _i7.QueryStatus? getQueryStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getQueryStatus,
        [key],
      )) as _i7.QueryStatus?);

  @override
  _i7.QueryStatus? findQueryStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #findQueryStatus,
        [key],
      )) as _i7.QueryStatus?);

  @override
  _i10.Future<bool> addServer(_i3.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #addServer,
          [server],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  _i10.Future<bool> editServer(_i3.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #editServer,
          [server],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  _i10.Future<bool> removeServer(String? serverAddress) => (super.noSuchMethod(
        Invocation.method(
          #removeServer,
          [serverAddress],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  _i10.Future<bool> setDefaultServer(_i3.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #setDefaultServer,
          [server],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  _i10.Future<dynamic> saveFromDb(List<_i11.ServerDbData>? servers) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFromDb,
          [servers],
        ),
        returnValue: _i10.Future<dynamic>.value(),
      ) as _i10.Future<dynamic>);

  @override
  _i10.FutureOr<Map<String, dynamic>> checkUrlExists(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkUrlExists,
          [url],
        ),
        returnValue:
            _i10.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i10.FutureOr<Map<String, dynamic>>);

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
  _i10.Future<bool> deleteDbData() => (super.noSuchMethod(
        Invocation.method(
          #deleteDbData,
          [],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  _i10.Future<bool> resetSelectedServer() => (super.noSuchMethod(
        Invocation.method(
          #resetSelectedServer,
          [],
        ),
        returnValue: _i10.Future<bool>.value(false),
      ) as _i10.Future<bool>);

  @override
  void addListener(_i12.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i12.VoidCallback? listener) => super.noSuchMethod(
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
class MockApiGatewayV6 extends _i1.Mock implements _i13.ApiGatewayV6 {
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
  _i10.Future<_i4.Response> httpClient({
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
        returnValue: _i10.Future<_i4.Response>.value(_FakeResponse_2(
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
      ) as _i10.Future<_i4.Response>);

  @override
  _i10.Future<_i5.LoginQueryResponse> loginQuery() => (super.noSuchMethod(
        Invocation.method(
          #loginQuery,
          [],
        ),
        returnValue:
            _i10.Future<_i5.LoginQueryResponse>.value(_FakeLoginQueryResponse_3(
          this,
          Invocation.method(
            #loginQuery,
            [],
          ),
        )),
      ) as _i10.Future<_i5.LoginQueryResponse>);

  @override
  _i10.Future<_i5.RealtimeStatusResponse> realtimeStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #realtimeStatus,
          [],
        ),
        returnValue: _i10.Future<_i5.RealtimeStatusResponse>.value(
            _FakeRealtimeStatusResponse_4(
          this,
          Invocation.method(
            #realtimeStatus,
            [],
          ),
        )),
      ) as _i10.Future<_i5.RealtimeStatusResponse>);

  @override
  _i10.Future<_i5.DisableServerResponse> disableServerRequest(int? time) =>
      (super.noSuchMethod(
        Invocation.method(
          #disableServerRequest,
          [time],
        ),
        returnValue: _i10.Future<_i5.DisableServerResponse>.value(
            _FakeDisableServerResponse_5(
          this,
          Invocation.method(
            #disableServerRequest,
            [time],
          ),
        )),
      ) as _i10.Future<_i5.DisableServerResponse>);

  @override
  _i10.Future<_i5.EnableServerResponse> enableServerRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #enableServerRequest,
          [],
        ),
        returnValue: _i10.Future<_i5.EnableServerResponse>.value(
            _FakeEnableServerResponse_6(
          this,
          Invocation.method(
            #enableServerRequest,
            [],
          ),
        )),
      ) as _i10.Future<_i5.EnableServerResponse>);

  @override
  _i10.Future<_i5.FetchOverTimeDataResponse> fetchOverTimeData() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchOverTimeData,
          [],
        ),
        returnValue: _i10.Future<_i5.FetchOverTimeDataResponse>.value(
            _FakeFetchOverTimeDataResponse_7(
          this,
          Invocation.method(
            #fetchOverTimeData,
            [],
          ),
        )),
      ) as _i10.Future<_i5.FetchOverTimeDataResponse>);

  @override
  _i10.Future<_i5.FetchLogsResponse> fetchLogs(
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
            _i10.Future<_i5.FetchLogsResponse>.value(_FakeFetchLogsResponse_8(
          this,
          Invocation.method(
            #fetchLogs,
            [
              from,
              until,
            ],
          ),
        )),
      ) as _i10.Future<_i5.FetchLogsResponse>);

  @override
  _i10.Future<_i5.SetWhiteBlacklistResponse> setWhiteBlacklist(
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
        returnValue: _i10.Future<_i5.SetWhiteBlacklistResponse>.value(
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
      ) as _i10.Future<_i5.SetWhiteBlacklistResponse>);

  @override
  _i10.Future<_i5.GetDomainLists> getDomainLists() => (super.noSuchMethod(
        Invocation.method(
          #getDomainLists,
          [],
        ),
        returnValue:
            _i10.Future<_i5.GetDomainLists>.value(_FakeGetDomainLists_10(
          this,
          Invocation.method(
            #getDomainLists,
            [],
          ),
        )),
      ) as _i10.Future<_i5.GetDomainLists>);

  @override
  _i10.Future<_i5.RemoveDomainFromListResponse> removeDomainFromList(
          _i14.Domain? domain) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeDomainFromList,
          [domain],
        ),
        returnValue: _i10.Future<_i5.RemoveDomainFromListResponse>.value(
            _FakeRemoveDomainFromListResponse_11(
          this,
          Invocation.method(
            #removeDomainFromList,
            [domain],
          ),
        )),
      ) as _i10.Future<_i5.RemoveDomainFromListResponse>);

  @override
  _i10.Future<_i5.AddDomainToListResponse> addDomainToList(
          Map<String, dynamic>? domainData) =>
      (super.noSuchMethod(
        Invocation.method(
          #addDomainToList,
          [domainData],
        ),
        returnValue: _i10.Future<_i5.AddDomainToListResponse>.value(
            _FakeAddDomainToListResponse_12(
          this,
          Invocation.method(
            #addDomainToList,
            [domainData],
          ),
        )),
      ) as _i10.Future<_i5.AddDomainToListResponse>);
}

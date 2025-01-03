// Mocks generated by Mockito 5.4.4 from annotations
// in pi_hole_client/test/ut/providers/domains_list_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i9;
import 'dart:ui' as _i11;

import 'package:http/http.dart' as _i3;
import 'package:mockito/mockito.dart' as _i1;
import 'package:pi_hole_client/gateways/api_gateway_interface.dart' as _i8;
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart' as _i12;
import 'package:pi_hole_client/models/domain.dart' as _i13;
import 'package:pi_hole_client/models/gateways.dart' as _i4;
import 'package:pi_hole_client/models/query_status.dart' as _i6;
import 'package:pi_hole_client/models/repository/database.dart' as _i10;
import 'package:pi_hole_client/models/server.dart' as _i2;
import 'package:pi_hole_client/providers/app_config_provider.dart' as _i7;
import 'package:pi_hole_client/providers/servers_provider.dart' as _i5;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeServer_0 extends _i1.SmartFake implements _i2.Server {
  _FakeServer_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeResponse_1 extends _i1.SmartFake implements _i3.Response {
  _FakeResponse_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeLoginQueryResponse_2 extends _i1.SmartFake
    implements _i4.LoginQueryResponse {
  _FakeLoginQueryResponse_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRealtimeStatusResponse_3 extends _i1.SmartFake
    implements _i4.RealtimeStatusResponse {
  _FakeRealtimeStatusResponse_3(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeDisableServerResponse_4 extends _i1.SmartFake
    implements _i4.DisableServerResponse {
  _FakeDisableServerResponse_4(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEnableServerResponse_5 extends _i1.SmartFake
    implements _i4.EnableServerResponse {
  _FakeEnableServerResponse_5(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchOverTimeDataResponse_6 extends _i1.SmartFake
    implements _i4.FetchOverTimeDataResponse {
  _FakeFetchOverTimeDataResponse_6(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeFetchLogsResponse_7 extends _i1.SmartFake
    implements _i4.FetchLogsResponse {
  _FakeFetchLogsResponse_7(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeSetWhiteBlacklistResponse_8 extends _i1.SmartFake
    implements _i4.SetWhiteBlacklistResponse {
  _FakeSetWhiteBlacklistResponse_8(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeGetDomainLists_9 extends _i1.SmartFake
    implements _i4.GetDomainLists {
  _FakeGetDomainLists_9(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeRemoveDomainFromListResponse_10 extends _i1.SmartFake
    implements _i4.RemoveDomainFromListResponse {
  _FakeRemoveDomainFromListResponse_10(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeAddDomainToListResponse_11 extends _i1.SmartFake
    implements _i4.AddDomainToListResponse {
  _FakeAddDomainToListResponse_11(
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
class MockServersProvider extends _i1.Mock implements _i5.ServersProvider {
  MockServersProvider() {
    _i1.throwOnMissingStub(this);
  }

  @override
  List<_i2.Server> get getServersList => (super.noSuchMethod(
        Invocation.getter(#getServersList),
        returnValue: <_i2.Server>[],
      ) as List<_i2.Server>);

  @override
  int get numShown => (super.noSuchMethod(
        Invocation.getter(#numShown),
        returnValue: 0,
      ) as int);

  @override
  List<_i6.QueryStatus> get queryStatuses => (super.noSuchMethod(
        Invocation.getter(#queryStatuses),
        returnValue: <_i6.QueryStatus>[],
      ) as List<_i6.QueryStatus>);

  @override
  bool get hasListeners => (super.noSuchMethod(
        Invocation.getter(#hasListeners),
        returnValue: false,
      ) as bool);

  @override
  void update(_i7.AppConfigProvider? provider) => super.noSuchMethod(
        Invocation.method(
          #update,
          [provider],
        ),
        returnValueForMissingStub: null,
      );

  @override
  _i8.ApiGateway? loadApiGateway(_i2.Server? server) =>
      (super.noSuchMethod(Invocation.method(
        #loadApiGateway,
        [server],
      )) as _i8.ApiGateway?);

  @override
  _i6.QueryStatus? getQueryStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #getQueryStatus,
        [key],
      )) as _i6.QueryStatus?);

  @override
  _i6.QueryStatus? findQueryStatus(String? key) =>
      (super.noSuchMethod(Invocation.method(
        #findQueryStatus,
        [key],
      )) as _i6.QueryStatus?);

  @override
  _i9.Future<bool> addServer(_i2.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #addServer,
          [server],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> editServer(_i2.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #editServer,
          [server],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> removeServer(String? serverAddress) => (super.noSuchMethod(
        Invocation.method(
          #removeServer,
          [serverAddress],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> setDefaultServer(_i2.Server? server) => (super.noSuchMethod(
        Invocation.method(
          #setDefaultServer,
          [server],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<dynamic> saveFromDb(List<_i10.ServerDbData>? servers) =>
      (super.noSuchMethod(
        Invocation.method(
          #saveFromDb,
          [servers],
        ),
        returnValue: _i9.Future<dynamic>.value(),
      ) as _i9.Future<dynamic>);

  @override
  _i9.FutureOr<Map<String, dynamic>> checkUrlExists(String? url) =>
      (super.noSuchMethod(
        Invocation.method(
          #checkUrlExists,
          [url],
        ),
        returnValue:
            _i9.Future<Map<String, dynamic>>.value(<String, dynamic>{}),
      ) as _i9.FutureOr<Map<String, dynamic>>);

  @override
  void setselectedServer({
    required _i2.Server? server,
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
  _i9.Future<bool> deleteDbData() => (super.noSuchMethod(
        Invocation.method(
          #deleteDbData,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  _i9.Future<bool> resetSelectedServer() => (super.noSuchMethod(
        Invocation.method(
          #resetSelectedServer,
          [],
        ),
        returnValue: _i9.Future<bool>.value(false),
      ) as _i9.Future<bool>);

  @override
  void addListener(_i11.VoidCallback? listener) => super.noSuchMethod(
        Invocation.method(
          #addListener,
          [listener],
        ),
        returnValueForMissingStub: null,
      );

  @override
  void removeListener(_i11.VoidCallback? listener) => super.noSuchMethod(
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
class MockApiGatewayV6 extends _i1.Mock implements _i12.ApiGatewayV6 {
  MockApiGatewayV6() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.Server get server => (super.noSuchMethod(
        Invocation.getter(#server),
        returnValue: _FakeServer_0(
          this,
          Invocation.getter(#server),
        ),
      ) as _i2.Server);

  @override
  _i9.Future<_i3.Response> httpClient({
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
        returnValue: _i9.Future<_i3.Response>.value(_FakeResponse_1(
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
      ) as _i9.Future<_i3.Response>);

  @override
  _i9.Future<_i4.LoginQueryResponse> loginQuery() => (super.noSuchMethod(
        Invocation.method(
          #loginQuery,
          [],
        ),
        returnValue:
            _i9.Future<_i4.LoginQueryResponse>.value(_FakeLoginQueryResponse_2(
          this,
          Invocation.method(
            #loginQuery,
            [],
          ),
        )),
      ) as _i9.Future<_i4.LoginQueryResponse>);

  @override
  _i9.Future<_i4.RealtimeStatusResponse> realtimeStatus() =>
      (super.noSuchMethod(
        Invocation.method(
          #realtimeStatus,
          [],
        ),
        returnValue: _i9.Future<_i4.RealtimeStatusResponse>.value(
            _FakeRealtimeStatusResponse_3(
          this,
          Invocation.method(
            #realtimeStatus,
            [],
          ),
        )),
      ) as _i9.Future<_i4.RealtimeStatusResponse>);

  @override
  _i9.Future<_i4.DisableServerResponse> disableServerRequest(int? time) =>
      (super.noSuchMethod(
        Invocation.method(
          #disableServerRequest,
          [time],
        ),
        returnValue: _i9.Future<_i4.DisableServerResponse>.value(
            _FakeDisableServerResponse_4(
          this,
          Invocation.method(
            #disableServerRequest,
            [time],
          ),
        )),
      ) as _i9.Future<_i4.DisableServerResponse>);

  @override
  _i9.Future<_i4.EnableServerResponse> enableServerRequest() =>
      (super.noSuchMethod(
        Invocation.method(
          #enableServerRequest,
          [],
        ),
        returnValue: _i9.Future<_i4.EnableServerResponse>.value(
            _FakeEnableServerResponse_5(
          this,
          Invocation.method(
            #enableServerRequest,
            [],
          ),
        )),
      ) as _i9.Future<_i4.EnableServerResponse>);

  @override
  _i9.Future<_i4.FetchOverTimeDataResponse> fetchOverTimeData() =>
      (super.noSuchMethod(
        Invocation.method(
          #fetchOverTimeData,
          [],
        ),
        returnValue: _i9.Future<_i4.FetchOverTimeDataResponse>.value(
            _FakeFetchOverTimeDataResponse_6(
          this,
          Invocation.method(
            #fetchOverTimeData,
            [],
          ),
        )),
      ) as _i9.Future<_i4.FetchOverTimeDataResponse>);

  @override
  _i9.Future<_i4.FetchLogsResponse> fetchLogs(
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
            _i9.Future<_i4.FetchLogsResponse>.value(_FakeFetchLogsResponse_7(
          this,
          Invocation.method(
            #fetchLogs,
            [
              from,
              until,
            ],
          ),
        )),
      ) as _i9.Future<_i4.FetchLogsResponse>);

  @override
  _i9.Future<_i4.SetWhiteBlacklistResponse> setWhiteBlacklist(
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
        returnValue: _i9.Future<_i4.SetWhiteBlacklistResponse>.value(
            _FakeSetWhiteBlacklistResponse_8(
          this,
          Invocation.method(
            #setWhiteBlacklist,
            [
              domain,
              list,
            ],
          ),
        )),
      ) as _i9.Future<_i4.SetWhiteBlacklistResponse>);

  @override
  _i9.Future<_i4.GetDomainLists> getDomainLists() => (super.noSuchMethod(
        Invocation.method(
          #getDomainLists,
          [],
        ),
        returnValue: _i9.Future<_i4.GetDomainLists>.value(_FakeGetDomainLists_9(
          this,
          Invocation.method(
            #getDomainLists,
            [],
          ),
        )),
      ) as _i9.Future<_i4.GetDomainLists>);

  @override
  _i9.Future<_i4.RemoveDomainFromListResponse> removeDomainFromList(
          _i13.Domain? domain) =>
      (super.noSuchMethod(
        Invocation.method(
          #removeDomainFromList,
          [domain],
        ),
        returnValue: _i9.Future<_i4.RemoveDomainFromListResponse>.value(
            _FakeRemoveDomainFromListResponse_10(
          this,
          Invocation.method(
            #removeDomainFromList,
            [domain],
          ),
        )),
      ) as _i9.Future<_i4.RemoveDomainFromListResponse>);

  @override
  _i9.Future<_i4.AddDomainToListResponse> addDomainToList(
          Map<String, dynamic>? domainData) =>
      (super.noSuchMethod(
        Invocation.method(
          #addDomainToList,
          [domainData],
        ),
        returnValue: _i9.Future<_i4.AddDomainToListResponse>.value(
            _FakeAddDomainToListResponse_11(
          this,
          Invocation.method(
            #addDomainToList,
            [domainData],
          ),
        )),
      ) as _i9.Future<_i4.AddDomainToListResponse>);
}
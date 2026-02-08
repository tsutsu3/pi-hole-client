import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/services/api/utils/api_exception.dart';
import 'package:pi_hole_client/data/services/api/wrappers/pihole_v6_service.dart';
import 'package:pihole_v6_api/pihole_v6_api.dart';
import 'package:result_dart/result_dart.dart';

import 'mocks.mocks.dart';

// Test fixture for GetAuth200Response (has required session param).
final _testSession = SessionSession(
  valid: true,
  totp: false,
  sid: 'test-sid',
  validity: 300,
  message: 'correct password',
);

// Helper to build a Dio Response<T>.
Response<T> dioResponse<T>(T data, {int statusCode = 200}) {
  return Response(
    data: data,
    statusCode: statusCode,
    requestOptions: RequestOptions(),
  );
}

// Helper to build a DioException with Pi-hole error body.
DioException dioError({
  int statusCode = 401,
  String key = 'unauthorized',
  String message = 'Unauthorized',
}) {
  return DioException(
    requestOptions: RequestOptions(),
    response: Response(
      statusCode: statusCode,
      data: {
        'error': {'key': key, 'message': message},
      },
      requestOptions: RequestOptions(),
    ),
    type: DioExceptionType.badResponse,
  );
}

void main() {
  late PiholeV6Service service;
  late MockPiholeV6Api mockApi;
  late MockAuthenticationApi mockAuthApi;
  late MockActionsApi mockActionsApi;
  late MockClientManagementApi mockClientApi;
  late MockDHCPApi mockDhcpApi;
  late MockDNSControlApi mockDnsApi;
  late MockDomainManagementApi mockDomainApi;
  late MockFTLInformationApi mockFtlApi;
  late MockGroupManagementApi mockGroupApi;
  late MockListManagementApi mockListApi;
  late MockMetricsApi mockMetricsApi;
  late MockNetworkInformationApi mockNetworkApi;
  late MockPiHoleConfigurationApi mockConfigApi;

  setUp(() {
    mockApi = MockPiholeV6Api();
    mockAuthApi = MockAuthenticationApi();
    mockActionsApi = MockActionsApi();
    mockClientApi = MockClientManagementApi();
    mockDhcpApi = MockDHCPApi();
    mockDnsApi = MockDNSControlApi();
    mockDomainApi = MockDomainManagementApi();
    mockFtlApi = MockFTLInformationApi();
    mockGroupApi = MockGroupManagementApi();
    mockListApi = MockListManagementApi();
    mockMetricsApi = MockMetricsApi();
    mockNetworkApi = MockNetworkInformationApi();
    mockConfigApi = MockPiHoleConfigurationApi();

    when(mockApi.getAuthenticationApi()).thenReturn(mockAuthApi);
    when(mockApi.getActionsApi()).thenReturn(mockActionsApi);
    when(mockApi.getClientManagementApi()).thenReturn(mockClientApi);
    when(mockApi.getDHCPApi()).thenReturn(mockDhcpApi);
    when(mockApi.getDNSControlApi()).thenReturn(mockDnsApi);
    when(mockApi.getDomainManagementApi()).thenReturn(mockDomainApi);
    when(mockApi.getFTLInformationApi()).thenReturn(mockFtlApi);
    when(mockApi.getGroupManagementApi()).thenReturn(mockGroupApi);
    when(mockApi.getListManagementApi()).thenReturn(mockListApi);
    when(mockApi.getMetricsApi()).thenReturn(mockMetricsApi);
    when(mockApi.getNetworkInformationApi()).thenReturn(mockNetworkApi);
    when(mockApi.getPiHoleConfigurationApi()).thenReturn(mockConfigApi);

    service = PiholeV6Service(api: mockApi);
  });

  // ==========================================================================
  // Authentication
  // ==========================================================================
  group('Authentication', () {
    group('postAuth', () {
      test('returns Success with response data', () async {
        final mockResponse = GetAuth200Response(session: _testSession);
        when(
          mockAuthApi.addAuth(password: anyNamed('password')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.postAuth(password: 'test123');

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
        verify(mockAuthApi.addAuth(password: anyNamed('password'))).called(1);
      });

      test('returns Failure on DioException', () async {
        when(
          mockAuthApi.addAuth(password: anyNamed('password')),
        ).thenThrow(dioError(message: 'password incorrect'));

        final result = await service.postAuth(password: 'wrong');

        expect(result.isError(), true);
        final error = result.exceptionOrNull()! as ApiException;
        expect(error.message, 'password incorrect');
      });
    });

    group('getAuth', () {
      test('returns Success with session data', () async {
        final mockResponse = GetAuth200Response(session: _testSession);
        when(
          mockAuthApi.getAuth(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAuth();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });

      test('returns Failure on DioException', () async {
        when(mockAuthApi.getAuth()).thenThrow(dioError());

        final result = await service.getAuth();

        expect(result.isError(), true);
      });
    });

    group('deleteAuth', () {
      test('returns Success with Unit', () async {
        when(
          mockAuthApi.deleteGroups(),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteAuth();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
      });
    });

    group('getAuthSessions', () {
      test('returns Success with sessions data', () async {
        final mockResponse = GetAuthSessions200Response();
        when(
          mockAuthApi.getAuthSessions(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAuthSessions();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('deleteAuthSession', () {
      test('returns Success with Unit', () async {
        when(
          mockAuthApi.deleteAuthSession(id: anyNamed('id')),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteAuthSession(id: 1);

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
        verify(mockAuthApi.deleteAuthSession(id: 1)).called(1);
      });
    });
  });

  // ==========================================================================
  // Metrics
  // ==========================================================================
  group('Metrics', () {
    group('getHistory', () {
      test('returns Success with activity metrics', () async {
        final mockResponse = GetActivityMetrics200Response();
        when(
          mockMetricsApi.getActivityMetrics(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getHistory();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('getHistoryClients', () {
      test('returns Success with client metrics', () async {
        final mockResponse = GetClientMetrics200Response();
        when(
          mockMetricsApi.getClientMetrics(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getHistoryClients();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('getStatsSummary', () {
      test('returns Success with summary', () async {
        final mockResponse = GetMetricsSummary200Response();
        when(
          mockMetricsApi.getMetricsSummary(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getStatsSummary();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });

      test('returns Failure on DioException', () async {
        when(mockMetricsApi.getMetricsSummary()).thenThrow(dioError());

        final result = await service.getStatsSummary();

        expect(result.isError(), true);
      });
    });

    group('getStatsUpstreams', () {
      test('returns Success with upstreams', () async {
        final mockResponse = GetMetricsUpstreams200Response();
        when(
          mockMetricsApi.getMetricsUpstreams(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getStatsUpstreams();

        expect(result.isSuccess(), true);
      });
    });

    group('getStatsTopDomains', () {
      test('passes parameters correctly', () async {
        final mockResponse = GetMetricsTopDomains200Response();
        when(
          mockMetricsApi.getMetricsTopDomains(
            blocked: anyNamed('blocked'),
            count: anyNamed('count'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getStatsTopDomains(
          blocked: true,
          count: 10,
        );

        expect(result.isSuccess(), true);
        verify(
          mockMetricsApi.getMetricsTopDomains(blocked: true, count: 10),
        ).called(1);
      });
    });

    group('getStatsTopClients', () {
      test('passes parameters correctly', () async {
        final mockResponse = GetMetricsTopClients200Response();
        when(
          mockMetricsApi.getMetricsTopClients(
            blocked: anyNamed('blocked'),
            count: anyNamed('count'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getStatsTopClients(
          blocked: false,
          count: 5,
        );

        expect(result.isSuccess(), true);
        verify(
          mockMetricsApi.getMetricsTopClients(blocked: false, count: 5),
        ).called(1);
      });
    });

    group('getQueryTypes', () {
      test('returns Success with query types', () async {
        final mockResponse = GetMetricsQueryTypes200Response();
        when(
          mockMetricsApi.getMetricsQueryTypes(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getQueryTypes();

        expect(result.isSuccess(), true);
      });
    });

    group('getQueries', () {
      test('passes all parameters correctly', () async {
        final mockResponse = GetQueries200Response();
        when(
          mockMetricsApi.getQueries(
            from: anyNamed('from'),
            until: anyNamed('until'),
            length: anyNamed('length'),
            cursor: anyNamed('cursor'),
            domain: anyNamed('domain'),
            clientIp: anyNamed('clientIp'),
            clientName: anyNamed('clientName'),
            upstream: anyNamed('upstream'),
            type: anyNamed('type'),
            status: anyNamed('status'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getQueries(
          from: 1000,
          until: 2000,
          length: 100,
          domain: 'example.com',
        );

        expect(result.isSuccess(), true);
        verify(
          mockMetricsApi.getQueries(
            from: 1000,
            until: 2000,
            length: 100,
            cursor: null,
            domain: 'example.com',
            clientIp: null,
            clientName: null,
            upstream: null,
            type: null,
            status: null,
          ),
        ).called(1);
      });
    });
  });

  // ==========================================================================
  // DNS Control
  // ==========================================================================
  group('DNS Control', () {
    group('getDnsBlocking', () {
      test('returns Success with blocking status', () async {
        final mockResponse = GetBlocking200Response();
        when(
          mockDnsApi.getBlocking(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getDnsBlocking();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('setDnsBlocking', () {
      test('returns Success with new blocking status', () async {
        final mockResponse = GetBlocking200Response();
        when(
          mockDnsApi.setBlocking(
            setBlockingRequest: anyNamed('setBlockingRequest'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.setDnsBlocking();

        expect(result.isSuccess(), true);
      });
    });
  });

  // ==========================================================================
  // Groups
  // ==========================================================================
  group('Groups', () {
    group('getAllGroups', () {
      test('returns Success with all groups', () async {
        final mockResponse = GetGroups200Response();
        when(
          mockGroupApi.getAllGroups(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAllGroups();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
        verify(mockGroupApi.getAllGroups()).called(1);
      });

      test('returns Failure on DioException', () async {
        when(mockGroupApi.getAllGroups()).thenThrow(dioError());

        final result = await service.getAllGroups();

        expect(result.isError(), true);
        final error = result.exceptionOrNull()! as ApiException;
        expect(error.statusCode, 401);
        expect(error.errorCode, 'unauthorized');
      });
    });

    group('getGroups', () {
      test('returns Success with specific group', () async {
        final mockResponse = GetGroups200Response();
        when(
          mockGroupApi.getGroups(name: anyNamed('name')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getGroups(name: 'mygroup');

        expect(result.isSuccess(), true);
        verify(mockGroupApi.getGroups(name: 'mygroup')).called(1);
      });
    });

    group('addGroup', () {
      test('returns Success with created group', () async {
        final mockResponse = ReplaceGroup200Response();
        when(
          mockGroupApi.addGroup(groupsPost: anyNamed('groupsPost')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.addGroup();

        expect(result.isSuccess(), true);
      });
    });

    group('replaceGroup', () {
      test('returns Success with updated group', () async {
        final mockResponse = ReplaceGroup200Response();
        when(
          mockGroupApi.replaceGroup(
            name: anyNamed('name'),
            groupsPut: anyNamed('groupsPut'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.replaceGroup(name: 'mygroup');

        expect(result.isSuccess(), true);
        verify(
          mockGroupApi.replaceGroup(
            name: 'mygroup',
            groupsPut: null,
          ),
        ).called(1);
      });
    });

    group('deleteGroup', () {
      test('returns Success with Unit', () async {
        when(
          mockGroupApi.deleteGroup(name: anyNamed('name')),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteGroup(name: 'mygroup');

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
        verify(mockGroupApi.deleteGroup(name: 'mygroup')).called(1);
      });
    });
  });

  // ==========================================================================
  // Domains
  // ==========================================================================
  group('Domains', () {
    group('getAllDomains', () {
      test('returns Success with all domains', () async {
        final mockResponse = GetDomains200Response();
        when(
          mockDomainApi.getAllDomains(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAllDomains();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
        verify(mockDomainApi.getAllDomains()).called(1);
      });

      test('returns Failure on DioException', () async {
        when(mockDomainApi.getAllDomains()).thenThrow(dioError());

        final result = await service.getAllDomains();

        expect(result.isError(), true);
      });
    });

    group('getDomainsByTypeKind', () {
      test('returns Success with filtered domains', () async {
        final mockResponse = GetDomains200Response();
        when(
          mockDomainApi.getDomainsByTypeKind(
            type: anyNamed('type'),
            kind: anyNamed('kind'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getDomainsByTypeKind(
          type: 'allow',
          kind: 'exact',
        );

        expect(result.isSuccess(), true);
        verify(
          mockDomainApi.getDomainsByTypeKind(type: 'allow', kind: 'exact'),
        ).called(1);
      });
    });

    group('getDomains', () {
      test('returns Success with specific domain', () async {
        final mockResponse = GetDomains200Response();
        when(
          mockDomainApi.getDomains(
            type: anyNamed('type'),
            kind: anyNamed('kind'),
            domain: anyNamed('domain'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getDomains(
          type: 'deny',
          kind: 'regex',
          domain: '.*ads.*',
        );

        expect(result.isSuccess(), true);
        verify(
          mockDomainApi.getDomains(
            type: 'deny',
            kind: 'regex',
            domain: '.*ads.*',
          ),
        ).called(1);
      });
    });

    group('addDomain', () {
      test('returns Success with created domain', () async {
        final mockResponse = ReplaceDomain200Response();
        when(
          mockDomainApi.addDomain(
            type: anyNamed('type'),
            kind: anyNamed('kind'),
            post: anyNamed('post'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.addDomain(
          type: 'allow',
          kind: 'exact',
        );

        expect(result.isSuccess(), true);
      });
    });

    group('replaceDomain', () {
      test('returns Success with updated domain', () async {
        final mockResponse = ReplaceDomain200Response();
        when(
          mockDomainApi.replaceDomain(
            type: anyNamed('type'),
            kind: anyNamed('kind'),
            domain: anyNamed('domain'),
            replaceDomainRequest: anyNamed('replaceDomainRequest'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.replaceDomain(
          type: 'allow',
          kind: 'exact',
          domain: 'example.com',
        );

        expect(result.isSuccess(), true);
      });
    });

    group('deleteDomain', () {
      test('returns Success with Unit', () async {
        when(
          mockDomainApi.deleteDomain(
            type: anyNamed('type'),
            kind: anyNamed('kind'),
            domain: anyNamed('domain'),
          ),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteDomain(
          type: 'deny',
          kind: 'exact',
          domain: 'ads.example.com',
        );

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
      });
    });
  });

  // ==========================================================================
  // Lists
  // ==========================================================================
  group('Lists', () {
    group('getAllLists', () {
      test('returns Success with all lists', () async {
        final mockResponse = GetLists200Response();
        when(
          mockListApi.getAllLists(type: anyNamed('type')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAllLists();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
        verify(mockListApi.getAllLists(type: null)).called(1);
      });

      test('passes optional type parameter', () async {
        final mockResponse = GetLists200Response();
        when(
          mockListApi.getAllLists(type: anyNamed('type')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAllLists(type: 'block');

        expect(result.isSuccess(), true);
        verify(mockListApi.getAllLists(type: 'block')).called(1);
      });

      test('returns Failure on DioException', () async {
        when(
          mockListApi.getAllLists(type: anyNamed('type')),
        ).thenThrow(dioError());

        final result = await service.getAllLists();

        expect(result.isError(), true);
      });
    });

    group('getLists', () {
      test('returns Success with specific list', () async {
        final mockResponse = GetLists200Response();
        when(
          mockListApi.getLists(
            list: anyNamed('list'),
            type: anyNamed('type'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getLists(list: 'https://example.com/list');

        expect(result.isSuccess(), true);
        verify(
          mockListApi.getLists(list: 'https://example.com/list', type: null),
        ).called(1);
      });
    });

    group('addList', () {
      test('returns Success with created list', () async {
        final mockResponse = ReplaceLists200Response();
        when(
          mockListApi.addList(
            type: anyNamed('type'),
            listsPost: anyNamed('listsPost'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.addList(type: 'block');

        expect(result.isSuccess(), true);
      });
    });

    group('replaceList', () {
      test('returns Success with updated list', () async {
        final mockResponse = ReplaceLists200Response();
        when(
          mockListApi.replaceLists(
            list: anyNamed('list'),
            type: anyNamed('type'),
            listsPut: anyNamed('listsPut'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.replaceList(
          list: 'https://example.com/list',
          type: 'block',
        );

        expect(result.isSuccess(), true);
      });
    });

    group('deleteList', () {
      test('returns Success with Unit', () async {
        when(
          mockListApi.deleteLists(
            list: anyNamed('list'),
            type: anyNamed('type'),
          ),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteList(
          list: 'https://example.com/list',
          type: 'block',
        );

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
      });
    });

    group('searchDomainInLists', () {
      test('passes parameters correctly', () async {
        final mockResponse = GetSearch200Response();
        when(
          mockListApi.getSearch(
            domain: anyNamed('domain'),
            N: anyNamed('N'),
            partial: anyNamed('partial'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.searchDomainInLists(
          domain: 'ads.example.com',
          n: 10,
          partial: true,
        );

        expect(result.isSuccess(), true);
        verify(
          mockListApi.getSearch(
            domain: 'ads.example.com',
            N: 10,
            partial: true,
          ),
        ).called(1);
      });
    });
  });

  // ==========================================================================
  // Clients
  // ==========================================================================
  group('Clients', () {
    group('getAllClients', () {
      test('returns Success with all clients', () async {
        final mockResponse = GetClients200Response();
        when(
          mockClientApi.getAllClients(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getAllClients();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
        verify(mockClientApi.getAllClients()).called(1);
      });

      test('returns Failure on DioException', () async {
        when(mockClientApi.getAllClients()).thenThrow(dioError());

        final result = await service.getAllClients();

        expect(result.isError(), true);
        final error = result.exceptionOrNull()! as ApiException;
        expect(error.statusCode, 401);
      });
    });

    group('getClients', () {
      test('returns Success with specific client', () async {
        final mockResponse = GetClients200Response();
        when(
          mockClientApi.getClients(client: anyNamed('client')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getClients(client: '192.168.1.100');

        expect(result.isSuccess(), true);
        verify(mockClientApi.getClients(client: '192.168.1.100')).called(1);
      });
    });

    group('addClient', () {
      test('returns Success with created client', () async {
        final mockResponse = ReplaceClient200Response();
        when(
          mockClientApi.addClient(addClientRequest: anyNamed('addClientRequest')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.addClient();

        expect(result.isSuccess(), true);
      });
    });

    group('replaceClient', () {
      test('returns Success with updated client', () async {
        final mockResponse = ReplaceClient200Response();
        when(
          mockClientApi.replaceClient(
            client: anyNamed('client'),
            replaceClientRequest: anyNamed('replaceClientRequest'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.replaceClient(client: '192.168.1.100');

        expect(result.isSuccess(), true);
      });
    });

    group('deleteClient', () {
      test('returns Success with Unit', () async {
        when(
          mockClientApi.deleteClient(client: anyNamed('client')),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteClient(client: '192.168.1.100');

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
        verify(mockClientApi.deleteClient(client: '192.168.1.100')).called(1);
      });
    });
  });

  // ==========================================================================
  // FTL Information
  // ==========================================================================
  group('FTL Information', () {
    group('getInfoVersion', () {
      test('returns Success with version data', () async {
        final mockResponse = GetVersion200Response();
        when(
          mockFtlApi.getVersion(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoVersion();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('getInfoFtl', () {
      test('returns Success with FTL info', () async {
        final mockResponse = GetFtlinfo200Response();
        when(
          mockFtlApi.getFtlinfo(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoFtl();

        expect(result.isSuccess(), true);
      });
    });

    group('getInfoHost', () {
      test('returns Success with host info', () async {
        final mockResponse = GetHostinfo200Response();
        when(
          mockFtlApi.getHostinfo(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoHost();

        expect(result.isSuccess(), true);
      });
    });

    group('getInfoMessages', () {
      test('returns Success with messages', () async {
        final mockResponse = GetMessages200Response();
        when(
          mockFtlApi.getMessages(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoMessages();

        expect(result.isSuccess(), true);
      });
    });

    group('deleteInfoMessage', () {
      test('returns Success with Unit', () async {
        when(
          mockFtlApi.deleteMessage(messageId: anyNamed('messageId')),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteInfoMessage(messageId: 42);

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
        verify(mockFtlApi.deleteMessage(messageId: 42)).called(1);
      });
    });

    group('getInfoClient', () {
      test('returns Success with client info', () async {
        final mockResponse = GetClient200Response();
        when(
          mockFtlApi.getClient(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoClient();

        expect(result.isSuccess(), true);
      });
    });

    group('getInfoMetrics', () {
      test('returns Success with metrics info', () async {
        final mockResponse = GetMetricsinfo200Response();
        when(
          mockFtlApi.getMetricsinfo(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoMetrics();

        expect(result.isSuccess(), true);
      });
    });

    group('getInfoSensors', () {
      test('returns Success with sensor data', () async {
        final mockResponse = GetSensors200Response();
        when(
          mockFtlApi.getSensors(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoSensors();

        expect(result.isSuccess(), true);
      });
    });

    group('getInfoSystem', () {
      test('returns Success with system info', () async {
        final mockResponse = GetSysteminfo200Response();
        when(
          mockFtlApi.getSysteminfo(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getInfoSystem();

        expect(result.isSuccess(), true);
      });
    });
  });

  // ==========================================================================
  // Network Information
  // ==========================================================================
  group('Network Information', () {
    group('getNetworkDevices', () {
      test('returns Success with devices', () async {
        final mockResponse = GetNetwork200Response();
        when(
          mockNetworkApi.getNetwork(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getNetworkDevices();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('deleteNetworkDevice', () {
      test('returns Success with Unit', () async {
        when(
          mockNetworkApi.deleteDevice(deviceId: anyNamed('deviceId')),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteNetworkDevice(deviceId: 5);

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
        verify(mockNetworkApi.deleteDevice(deviceId: 5)).called(1);
      });
    });

    group('getNetworkGateway', () {
      test('passes detailed parameter', () async {
        final mockResponse = GetGateway200Response();
        when(
          mockNetworkApi.getGateway(detailed: anyNamed('detailed')),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getNetworkGateway(detailed: true);

        expect(result.isSuccess(), true);
        verify(mockNetworkApi.getGateway(detailed: true)).called(1);
      });
    });
  });

  // ==========================================================================
  // Actions
  // ==========================================================================
  group('Actions', () {
    group('actionRestartDns', () {
      test('returns Success', () async {
        final mockResponse = ActionRestartdns200Response();
        when(
          mockActionsApi.actionRestartdns(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.actionRestartDns();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('actionFlushNetwork', () {
      test('returns Success', () async {
        final mockResponse = ActionRestartdns200Response();
        when(
          mockActionsApi.actionFlushnetwork(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.actionFlushNetwork();

        expect(result.isSuccess(), true);
      });
    });

    group('actionFlushLogs', () {
      test('returns Success', () async {
        final mockResponse = ActionRestartdns200Response();
        when(
          mockActionsApi.actionFlushlogs(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.actionFlushLogs();

        expect(result.isSuccess(), true);
      });
    });

    group('actionGravity', () {
      test('returns Success with string', () async {
        when(
          mockActionsApi.actionGravity(),
        ).thenAnswer((_) async => dioResponse('gravity update started'));

        final result = await service.actionGravity();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), 'gravity update started');
      });
    });

    group('actionFlushArp', () {
      test('returns Success', () async {
        final mockResponse = ActionRestartdns200Response();
        when(
          // ignore: deprecated_member_use
          mockActionsApi.actionFlusharp(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.actionFlushArp();

        expect(result.isSuccess(), true);
      });
    });
  });

  // ==========================================================================
  // Pi-hole Configuration
  // ==========================================================================
  group('Pi-hole Configuration', () {
    group('getConfig', () {
      test('returns Success with config', () async {
        final mockResponse = GetConfig200Response();
        when(
          mockConfigApi.getConfig(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getConfig();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });

      test('returns Failure on DioException', () async {
        when(mockConfigApi.getConfig()).thenThrow(dioError());

        final result = await service.getConfig();

        expect(result.isError(), true);
      });
    });

    group('patchConfig', () {
      test('passes parameters correctly', () async {
        final mockResponse = GetConfig200Response();
        when(
          mockConfigApi.patchConfig(
            getConfig200Response: anyNamed('getConfig200Response'),
            restart: anyNamed('restart'),
          ),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.patchConfig(restart: true);

        expect(result.isSuccess(), true);
        verify(
          mockConfigApi.patchConfig(
            getConfig200Response: null,
            restart: true,
          ),
        ).called(1);
      });
    });
  });

  // ==========================================================================
  // DHCP
  // ==========================================================================
  group('DHCP', () {
    group('getDhcpLeases', () {
      test('returns Success with DHCP data', () async {
        final mockResponse = GetDhcp200Response();
        when(
          mockDhcpApi.getDhcp(),
        ).thenAnswer((_) async => dioResponse(mockResponse));

        final result = await service.getDhcpLeases();

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), mockResponse);
      });
    });

    group('deleteDhcpLease', () {
      test('returns Success with Unit', () async {
        when(
          mockDhcpApi.deleteDhcp(ip: anyNamed('ip')),
        ).thenAnswer((_) async => dioResponse<void>(null, statusCode: 204));

        final result = await service.deleteDhcpLease(ip: '192.168.1.50');

        expect(result.isSuccess(), true);
        expect(result.getOrNull(), unit);
        verify(mockDhcpApi.deleteDhcp(ip: '192.168.1.50')).called(1);
      });
    });
  });
}

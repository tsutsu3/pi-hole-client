import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/gateways/v6/api_gateway_v6.dart';
import 'package:pi_hole_client/models/api/v6/action/gravity.dart' show Gravity;
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/messages.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/gravity_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/repository/database.dart';

import './gravity_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, DatabaseRepository, ApiGatewayV6])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('GravityUpdateProvider', () {
    late GravityUpdateProvider gravityUpdateProvider;
    late MockDatabaseRepository mockRepository;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;
    late bool listenerCalled;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
    );

    const address = 'http://localhost:8081';
    final startTime = DateTime.now().subtract(const Duration(hours: 1));
    final endTime = DateTime.now();
    const status = GravityStatus.success;
    const message = 'Test message';
    const log = 'Test log';
    const url = 'http://localhost/test.xt';

    final graivtyUpdateData = GravityUpdateData(
      address: address,
      startTime: startTime,
      endTime: endTime,
      status: status.index,
    );

    final gravityMessagesData = GravityMessagesData(
      address: address,
      message: message,
      url: url,
      timestamp: startTime,
    );

    final gravityLogsData = GravityLogsData(
      address: address,
      line: 1,
      message: log,
      timestamp: startTime,
    );

    final gravityData = GravityData(
      gravityUpdate: graivtyUpdateData,
      gravityMessages: [gravityMessagesData],
      gravityLogs: [gravityLogsData],
    );

    final gravityDataRunning = GravityData(
      gravityUpdate: GravityUpdateData(
        address: address,
        startTime: startTime,
        endTime: endTime,
        status: GravityStatus.running.index,
      ),
      gravityMessages: [gravityMessagesData],
      gravityLogs: [gravityLogsData],
    );

    setUp(() {
      mockRepository = MockDatabaseRepository();
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();

      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);

      when(mockApiGatewayV6.getMessages()).thenAnswer(
        (_) async => MessagesResponse(
          result: APiResponseType.success,
          data: MessagesInfo(
            messages: [
              Message(
                timestamp: startTime,
                message: message,
                url: url,
              ),
            ],
          ),
        ),
      );

      when(mockRepository.getGravityUpdateQuery(any)).thenAnswer(
        (_) async => graivtyUpdateData,
      );

      when(mockRepository.getGravityDataQuery(any))
          .thenAnswer((_) async => gravityData);
      when(mockRepository.clearGravityDataQuery(any)).thenAnswer(
        (_) async => true,
      );
      when(mockRepository.upsertGravityUpdateQuery(any)).thenAnswer(
        (_) async => true,
      );
      when(mockRepository.insertGravityLogQuery(any)).thenAnswer(
        (_) async => true,
      );

      gravityUpdateProvider = GravityUpdateProvider(
        repository: mockRepository,
        serversProvider: mockServersProvider,
      );
      listenerCalled = false;
      gravityUpdateProvider.addListener(() {
        listenerCalled = true;
      });
    });

    test('Initial values are set correctly', () {
      expect(gravityUpdateProvider.status, GravityStatus.idle);
      expect(gravityUpdateProvider.logs, []);
      expect(gravityUpdateProvider.messages, []);
      expect(gravityUpdateProvider.startedAtTime, null);
      expect(gravityUpdateProvider.completedAtTime, null);
      expect(gravityUpdateProvider.isLoaded, false);
      expect(listenerCalled, false);
    });

    test('update() updates serversProvider and resets state', () {
      final newServersProvider = MockServersProvider();
      when(newServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);
      gravityUpdateProvider.update(newServersProvider);

      expect(gravityUpdateProvider.status, GravityStatus.idle);
      expect(gravityUpdateProvider.logs, []);
      expect(gravityUpdateProvider.messages, []);
      expect(gravityUpdateProvider.startedAtTime, null);
      expect(gravityUpdateProvider.completedAtTime, null);
      expect(gravityUpdateProvider.isLoaded, false);
      expect(listenerCalled, false);
    });

    test('clearMessages() clears messages and notifies listeners', () {
      gravityUpdateProvider.setMessages(
        MessagesInfo(
          messages: [
            Message(
              timestamp: DateTime.now(),
              message: 'Test',
              url: 'http://test.com',
            ),
          ],
        ),
      );

      gravityUpdateProvider.clearMessages();

      expect(gravityUpdateProvider.messages, []);
      expect(listenerCalled, true);
    });

    test('clearLogs() clears logs and notifies listeners', () {
      gravityUpdateProvider.appendLogs(['Log 1', 'Log 2']);

      gravityUpdateProvider.clearLogs();

      expect(gravityUpdateProvider.logs, []);
      expect(listenerCalled, true);
    });

    test('setStatus() updates status and notifies listeners', () {
      gravityUpdateProvider.setStatus(GravityStatus.running);

      expect(gravityUpdateProvider.status, GravityStatus.running);
      expect(listenerCalled, true);
    });

    test('setStartedAt() updates startedAt and notifies listeners', () {
      final now = DateTime.now();
      gravityUpdateProvider.setStartedAt(now);

      expect(gravityUpdateProvider.startedAtTime, now);
      expect(listenerCalled, true);
    });

    test('setCompletedAt() updates completedAt and notifies listeners', () {
      final now = DateTime.now();
      gravityUpdateProvider.setCompletedAt(now);

      expect(gravityUpdateProvider.completedAtTime, now);
      expect(listenerCalled, true);
    });

    test('setMessages() updates messages and notifies listeners', () {
      final messagesInfo = MessagesInfo(
        messages: [
          Message(
            timestamp: DateTime.now(),
            message: 'Test',
            url: 'http://test.com',
          ),
        ],
      );
      gravityUpdateProvider.setMessages(messagesInfo);

      expect(
        gravityUpdateProvider.messages.toList(),
        messagesInfo.messages.toList(),
      );
      expect(listenerCalled, true);
    });

    test('appendLogs() adds logs and notifies listeners', () {
      gravityUpdateProvider.appendLogs(['Log 1', 'Log 2']);

      expect(gravityUpdateProvider.logs, ['Log 1', 'Log 2']);
      expect(listenerCalled, true);
    });

    test('reset() clears all data and resets state', () {
      gravityUpdateProvider.appendLogs(['Log 1']);
      gravityUpdateProvider.setMessages(
        MessagesInfo(
          messages: [
            Message(
              timestamp: DateTime.now(),
              message: 'Test',
              url: 'http://test.com',
            ),
          ],
        ),
      );
      gravityUpdateProvider.setStatus(GravityStatus.running);

      gravityUpdateProvider.reset();

      expect(gravityUpdateProvider.logs, []);
      expect(gravityUpdateProvider.messages, []);
      expect(gravityUpdateProvider.status, GravityStatus.idle);
      expect(gravityUpdateProvider.startedAtTime, null);
      expect(gravityUpdateProvider.completedAtTime, null);
      expect(gravityUpdateProvider.isLoaded, false);
      expect(listenerCalled, true);
    });

    test('load() loads gravity data and notifies listeners', () async {
      await gravityUpdateProvider.load();

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(gravityUpdateProvider.messages[0].message, message);
      expect(gravityUpdateProvider.startedAtTime, startTime);
      expect(gravityUpdateProvider.completedAtTime, endTime);
      expect(gravityUpdateProvider.isLoaded, true);
      expect(listenerCalled, true);
    });

    test(
        'load() resumes with running status from previous session and handles as error',
        () async {
      when(mockRepository.getGravityDataQuery(any))
          .thenAnswer((_) async => gravityDataRunning);
      await gravityUpdateProvider.load();

      expect(gravityUpdateProvider.status, GravityStatus.error);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(gravityUpdateProvider.messages[0].message, message);
      expect(gravityUpdateProvider.startedAtTime, startTime);
      expect(gravityUpdateProvider.completedAtTime, endTime);
      expect(gravityUpdateProvider.isLoaded, true);
      expect(listenerCalled, true);
    });

    test('load() does not reload if already loaded', () async {
      await gravityUpdateProvider.load();
      expect(listenerCalled, true);
      listenerCalled = false; // Reset the listener called flag
      await gravityUpdateProvider.load();

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(gravityUpdateProvider.messages[0].message, message);
      expect(gravityUpdateProvider.startedAtTime, startTime);
      expect(gravityUpdateProvider.completedAtTime, endTime);
      expect(gravityUpdateProvider.isLoaded, true);
      expect(listenerCalled, false);
    });

    test('start() starts gravity update and notifies listeners', () async {
      gravityUpdateProvider.update(mockServersProvider);

      final controller = StreamController<GravityResponse>();

      when(mockApiGatewayV6.updateGravity()).thenAnswer(
        (_) => controller.stream,
      );

      await gravityUpdateProvider.start();
      controller.add(
        GravityResponse(
          result: APiResponseType.success,
          data: [log],
        ),
      );
      await controller.close();

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      // expect(gravityUpdateProvider.messages.length, 1);
      // expect(gravityUpdateProvider.messages[0].message, message);
      // expect(gravityUpdateProvider.startedAtTime, startTime);
      // expect(gravityUpdateProvider.completedAtTime, endTime);
      expect(listenerCalled, true);
    });

    test('start() does nothing if stream is null', () async {
      gravityUpdateProvider.update(mockServersProvider);

      final controller = StreamController<GravityResponse>();

      when(mockApiGatewayV6.updateGravity()).thenAnswer(
        (_) => controller.stream,
      );

      await gravityUpdateProvider.start();
      controller.add(
        GravityResponse(
          result: APiResponseType.error,
          data: [log],
        ),
      );
      await controller.close();

      expect(gravityUpdateProvider.status, GravityStatus.error);
      expect(gravityUpdateProvider.logs.length, 0);
      expect(listenerCalled, true);
    });
  });
}

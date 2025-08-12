import 'dart:async';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_v6.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/messages.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/viewmodel/gravity_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

import '../../../testing/fakes/repositories/local/fake_gravity_repository.dart';
import './gravity_provider_test.mocks.dart';

@GenerateMocks([ServersProvider, ApiGatewayV6])
void main() async {
  TestWidgetsFlutterBinding.ensureInitialized();
  await dotenv.load();

  group('GravityUpdateProvider', () {
    late GravityUpdateProvider gravityUpdateProvider;
    late FakeGravityRepository repository;
    late MockServersProvider mockServersProvider;
    late MockApiGatewayV6 mockApiGatewayV6;
    late bool listenerCalled;

    final server = Server(
      address: 'http://localhost:8081',
      alias: 'test v6',
      defaultServer: false,
      apiVersion: 'v6',
      allowSelfSignedCert: true,
    );

    const id = 1;
    final startTime = DateTime.fromMillisecondsSinceEpoch(1641031200000);
    final endTime = DateTime.fromMillisecondsSinceEpoch(1641032200000);
    const message = 'Test message';
    const log = 'Test log';
    const url = 'http://localhost/test.xt';

    setUp(() {
      repository = FakeGravityRepository();
      mockServersProvider = MockServersProvider();
      mockApiGatewayV6 = MockApiGatewayV6();

      when(mockServersProvider.selectedServer).thenReturn(server);
      when(mockServersProvider.selectedApiGateway).thenReturn(mockApiGatewayV6);

      gravityUpdateProvider = GravityUpdateProvider(
        repository: repository,
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
      expect(listenerCalled, true);
    });

    test('clearMessages() clears messages and notifies listeners', () {
      gravityUpdateProvider.setMessages(
        MessagesInfo(
          messages: [
            Message(
              id: id,
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
            id: id,
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
              id: id,
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
        repository.status = GravityStatus.running;
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
      },
    );

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

      when(
        mockApiGatewayV6.updateGravity(),
      ).thenAnswer((_) => controller.stream);

      when(mockApiGatewayV6.getMessages()).thenAnswer(
        (_) async => MessagesResponse(
          result: APiResponseType.success,
          data: MessagesInfo(
            messages: [
              Message(id: id, timestamp: startTime, message: message, url: url),
            ],
          ),
        ),
      );

      await gravityUpdateProvider.start();
      controller.add(
        GravityResponse(result: APiResponseType.success, data: [log]),
      );
      await controller.close();
      await Future.delayed(const Duration(seconds: 1));

      expect(gravityUpdateProvider.status, GravityStatus.success);
      expect(gravityUpdateProvider.logs.length, 1);
      expect(gravityUpdateProvider.logs[0], log);
      expect(gravityUpdateProvider.messages.length, 1);
      expect(gravityUpdateProvider.messages[0].message, message);
      expect(listenerCalled, true);
    });

    test('start() handles stream error and updates status to error', () async {
      gravityUpdateProvider.update(mockServersProvider);

      final controller = StreamController<GravityResponse>();

      when(
        mockApiGatewayV6.updateGravity(),
      ).thenAnswer((_) => controller.stream);

      await gravityUpdateProvider.start();

      controller.addError(Exception('Test error'));

      await controller.close();

      await Future.delayed(const Duration(seconds: 1));

      expect(gravityUpdateProvider.status, GravityStatus.error);
      expect(gravityUpdateProvider.completedAtTime, isNotNull);
      expect(listenerCalled, true);
    });

    test('start() does nothing if stream is null', () async {
      gravityUpdateProvider.update(mockServersProvider);

      final controller = StreamController<GravityResponse>();

      when(
        mockApiGatewayV6.updateGravity(),
      ).thenAnswer((_) => controller.stream);

      await gravityUpdateProvider.start();
      controller.add(
        GravityResponse(result: APiResponseType.error, data: [log]),
      );
      await controller.close();

      expect(gravityUpdateProvider.status, GravityStatus.error);
      expect(gravityUpdateProvider.logs.length, 0);
      expect(listenerCalled, true);
    });

    test('removeMessage() removes a message and notifies listeners', () async {
      gravityUpdateProvider.update(mockServersProvider);

      when(mockApiGatewayV6.removeMessage(any)).thenAnswer(
        (_) async => RemoveMessageResponse(result: APiResponseType.success),
      );

      gravityUpdateProvider.setMessages(
        MessagesInfo(
          messages: [
            Message(
              id: id,
              timestamp: DateTime.now(),
              message: 'Test',
              url: 'http://test.com',
            ),
          ],
        ),
      );

      final result = await gravityUpdateProvider.removeMessage(id);

      expect(result, true);
      expect(gravityUpdateProvider.messages, []);
      expect(listenerCalled, true);
    });
  });
}

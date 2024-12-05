import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/constants/api_versions.dart';
import 'package:pi_hole_client/gateways/v5/api_gateway_v5.dart';
import 'package:pi_hole_client/models/server.dart';

class MockClient extends Mock implements http.Client {}

void main() {
  group('checkBasicAuth', () {
    late ApiGatewayV5 apiGateway;
    late Server server;

    setUp(() {
      server = Server(
          address: 'http://example.com',
          alias: 'example',
          defaultServer: true,
          apiVersion: SupportedApiVersions.v5,
          token: 'xxx123');
      apiGateway = ApiGatewayV5(server);
    });

    test('checkBasicAuth returns true for valid credentials', () {
      expect(apiGateway.checkBasicAuth('username', 'password'), isTrue);
    });

    test('checkBasicAuth returns false for invalid username', () {
      expect(apiGateway.checkBasicAuth('', 'password'), isFalse);
      expect(apiGateway.checkBasicAuth(null, 'password'), isFalse);
    });

    test('checkBasicAuth returns false for invalid blank blank password', () {
      expect(apiGateway.checkBasicAuth('username', ''), isFalse);
      expect(apiGateway.checkBasicAuth('username', null), isFalse);
    });
  });
}

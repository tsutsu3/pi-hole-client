import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';
import 'package:pi_hole_client/data/services/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';
import '../../test/data/services/utils/mocks.mocks.dart';

// ============================================================================
// Mocking utilities for API client tests
// ============================================================================
void mockPost(MockClient client, Uri url, Response response) {
  when(
    client.post(url, headers: anyNamed('headers'), body: anyNamed('body')),
  ).thenAnswer((_) async => response);
}

void mockGet(MockClient client, Uri url, Response response) {
  when(
    client.get(url, headers: anyNamed('headers')),
  ).thenAnswer((_) async => response);
}

void mockPut(MockClient client, Uri url, Response response) {
  when(
    client.put(url, headers: anyNamed('headers'), body: anyNamed('body')),
  ).thenAnswer((_) async => response);
}

void mockDelete(MockClient client, Uri url, Response response) {
  when(
    client.delete(url, headers: anyNamed('headers')),
  ).thenAnswer((_) async => response);
}

void mockPatch(MockClient client, Uri url, Response response) {
  when(
    client.patch(url, headers: anyNamed('headers'), body: anyNamed('body')),
  ).thenAnswer((_) async => response);
}

void mockStreamedResponse(
  MockClient client,
  Uri url,
  StreamedResponse response,
) {
  when(client.send(any)).thenAnswer((_) async => response);
}

// ============================================================================
// Common assertions for API client tests
// ============================================================================
void expectSuccess<T extends Object>(
  Result<T> result, [
  Map<String, dynamic>? expectedJson,
]) {
  expect(result.isSuccess(), true);

  final value = result.getOrNull();

  if (value is Unit) {
    expect(value, unit);
  } else if (expectedJson != null) {
    expect((value as dynamic).toJson(), expectedJson);
  } else {
    fail('Missing expectedJson for non-Unit result');
  }
}

void expectListSuccess<T extends Object>(
  Result<T> result, [
  List<Map<String, dynamic>>? expectedJsonList,
]) {
  expect(result.isSuccess(), true);

  final value = result.getOrNull();

  if (value is List) {
    if (expectedJsonList != null) {
      expect(
        value.map((e) => (e as dynamic).toJson()).toList(),
        expectedJsonList,
      );
    } else {
      fail('Missing expectedJsonList for List result');
    }
  } else {
    fail('Expected a List result, but got ${value.runtimeType}');
  }
}

void expectHttpError<T extends Object>(
  Result<T> result, {
  required int statusCode,
  required String messageContains,
}) {
  expect(result.isError(), true);
  final error = result.exceptionOrNull();
  expect(
    error,
    predicate(
      (e) =>
          e is HttpStatusCodeException &&
          e.statusCode == statusCode &&
          e.message.contains(messageContains),
    ),
  );
}

void expectError<T extends Object>(
  Result<T> result, {
  required String messageContains,
}) {
  expect(result.isError(), true);
  final error = result.exceptionOrNull();
  expect(
    error,
    predicate((e) => e is Exception && e.toString().contains(messageContains)),
  );
}

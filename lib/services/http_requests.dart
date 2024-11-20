// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/functions/encode_basic_auth.dart';
import 'package:pi_hole_client/models/server.dart';

bool checkBasicAuth(String? username, String? password) {
  if (username != null &&
      password != null &&
      username != '' &&
      password != '') {
    return true;
  } else {
    return false;
  }
}

Future<Response> httpClient({
  required String method,
  String? token,
  required String url,
  Map<String, String>? headers,
  Map<String, dynamic>? body,
  int? timeout,
  Map<String, dynamic>? basicAuth,
}) async {
  final Map<String, String>? h = basicAuth != null &&
          checkBasicAuth(basicAuth['username'], basicAuth['password'])
      ? headers != null
          ? {
              ...headers,
              'Authorization':
                  'Basic ${encodeBasicAuth(basicAuth['username'], basicAuth['password'])}'
            }
          : {
              'Authorization':
                  'Basic ${encodeBasicAuth(basicAuth['username'], basicAuth['password'])}'
            }
      : headers;

  switch (method) {
    case 'post':
      return http
          .post(Uri.parse(url), body: body, headers: h)
          .timeout(const Duration(seconds: 10));

    case 'get':
    default:
      return http
          .get(Uri.parse(url), headers: h)
          .timeout(Duration(seconds: timeout ?? 10));
  }
}

Future loginQuery(Server server) async {
  try {
    final status = await http.get(
        Uri.parse(
            '${server.address}/admin/api.php?auth=${server.token}&summaryRaw'),
        headers:
            checkBasicAuth(server.basicAuthUser, server.basicAuthPassword) ==
                    true
                ? {
                    'Authorization':
                        'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
                  }
                : null);
    if (status.statusCode == 200) {
      final statusParsed = jsonDecode(status.body);
      if (statusParsed.runtimeType != List && statusParsed['status'] != null) {
        final enableOrDisable = await http.get(
            Uri.parse(statusParsed['status'] == 'enabled'
                ? '${server.address}/admin/api.php?auth=${server.token}&enable=0'
                : '${server.address}/admin/api.php?auth=${server.token}&disable=0'),
            headers: checkBasicAuth(
                        server.basicAuthUser, server.basicAuthPassword) ==
                    true
                ? {
                    'Authorization':
                        'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
                  }
                : null);
        if (enableOrDisable.statusCode == 200) {
          if (enableOrDisable.body == 'Not authorized!' ||
              enableOrDisable.body ==
                  'Session expired! Please re-login on the Pi-hole dashboard.' ||
              enableOrDisable.body == []) {
            return {
              'result': 'auth_error',
              'log': AppLog(
                  type: 'login',
                  dateTime: DateTime.now(),
                  statusCode: status.statusCode.toString(),
                  message: 'auth_error_1',
                  resBody: status.body)
            };
          } else {
            final enableOrDisableParsed = jsonDecode(enableOrDisable.body);
            if (enableOrDisableParsed.runtimeType != List) {
              final phpSessId = enableOrDisable.headers['set-cookie']!
                  .split(';')[0]
                  .split('=')[1];
              return {
                'result': 'success',
                'status': statusParsed['status'],
                'phpSessId': phpSessId,
              };
            } else {
              return {
                'result': 'auth_error',
                'log': AppLog(
                    type: 'login',
                    dateTime: DateTime.now(),
                    statusCode: status.statusCode.toString(),
                    message: 'auth_error_2',
                    resBody: status.body)
              };
            }
          }
        } else {
          return {
            'result': 'auth_error',
            'log': AppLog(
                type: 'login',
                dateTime: DateTime.now(),
                statusCode: status.statusCode.toString(),
                message: 'auth_error_3',
                resBody: status.body)
          };
        }
      } else {
        return {
          'result': 'auth_error',
          'log': AppLog(
              type: 'login',
              dateTime: DateTime.now(),
              statusCode: status.statusCode.toString(),
              message: 'auth_error',
              resBody: status.body)
        };
      }
    } else {
      return {
        'result': 'no_connection',
        'log': AppLog(
            type: 'login',
            dateTime: DateTime.now(),
            statusCode: status.statusCode.toString(),
            message: 'no_connection_2',
            resBody: status.body)
      };
    }
  } on SocketException {
    return {
      'result': 'socket',
      'log': AppLog(
          type: 'login', dateTime: DateTime.now(), message: 'SocketException')
    };
  } on TimeoutException {
    return {
      'result': 'timeout',
      'log': AppLog(
          type: 'login', dateTime: DateTime.now(), message: 'TimeoutException')
    };
  } on HandshakeException {
    return {
      'result': 'ssl_error',
      'log': AppLog(
          type: 'login',
          dateTime: DateTime.now(),
          message: 'HandshakeException')
    };
  } on FormatException {
    return {
      'result': 'auth_error',
      'log': AppLog(
          type: 'login', dateTime: DateTime.now(), message: 'FormatException')
    };
  } catch (e) {
    return {
      'result': 'error',
      'log':
          AppLog(type: 'login', dateTime: DateTime.now(), message: e.toString())
    };
  }
}

// ignore_for_file: unrelated_type_equality_checks

import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import 'package:pi_hole_client/models/app_log.dart';
import 'package:pi_hole_client/models/domain.dart';
import 'package:pi_hole_client/functions/encode_basic_auth.dart';
import 'package:pi_hole_client/models/overtime_data.dart';
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

Future fetchOverTimeData(Server server) async {
  try {
    final response = await httpClient(
        method: 'get',
        url:
            '${server.address}/admin/api.php?auth=${server.token}&overTimeData10mins&overTimeDataClients&getClientNames',
        basicAuth: {
          'username': server.basicAuthUser,
          'password': server.basicAuthPassword
        });
    final body = jsonDecode(response.body);
    var data = OverTimeData.fromJson(body);
    return {'result': 'success', 'data': data};
  } on SocketException {
    return {'result': 'socket'};
  } on TimeoutException {
    return {'result': 'timeout'};
  } on HandshakeException {
    return {'result': 'ssl_error'};
  } catch (e) {
    return {'result': 'error'};
  }
}

Future setWhiteBlacklist({
  required Server server,
  required String domain,
  required String list,
}) async {
  try {
    final response = await httpClient(
        method: 'get',
        url:
            '${server.address}/admin/api.php?auth=${server.token}&list=$list&add=$domain',
        basicAuth: {
          'username': server.basicAuthUser,
          'password': server.basicAuthPassword
        });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.runtimeType == List<dynamic>) {
        return {'result': 'error', 'message': 'not_exists'};
      } else {
        if (json['success'] == true) {
          return {'result': 'success', 'data': json};
        } else {
          return {'result': 'error'};
        }
      }
    } else {
      return {'result': 'error'};
    }
  } on SocketException {
    return {'result': 'socket'};
  } on TimeoutException {
    return {'result': 'timeout'};
  } on HandshakeException {
    return {'result': 'ssl_error'};
  } catch (e) {
    return {'result': 'error'};
  }
}

dynamic testHash(Server server, String hash) async {
  try {
    final status = await httpClient(
        method: 'get',
        url: '${server.address}/admin/api.php',
        basicAuth: {
          'username': server.basicAuthUser,
          'password': server.basicAuthPassword
        });
    if (status.statusCode == 200) {
      final body = jsonDecode(status.body);
      if (body.runtimeType != List && body['status'] != null) {
        final response = await httpClient(
            method: 'get',
            url:
                '${server.address}/admin/api.php?auth=$hash&${body['status'] == 'enabled' ? 'enable' : 'disable'}',
            basicAuth: {
              'username': server.basicAuthUser,
              'password': server.basicAuthPassword
            });
        if (response.statusCode == 200) {
          final body2 = jsonDecode(response.body);
          if (body2.runtimeType != List && body2['status'] != null) {
            return {'result': 'success'};
          } else {
            return {'result': 'hash_not_valid'};
          }
        } else {
          return {'result': 'hash_not_valid'};
        }
      } else {
        return {'result': 'no_connection'};
      }
    } else {
      return {'result': 'no_connection'};
    }
  } on SocketException {
    return {'result': 'no_connection'};
  } on TimeoutException {
    return {'result': 'no_connection'};
  } on HandshakeException {
    return {'result': 'ssl_error'};
  } catch (e) {
    return {'result': 'error'};
  }
}

Future getDomainLists({required Server server}) async {
  Map<String, String>? headers;
  if (checkBasicAuth(server.basicAuthUser, server.basicAuthPassword) == true) {
    headers = {
      'Authorization':
          'Basic ${encodeBasicAuth(server.basicAuthUser!, server.basicAuthPassword!)}'
    };
  }

  try {
    final results = await Future.wait([
      http.get(
          Uri.parse(
              '${server.address}/admin/api.php?auth=${server.token}&list=white'),
          headers: headers),
      http.get(
          Uri.parse(
              '${server.address}/admin/api.php?auth=${server.token}&list=regex_white'),
          headers: headers),
      http.get(
          Uri.parse(
              '${server.address}/admin/api.php?auth=${server.token}&list=black'),
          headers: headers),
      http.get(
          Uri.parse(
              '${server.address}/admin/api.php?auth=${server.token}&list=regex_black'),
          headers: headers),
    ]);

    if (results[0].statusCode == 200 &&
        results[1].statusCode == 200 &&
        results[2].statusCode == 200 &&
        results[3].statusCode == 200) {
      return {
        'result': 'success',
        'data': {
          'whitelist': jsonDecode(results[0].body)['data']
              .map((item) => Domain.fromJson(item)),
          'whitelistRegex': jsonDecode(results[1].body)['data']
              .map((item) => Domain.fromJson(item)),
          'blacklist': jsonDecode(results[2].body)['data']
              .map((item) => Domain.fromJson(item)),
          'blacklistRegex': jsonDecode(results[3].body)['data']
              .map((item) => Domain.fromJson(item)),
        }
      };
    } else {
      return {'result': 'error'};
    }
  } on SocketException {
    return {'result': 'no_connection'};
  } on TimeoutException {
    return {'result': 'no_connection'};
  } on HandshakeException {
    return {'result': 'ssl_error'};
  } on FormatException {
    return {'result': 'auth_error'};
  } catch (e) {
    return {'result': 'error'};
  }
}

Future removeDomainFromList(
    {required Server server, required Domain domain}) async {
  String getType(int type) {
    switch (type) {
      case 0:
        return "white";

      case 1:
        return "black";

      case 2:
        return "regex_white";

      case 3:
        return "regex_black";

      default:
        return "";
    }
  }

  try {
    final response = await httpClient(
        method: 'get',
        url:
            '${server.address}/admin/api.php?auth=${server.token}&list=${getType(domain.type)}&sub=${domain.domain}',
        basicAuth: {
          'username': server.basicAuthUser,
          'password': server.basicAuthPassword
        });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.runtimeType == List<dynamic>) {
        return {'result': 'error', 'message': 'not_exists'};
      } else {
        if (json['success'] == true) {
          return {'result': 'success'};
        } else {
          return {'result': 'error'};
        }
      }
    } else {
      return {'result': 'error'};
    }
  } on SocketException {
    return {'result': 'socket'};
  } on TimeoutException {
    return {'result': 'timeout'};
  } on HandshakeException {
    return {'result': 'ssl_error'};
  } catch (e) {
    return {'result': 'error'};
  }
}

Future addDomainToList({
  required Server server,
  required Map<String, dynamic> domainData,
}) async {
  try {
    final response = await httpClient(
        method: 'get',
        url:
            '${server.address}/admin/api.php?auth=${server.token}&list=${domainData['list']}&add=${domainData['domain']}',
        basicAuth: {
          'username': server.basicAuthUser,
          'password': server.basicAuthPassword
        });
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      if (json.runtimeType == List<dynamic>) {
        return {'result': 'error'};
      } else {
        if (json['success'] == true &&
            json['message'] == 'Added ${domainData['domain']}') {
          return {'result': 'success'};
        } else if (json['success'] == true &&
            json['message'] ==
                'Not adding ${domainData['domain']} as it is already on the list') {
          return {'result': 'already_added'};
        } else {
          return {'result': 'error'};
        }
      }
    } else {
      return {'result': 'error'};
    }
  } on SocketException {
    return {'result': 'no_connection'};
  } on TimeoutException {
    return {'result': 'no_connection'};
  } on HandshakeException {
    return {'result': 'ssl_error'};
  } on FormatException {
    return {'result': 'auth_error'};
  } catch (e) {
    return {'result': 'error'};
  }
}

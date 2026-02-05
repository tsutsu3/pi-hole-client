//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:pihole_v6_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:pihole_v6_api/src/model/add_auth401_response.dart';
import 'package:pihole_v6_api/src/model/get_padd200_response.dart';

class PADDApi {

  final Dio _dio;

  const PADDApi(this._dio);

  /// Get summarized data for PADD
  /// 
  ///
  /// Parameters:
  /// * [full] - (Optional) Return full data
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetPadd200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetPadd200Response>> getPadd({ 
    bool? full,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/padd';
    final _options = Options(
      method: r'GET',
      headers: <String, dynamic>{
        ...?headers,
      },
      extra: <String, dynamic>{
        'secure': <Map<String, String>>[
          {
            'type': 'apiKey',
            'name': 'x_header_sid',
            'keyName': 'X-FTL-SID',
            'where': 'header',
          },{
            'type': 'apiKey',
            'name': 'query_sid',
            'keyName': 'sid',
            'where': 'query',
          },{
            'type': 'apiKey',
            'name': 'cookie_sid',
            'keyName': 'sid',
            'where': '',
          },{
            'type': 'apiKey',
            'name': 'header_sid',
            'keyName': 'sid',
            'where': 'header',
          },
        ],
        ...?extra,
      },
      validateStatus: validateStatus,
    );

    final _queryParameters = <String, dynamic>{
      if (full != null) r'full': full,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetPadd200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetPadd200Response, GetPadd200Response>(rawData, 'GetPadd200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetPadd200Response>(
      data: _responseData,
      headers: _response.headers,
      isRedirect: _response.isRedirect,
      requestOptions: _response.requestOptions,
      redirects: _response.redirects,
      statusCode: _response.statusCode,
      statusMessage: _response.statusMessage,
      extra: _response.extra,
    );
  }

}

//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:pihole_v6_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:pihole_v6_api/src/model/add_auth401_response.dart';
import 'package:pihole_v6_api/src/model/get_gateway200_response.dart';
import 'package:pihole_v6_api/src/model/get_interfaces200_response.dart';
import 'package:pihole_v6_api/src/model/get_network200_response.dart';
import 'package:pihole_v6_api/src/model/get_routes200_response.dart';
import 'package:pihole_v6_api/src/model/replace_domain400_response.dart';
import 'package:pihole_v6_api/src/model/took.dart';

class NetworkInformationApi {

  final Dio _dio;

  const NetworkInformationApi(this._dio);

  /// Delete a device from the network table
  /// This API hook deletes a device from the network table. This will also remove all associated IP addresses and hostnames. 
  ///
  /// Parameters:
  /// * [deviceId] - Device ID
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> deleteDevice({ 
    required int deviceId,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/network/devices/{device_id}'.replaceAll('{' r'device_id' '}', deviceId.toString());
    final _options = Options(
      method: r'DELETE',
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

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// Get info about the gateway of your Pi-hole
  /// This API hook returns infos about the gateway of your Pi-hole.  If the optional parameter &#x60;detailed&#x60; is set to &#x60;true&#x60;, the response will include detailed information about the individual interfaces and routes. Note that the available information is dependent on the interface type and state. 
  ///
  /// Parameters:
  /// * [detailed] - (Optional) Detailed interface/routing information
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetGateway200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetGateway200Response>> getGateway({ 
    bool? detailed,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/network/gateway';
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
      if (detailed != null) r'detailed': detailed,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetGateway200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetGateway200Response, GetGateway200Response>(rawData, 'GetGateway200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetGateway200Response>(
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

  /// Get info about the interfaces of your Pi-hole
  /// This API hook returns infos about the networking interfaces of your Pi-hole. Note that not all described fields are applicable to any routing type. Users must not rely on the presence of any field without checking the route type first.  If the optional parameter &#x60;detailed&#x60; is set to &#x60;true&#x60;, the response will include more detailed information about the individual interfaces where the available information is dependent on the interface type and state. 
  ///
  /// Parameters:
  /// * [detailed] - (Optional) Detailed interface/routing information
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetInterfaces200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetInterfaces200Response>> getInterfaces({ 
    bool? detailed,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/network/interfaces';
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
      if (detailed != null) r'detailed': detailed,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetInterfaces200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetInterfaces200Response, GetInterfaces200Response>(rawData, 'GetInterfaces200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetInterfaces200Response>(
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

  /// Get info about the devices in your local network as seen by your Pi-hole
  /// This API hook returns infos about the devices in your local network as seen by your Pi-hole. By default, this number of shown devices is limited to 10. Devices are ordered by when your Pi-hole has received the last query from this device (most recent first) 
  ///
  /// Parameters:
  /// * [maxDevices] - (Optional) Maximum number of devices to show
  /// * [maxAddresses] - (Optional) Maximum number of addresses to show per device
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetNetwork200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetNetwork200Response>> getNetwork({ 
    int? maxDevices,
    int? maxAddresses,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/network/devices';
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
      if (maxDevices != null) r'max_devices': maxDevices,
      if (maxAddresses != null) r'max_addresses': maxAddresses,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetNetwork200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetNetwork200Response, GetNetwork200Response>(rawData, 'GetNetwork200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetNetwork200Response>(
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

  /// Get info about the routes of your Pi-hole
  /// This API hook returns infos about the networking routes of your Pi-hole. Note that not all described fields are applicable to any routing type. Users must not rely on the presence of any field without checking the route type first.  If the optional parameter &#x60;detailed&#x60; is set to &#x60;true&#x60;, the response will include more detailed information about the individual routes where the available information is dependent on the route type and state. 
  ///
  /// Parameters:
  /// * [detailed] - (Optional) Detailed interface/routing information
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetRoutes200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetRoutes200Response>> getRoutes({ 
    bool? detailed,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/network/routes';
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
      if (detailed != null) r'detailed': detailed,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetRoutes200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetRoutes200Response, GetRoutes200Response>(rawData, 'GetRoutes200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetRoutes200Response>(
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

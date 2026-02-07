//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:pihole_v6_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:pihole_v6_api/src/model/add_auth401_response.dart';
import 'package:pihole_v6_api/src/model/batch_delete_groups_request_inner.dart';
import 'package:pihole_v6_api/src/model/get_groups200_response.dart';
import 'package:pihole_v6_api/src/model/groups_post.dart';
import 'package:pihole_v6_api/src/model/groups_put.dart';
import 'package:pihole_v6_api/src/model/replace_domain400_response.dart';
import 'package:pihole_v6_api/src/model/replace_group200_response.dart';
import 'package:pihole_v6_api/src/model/took.dart';

class GroupManagementApi {

  final Dio _dio;

  const GroupManagementApi(this._dio);

  /// Add new group
  /// Creates a new group in the &#x60;groups&#x60; object. The &#x60;{group}&#x60; itself is specified in the request body (POST JSON).  On success, a new resource is created at &#x60;/groups/{name}&#x60;.  The &#x60;database_error&#x60; with message &#x60;UNIQUE constraint failed&#x60; error indicates that a group with the same name already exists. 
  ///
  /// Parameters:
  /// * [groupsPost] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReplaceGroup200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReplaceGroup200Response>> addGroup({ 
    GroupsPost? groupsPost,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/groups';
    final _options = Options(
      method: r'POST',
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
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
_bodyData=jsonEncode(groupsPost);
    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReplaceGroup200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReplaceGroup200Response, ReplaceGroup200Response>(rawData, 'ReplaceGroup200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReplaceGroup200Response>(
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

  /// Delete multiple groups
  /// Deletes multiple groups in the &#x60;groups&#x60; object. The &#x60;{groups}&#x60; themselves are specified in the request body (POST JSON). 
  ///
  /// Parameters:
  /// * [batchDeleteGroupsRequestInner] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> batchDeleteGroups({ 
    required List<BatchDeleteGroupsRequestInner> batchDeleteGroupsRequestInner,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/groups:batchDelete';
    final _options = Options(
      method: r'POST',
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
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
_bodyData=jsonEncode(batchDeleteGroupsRequestInner);
    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// Delete group
  /// *Note:* There will be no content on success. 
  ///
  /// Parameters:
  /// * [name] - Group name
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> deleteGroup({ 
    required String name,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/groups/{name}'.replaceAll('{' r'name' '}', name.toString());
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

  /// Get groups
  /// &#x60;{name}&#x60; is optional. Specifying it will result in only the requested group being returned.  Valid combinations are: - &#x60;/api/groups&#x60; (all groups) - &#x60;/api/groups/my_group&#x60; (group identical to &#x60;my_group&#x60;) 
  ///
  /// Parameters:
  /// * [name] - Group name
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetGroups200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetGroups200Response>> getGroups({ 
    required String name,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/groups/{name}'.replaceAll('{' r'name' '}', name.toString());
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

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetGroups200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetGroups200Response, GetGroups200Response>(rawData, 'GetGroups200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetGroups200Response>(
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

  /// Replace group
  /// Items may be updated by replacing them. &#x60;{name}&#x60; is required.  Ensure to send all the required parameters (such as &#x60;comment&#x60;) to ensure these properties are retained. By specifying a different &#x60;name&#x60;, the group with the former name as specified in the URI will be renamed. The read-only fields &#x60;id&#x60; and &#x60;date_added&#x60; are preserved, &#x60;date_modified&#x60; is automatically updated on success. 
  ///
  /// Parameters:
  /// * [name] - Group name
  /// * [groupsPut] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReplaceGroup200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReplaceGroup200Response>> replaceGroup({ 
    required String name,
    GroupsPut? groupsPut,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/groups/{name}'.replaceAll('{' r'name' '}', name.toString());
    final _options = Options(
      method: r'PUT',
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
      contentType: 'application/json',
      validateStatus: validateStatus,
    );

    dynamic _bodyData;

    try {
_bodyData=jsonEncode(groupsPut);
    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
        ),
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    final _response = await _dio.request<Object>(
      _path,
      data: _bodyData,
      options: _options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReplaceGroup200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReplaceGroup200Response, ReplaceGroup200Response>(rawData, 'ReplaceGroup200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReplaceGroup200Response>(
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

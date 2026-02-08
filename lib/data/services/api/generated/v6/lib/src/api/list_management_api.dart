//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:pihole_v6_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:pihole_v6_api/src/model/add_auth401_response.dart';
import 'package:pihole_v6_api/src/model/batch_delete_lists_request_inner.dart';
import 'package:pihole_v6_api/src/model/get_lists200_response.dart';
import 'package:pihole_v6_api/src/model/get_search200_response.dart';
import 'package:pihole_v6_api/src/model/lists_post.dart';
import 'package:pihole_v6_api/src/model/lists_put.dart';
import 'package:pihole_v6_api/src/model/replace_domain400_response.dart';
import 'package:pihole_v6_api/src/model/replace_lists200_response.dart';
import 'package:pihole_v6_api/src/model/took.dart';

class ListManagementApi {

  final Dio _dio;

  const ListManagementApi(this._dio);

  /// Add new list
  /// Creates a new list in the &#x60;lists&#x60; object. The &#x60;{list}&#x60; itself is specified in the request body (POST JSON).  lists may be described either by their IP addresses (IPv4 and IPv6 are supported), IP subnets (CIDR notation, like &#x60;192.168.2.0/24&#x60;), their MAC addresses (like &#x60;12:34:56:78:9A:BC&#x60;), by their hostnames (like &#x60;localhost&#x60;), or by the interface they are connected to (prefaced with a colon, like &#x60;:eth0&#x60;).&lt;/p&gt;  Note that list recognition by IP addresses (incl. subnet ranges) is preferred over MAC address, host name or interface recognition as the two latter will only be available after some time. Furthermore, MAC address recognition only works for devices at most one networking hop away from your Pi-hole.  On success, a new resource is created at &#x60;/lists/{list}&#x60;.  The &#x60;database_error&#x60; with message &#x60;UNIQUE constraint failed&#x60; error indicates that this list already exists. 
  ///
  /// Parameters:
  /// * [type] - Type of list
  /// * [listsPost] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReplaceLists200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReplaceLists200Response>> addList({ 
    required String type,
    ListsPost? listsPost,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/lists';
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

    final _queryParameters = <String, dynamic>{
      r'type': type,
    };

    dynamic _bodyData;

    try {
_bodyData=jsonEncode(listsPost);
    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
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
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReplaceLists200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReplaceLists200Response, ReplaceLists200Response>(rawData, 'ReplaceLists200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReplaceLists200Response>(
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

  /// Delete lists
  /// Deletes multiple lists in the &#x60;lists&#x60; object. The &#x60;{list}&#x60;s themselves are specified in the request body (POST JSON). 
  ///
  /// Parameters:
  /// * [batchDeleteListsRequestInner] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> batchDeleteLists({ 
    required List<BatchDeleteListsRequestInner> batchDeleteListsRequestInner,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/lists:batchDelete';
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
_bodyData=jsonEncode(batchDeleteListsRequestInner);
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

  /// Delete list
  /// &#x60;{list}&#x60; and &#x60;{listtype}&#x60; are required. *Note:* There will be no content on success. 
  ///
  /// Parameters:
  /// * [list] - Address of the list
  /// * [type] - Type of list
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> deleteLists({ 
    required String list,
    required String type,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/lists/{list}'.replaceAll('{' r'list' '}', list.toString());
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

    final _queryParameters = <String, dynamic>{
      r'type': type,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    return _response;
  }

  /// Get all lists
  /// Returns all configured lists. Optionally filter by list type. 
  ///
  /// Parameters:
  /// * [type] - Type of list, optional
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetLists200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetLists200Response>> getAllLists({ 
    String? type,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/lists';
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
      if (type != null) r'type': type,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetLists200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetLists200Response, GetLists200Response>(rawData, 'GetLists200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetLists200Response>(
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

  /// Get lists
  /// &#x60;{list}&#x60; is optional. Specifying it will result in only the requested list being returned.  Valid combinations are: - &#x60;/api/lists&#x60; (all lists) - &#x60;/api/lists/my_list&#x60; (list identical to &#x60;my_list&#x60;) 
  ///
  /// Parameters:
  /// * [list] - Address of the list
  /// * [type] - Type of list, optional
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetLists200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetLists200Response>> getLists({ 
    required String list,
    String? type,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/lists/{list}'.replaceAll('{' r'list' '}', list.toString());
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
      if (type != null) r'type': type,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetLists200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetLists200Response, GetLists200Response>(rawData, 'GetLists200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetLists200Response>(
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

  /// Search domains in Pi-hole&#39;s lists
  /// Search for domains in Pi-hole&#39;s list. The specified domain is automatically converted to lowercase. The optional parameters &#x60;N&#x60; and &#x60;partial&#x60; limit the maximum number of returned records and whether partial matches should be returned, respectively. There is a hard upper limit of &#x60;N&#x60; defined in FTL (currently set to 10,000) to ensure that the response is not too large. ABP matches are not returned when partial matching is requested. International domains names (IDNs) are internally converted to punycode before matching. 
  ///
  /// Parameters:
  /// * [domain] - (Part of) domain to be searched for
  /// * [partial] - Is partial matching requested?
  /// * [N] - Maximum number of results to be returned
  /// * [debug] - Add debug information to the response
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetSearch200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetSearch200Response>> getSearch({ 
    required String domain,
    bool? partial = false,
    int? N = 20,
    bool? debug = false,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/search/{domain}'.replaceAll('{' r'domain' '}', domain.toString());
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
      if (partial != null) r'partial': partial,
      if (N != null) r'N': N,
      if (debug != null) r'debug': debug,
    };

    final _response = await _dio.request<Object>(
      _path,
      options: _options,
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    GetSearch200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetSearch200Response, GetSearch200Response>(rawData, 'GetSearch200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetSearch200Response>(
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

  /// Replace list
  /// Items may be updated by replacing them. &#x60;{list}&#x60; and &#x60;{listtype}&#x60; are required.  Ensure to send all the required parameters (such as &#x60;comment&#x60;) to ensure these properties are retained. The read-only fields &#x60;id&#x60; and &#x60;date_added&#x60; are preserved, &#x60;date_modified&#x60; is automatically updated on success. 
  ///
  /// Parameters:
  /// * [list] - Address of the list
  /// * [type] - Type of list
  /// * [listsPut] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReplaceLists200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReplaceLists200Response>> replaceLists({ 
    required String list,
    required String type,
    ListsPut? listsPut,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/lists/{list}'.replaceAll('{' r'list' '}', list.toString());
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

    final _queryParameters = <String, dynamic>{
      r'type': type,
    };

    dynamic _bodyData;

    try {
_bodyData=jsonEncode(listsPut);
    } catch(error, stackTrace) {
      throw DioException(
         requestOptions: _options.compose(
          _dio.options,
          _path,
          queryParameters: _queryParameters,
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
      queryParameters: _queryParameters,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );

    ReplaceLists200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReplaceLists200Response, ReplaceLists200Response>(rawData, 'ReplaceLists200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReplaceLists200Response>(
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

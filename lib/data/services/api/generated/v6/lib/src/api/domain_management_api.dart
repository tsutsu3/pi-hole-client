//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'dart:async';

// ignore: unused_import
import 'dart:convert';
import 'package:pihole_v6_api/src/deserialize.dart';
import 'package:dio/dio.dart';

import 'package:pihole_v6_api/src/model/add_auth401_response.dart';
import 'package:pihole_v6_api/src/model/batch_delete_domains_request_inner.dart';
import 'package:pihole_v6_api/src/model/get_domains200_response.dart';
import 'package:pihole_v6_api/src/model/post.dart';
import 'package:pihole_v6_api/src/model/replace_domain200_response.dart';
import 'package:pihole_v6_api/src/model/replace_domain400_response.dart';
import 'package:pihole_v6_api/src/model/replace_domain_request.dart';
import 'package:pihole_v6_api/src/model/took.dart';

class DomainManagementApi {

  final Dio _dio;

  const DomainManagementApi(this._dio);

  /// Add new domain
  /// Creates a new domain in the &#x60;domains&#x60; object. This may be either an exact domain or a regex, depending on &#x60;{kind}&#x60;. Both &#x60;{type}&#x60; and &#x60;{kind}&#x60; are mandatory for this endpoint. The &#x60;{domain}&#x60; itself is specified in the request body (POST JSON).  On success, a new resource is created at &#x60;/domains/{type}/{kind}/{domain}&#x60;.  The &#x60;database_error&#x60; with message &#x60;UNIQUE constraint failed&#x60; error indicates that the same entry (&#x60;domain&#x60;, &#x60;type&#x60;, &#x60;kind&#x60;) already exists.  When adding a regular expression, ensure the request body is properly JSON-escaped. 
  ///
  /// Parameters:
  /// * [type] - Type (allowed or denied domain)
  /// * [kind] - Kind (exact domain or regular expression)
  /// * [post] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReplaceDomain200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReplaceDomain200Response>> addDomain({ 
    required String type,
    required String kind,
    Post? post,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains/{type}/{kind}'.replaceAll('{' r'type' '}', type.toString()).replaceAll('{' r'kind' '}', kind.toString());
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
_bodyData=jsonEncode(post);
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

    ReplaceDomain200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReplaceDomain200Response, ReplaceDomain200Response>(rawData, 'ReplaceDomain200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReplaceDomain200Response>(
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

  /// Delete multiple domains
  /// *Note:* There will be no content on success. 
  ///
  /// Parameters:
  /// * [batchDeleteDomainsRequestInner] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> batchDeleteDomains({ 
    required List<BatchDeleteDomainsRequestInner> batchDeleteDomainsRequestInner,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains:batchDelete';
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
_bodyData=jsonEncode(batchDeleteDomainsRequestInner);
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

  /// Delete domain
  /// *Note:* There will be no content on success. 
  ///
  /// Parameters:
  /// * [type] - Type (allowed or denied domain)
  /// * [kind] - Kind (exact domain or regular expression)
  /// * [domain] - Domain
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future]
  /// Throws [DioException] if API call or serialization fails
  Future<Response<void>> deleteDomain({ 
    required String type,
    required String kind,
    required String domain,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains/{type}/{kind}/{domain}'.replaceAll('{' r'type' '}', type.toString()).replaceAll('{' r'kind' '}', kind.toString()).replaceAll('{' r'domain' '}', domain.toString());
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

  /// Get all domains
  /// Returns all configured domains (allow and deny, exact and regex). 
  ///
  /// Parameters:
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetDomains200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetDomains200Response>> getAllDomains({ 
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains';
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

    GetDomains200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetDomains200Response, GetDomains200Response>(rawData, 'GetDomains200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetDomains200Response>(
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

  /// Get domain
  /// &#x60;{type}&#x60;, &#x60;{kind}&#x60;, and &#x60;{domain}&#x60; are optional. Specifying any of these may result in only a subset of the available data being returned.  Valid combinations are: - &#x60;/api/domains&#x60; (all domains) - &#x60;/api/domains/abc.com&#x60; (all domains identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/allow&#x60; (only allowed domains) - &#x60;/api/domains/allow/abc.com&#x60; (only allowed domains identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/allow/exact&#x60; (only exactly allowed domains) - &#x60;/api/domains/allow/exact/abc.com&#x60; (only exactly allowed domain identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/allow/regex&#x60; (only allowed regex domains) - &#x60;/api/domains/allow/regex/abc.com&#x60; (only allowed regex domains identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/deny&#x60; (only denied domains) - &#x60;/api/domains/deny/abc.com&#x60; (only denied domains identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/deny/exact&#x60; (only exactly denied domains) - &#x60;/api/domains/deny/exact/abc.com&#x60; (only exactly denied domain identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/deny/regex&#x60; (only denied regex domains) - &#x60;/api/domains/deny/regex/abc.com&#x60; (only denied regex domains identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/exact&#x60; (allowed and denied exact domains) - &#x60;/api/domains/exact/abc.com&#x60; (allowed and denied exact domains identical to &#x60;abc.com&#x60;) - &#x60;/api/domains/regex&#x60; (allowed and denied regex domains) - &#x60;/api/domains/regex/abc.com&#x60; (allowed and denied regex domains identical to &#x60;abc.com&#x60;) 
  ///
  /// Parameters:
  /// * [type] - Type (allowed or denied domain)
  /// * [kind] - Kind (exact domain or regular expression)
  /// * [domain] - Domain
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetDomains200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetDomains200Response>> getDomains({ 
    required String type,
    required String kind,
    required String domain,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains/{type}/{kind}/{domain}'.replaceAll('{' r'type' '}', type.toString()).replaceAll('{' r'kind' '}', kind.toString()).replaceAll('{' r'domain' '}', domain.toString());
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

    GetDomains200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetDomains200Response, GetDomains200Response>(rawData, 'GetDomains200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetDomains200Response>(
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

  /// Get domains by type and kind
  /// Returns domains filtered by type (allow/deny) and kind (exact/regex). 
  ///
  /// Parameters:
  /// * [type] - Type (allowed or denied domain)
  /// * [kind] - Kind (exact domain or regular expression)
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [GetDomains200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<GetDomains200Response>> getDomainsByTypeKind({ 
    required String type,
    required String kind,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains/{type}/{kind}'.replaceAll('{' r'type' '}', type.toString()).replaceAll('{' r'kind' '}', kind.toString());
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

    GetDomains200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<GetDomains200Response, GetDomains200Response>(rawData, 'GetDomains200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<GetDomains200Response>(
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

  /// Replace domain
  /// Items may be updated by replacing them. &#x60;{type}&#x60;, &#x60;{kind}&#x60;, and &#x60;{domain}&#x60; are required.  Ensure to send all the required parameters (such as &#x60;comment&#x60;) to ensure these properties are retained. The read-only fields &#x60;id&#x60; and &#x60;date_added&#x60; are preserved, &#x60;date_modified&#x60; is automatically updated on success.  You can move existing domains to another list type/kind by &#x60;PUT&#x60;ting the domain to the new destination by specifying the optional fields &#x60;type&#x60; and &#x60;kind&#x60;. Example: Use &#x60;PUT allow/exact/abc.com&#x60; with &#x60;type&#x3D;\&quot;deny\&quot;, kind&#x3D;\&quot;exact\&quot;&#x60; to change &#x60;abc.com&#x60; from exact denied to exact allowed. Make sure to always specify *both* values.  When adding/replacing a regular expression, ensure that &#x60;{domain}&#x60; is properly URI-escaped. 
  ///
  /// Parameters:
  /// * [type] - Type (allowed or denied domain)
  /// * [kind] - Kind (exact domain or regular expression)
  /// * [domain] - Domain
  /// * [replaceDomainRequest] - Callback payload
  /// * [cancelToken] - A [CancelToken] that can be used to cancel the operation
  /// * [headers] - Can be used to add additional headers to the request
  /// * [extras] - Can be used to add flags to the request
  /// * [validateStatus] - A [ValidateStatus] callback that can be used to determine request success based on the HTTP status of the response
  /// * [onSendProgress] - A [ProgressCallback] that can be used to get the send progress
  /// * [onReceiveProgress] - A [ProgressCallback] that can be used to get the receive progress
  ///
  /// Returns a [Future] containing a [Response] with a [ReplaceDomain200Response] as data
  /// Throws [DioException] if API call or serialization fails
  Future<Response<ReplaceDomain200Response>> replaceDomain({ 
    required String type,
    required String kind,
    required String domain,
    ReplaceDomainRequest? replaceDomainRequest,
    CancelToken? cancelToken,
    Map<String, dynamic>? headers,
    Map<String, dynamic>? extra,
    ValidateStatus? validateStatus,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    final _path = r'/domains/{type}/{kind}/{domain}'.replaceAll('{' r'type' '}', type.toString()).replaceAll('{' r'kind' '}', kind.toString()).replaceAll('{' r'domain' '}', domain.toString());
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
_bodyData=jsonEncode(replaceDomainRequest);
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

    ReplaceDomain200Response? _responseData;

    try {
final rawData = _response.data;
_responseData = rawData == null ? null : deserialize<ReplaceDomain200Response, ReplaceDomain200Response>(rawData, 'ReplaceDomain200Response', growable: true);

    } catch (error, stackTrace) {
      throw DioException(
        requestOptions: _response.requestOptions,
        response: _response,
        type: DioExceptionType.unknown,
        error: error,
        stackTrace: stackTrace,
      );
    }

    return Response<ReplaceDomain200Response>(
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

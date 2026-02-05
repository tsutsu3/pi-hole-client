//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

import 'package:dio/dio.dart';
import 'package:pihole_v6_api/src/auth/api_key_auth.dart';
import 'package:pihole_v6_api/src/auth/basic_auth.dart';
import 'package:pihole_v6_api/src/auth/bearer_auth.dart';
import 'package:pihole_v6_api/src/auth/oauth.dart';
import 'package:pihole_v6_api/src/api/actions_api.dart';
import 'package:pihole_v6_api/src/api/authentication_api.dart';
import 'package:pihole_v6_api/src/api/client_management_api.dart';
import 'package:pihole_v6_api/src/api/dhcp_api.dart';
import 'package:pihole_v6_api/src/api/dns_control_api.dart';
import 'package:pihole_v6_api/src/api/documentation_api.dart';
import 'package:pihole_v6_api/src/api/domain_management_api.dart';
import 'package:pihole_v6_api/src/api/ftl_information_api.dart';
import 'package:pihole_v6_api/src/api/group_management_api.dart';
import 'package:pihole_v6_api/src/api/list_management_api.dart';
import 'package:pihole_v6_api/src/api/metrics_api.dart';
import 'package:pihole_v6_api/src/api/network_information_api.dart';
import 'package:pihole_v6_api/src/api/padd_api.dart';
import 'package:pihole_v6_api/src/api/pi_hole_configuration_api.dart';

class PiholeV6Api {
  static const String basePath = r'https://pi.hole:443/api';

  final Dio dio;
  PiholeV6Api({
    Dio? dio,
    String? basePathOverride,
    List<Interceptor>? interceptors,
  })  : 
        this.dio = dio ??
            Dio(BaseOptions(
              baseUrl: basePathOverride ?? basePath,
              connectTimeout: const Duration(milliseconds: 5000),
              receiveTimeout: const Duration(milliseconds: 3000),
            )) {
    if (interceptors == null) {
      this.dio.interceptors.addAll([
        OAuthInterceptor(),
        BasicAuthInterceptor(),
        BearerAuthInterceptor(),
        ApiKeyAuthInterceptor(),
      ]);
    } else {
      this.dio.interceptors.addAll(interceptors);
    }
  }

  void setOAuthToken(String name, String token) {
    if (this.dio.interceptors.any((i) => i is OAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is OAuthInterceptor) as OAuthInterceptor).tokens[name] = token;
    }
  }

  void setBearerAuth(String name, String token) {
    if (this.dio.interceptors.any((i) => i is BearerAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BearerAuthInterceptor) as BearerAuthInterceptor).tokens[name] = token;
    }
  }

  void setBasicAuth(String name, String username, String password) {
    if (this.dio.interceptors.any((i) => i is BasicAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((i) => i is BasicAuthInterceptor) as BasicAuthInterceptor).authInfo[name] = BasicAuthInfo(username, password);
    }
  }

  void setApiKey(String name, String apiKey) {
    if (this.dio.interceptors.any((i) => i is ApiKeyAuthInterceptor)) {
      (this.dio.interceptors.firstWhere((element) => element is ApiKeyAuthInterceptor) as ApiKeyAuthInterceptor).apiKeys[name] = apiKey;
    }
  }

  /// Get ActionsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ActionsApi getActionsApi() {
    return ActionsApi(dio);
  }

  /// Get AuthenticationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  AuthenticationApi getAuthenticationApi() {
    return AuthenticationApi(dio);
  }

  /// Get ClientManagementApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ClientManagementApi getClientManagementApi() {
    return ClientManagementApi(dio);
  }

  /// Get DHCPApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DHCPApi getDHCPApi() {
    return DHCPApi(dio);
  }

  /// Get DNSControlApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DNSControlApi getDNSControlApi() {
    return DNSControlApi(dio);
  }

  /// Get DocumentationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DocumentationApi getDocumentationApi() {
    return DocumentationApi(dio);
  }

  /// Get DomainManagementApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  DomainManagementApi getDomainManagementApi() {
    return DomainManagementApi(dio);
  }

  /// Get FTLInformationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  FTLInformationApi getFTLInformationApi() {
    return FTLInformationApi(dio);
  }

  /// Get GroupManagementApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  GroupManagementApi getGroupManagementApi() {
    return GroupManagementApi(dio);
  }

  /// Get ListManagementApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  ListManagementApi getListManagementApi() {
    return ListManagementApi(dio);
  }

  /// Get MetricsApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  MetricsApi getMetricsApi() {
    return MetricsApi(dio);
  }

  /// Get NetworkInformationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  NetworkInformationApi getNetworkInformationApi() {
    return NetworkInformationApi(dio);
  }

  /// Get PADDApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PADDApi getPADDApi() {
    return PADDApi(dio);
  }

  /// Get PiHoleConfigurationApi instance, base route and serializer can be overridden by a given but be careful,
  /// by doing that all interceptors will not be executed
  PiHoleConfigurationApi getPiHoleConfigurationApi() {
    return PiHoleConfigurationApi(dio);
  }
}

import 'package:pi_hole_client/data/repositories/local/secure_data_repository.dart';
// import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:pi_hole_client/data/services/local/secure_storage_service.dart';

/// Model class for Pi-hole server
///
/// This class is used to store information about a Pi-hole server.
class Server {
  Server({
    required this.address,
    required this.alias,
    required this.defaultServer,
    required this.apiVersion,
    required this.allowSelfSignedCert,
    required this.ignoreCertificateErrors,
    this.pinnedCertificateSha256,
    this.enabled,
    SecureDataRepository? sm,
  }) : sm = sm ?? SecureDataRepository(SecureStorageService(), address);

  /// Pi-hole server IP address with port. Expected unique.
  final String address;

  /// Pi-hole server alias
  final String alias;

  /// Whether this server is the default server
  final bool defaultServer;

  /// Wheter this server is enabled(selected)
  final bool? enabled;

  /// Pi-hole API version
  final String apiVersion;

  /// Whether to allow self-signed certificates
  final bool allowSelfSignedCert;

  /// Whether to skip TLS certificate validation entirely.
  final bool ignoreCertificateErrors;

  /// Pinned SHA-256 certificate fingerprint for self-signed TLS connections.
  ///
  /// When set, TLS connections that would otherwise fail certificate validation
  /// may be allowed only if the server's certificate fingerprint matches this value.
  final String? pinnedCertificateSha256;

  /// Session manager (Use only v5)
  final SecureDataRepository sm;

  Server copyWith({
    String? address,
    String? alias,
    bool? defaultServer,
    bool? enabled,
    String? apiVersion,
    bool? allowSelfSignedCert,
    bool? ignoreCertificateErrors,
    String? pinnedCertificateSha256,
    SecureDataRepository? sm,
  }) {
    return Server(
      address: address ?? this.address,
      alias: alias ?? this.alias,
      defaultServer: defaultServer ?? this.defaultServer,
      enabled: enabled ?? this.enabled,
      apiVersion: apiVersion ?? this.apiVersion,
      allowSelfSignedCert: allowSelfSignedCert ?? this.allowSelfSignedCert,
      ignoreCertificateErrors:
          ignoreCertificateErrors ?? this.ignoreCertificateErrors,
      pinnedCertificateSha256:
          pinnedCertificateSha256 ?? this.pinnedCertificateSha256,
      sm: sm ?? this.sm,
    );
  }
}

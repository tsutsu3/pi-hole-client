import 'package:pi_hole_client/data2/services/storage/secure_storage.dart';
import 'package:pi_hole_client/services/secret_manager.dart';

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
    this.enabled,
    SecretManager? sm,
  }) : sm = sm ?? SecretManager(SecureStorageRepository(), address);

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

  /// Session manager (Use only v5)
  final SecretManager sm;

  Server copyWith({
    String? address,
    String? alias,
    bool? defaultServer,
    bool? enabled,
    String? apiVersion,
    bool? allowSelfSignedCert,
    SecretManager? sm,
  }) {
    return Server(
      address: address ?? this.address,
      alias: alias ?? this.alias,
      defaultServer: defaultServer ?? this.defaultServer,
      enabled: enabled ?? this.enabled,
      apiVersion: apiVersion ?? this.apiVersion,
      allowSelfSignedCert: allowSelfSignedCert ?? this.allowSelfSignedCert,
      sm: sm ?? this.sm,
    );
  }
}

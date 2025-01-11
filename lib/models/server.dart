import 'package:pi_hole_client/repository/secure_storage.dart';
import 'package:pi_hole_client/services/secret_manager.dart';

/// Model class for Pi-hole server
///
/// This class is used to store information about a Pi-hole server.
class Server {
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

  /// Basic authentication username (Use only v5)
  final String? basicAuthUser;

  /// Basic authentication password (Use only v5)
  final String? basicAuthPassword;

  /// Session manager (Use only v5)
  final SecretManager sm;

  Server({
    required this.address,
    required this.alias,
    required this.defaultServer,
    this.enabled,
    required this.apiVersion,
    this.basicAuthUser,
    this.basicAuthPassword,
    SecretManager? sm,
  }) : sm = sm ?? SecretManager(SecureStorageRepository(), address);

  Server copyWith({
    String? address,
    String? alias,
    bool? defaultServer,
    bool? enabled,
    String? apiVersion,
    String? basicAuthUser,
    String? basicAuthPassword,
    SecretManager? sm,
  }) {
    return Server(
      address: address ?? this.address,
      alias: alias ?? this.alias,
      defaultServer: defaultServer ?? this.defaultServer,
      enabled: enabled ?? this.enabled,
      apiVersion: apiVersion ?? this.apiVersion,
      basicAuthUser: basicAuthUser ?? this.basicAuthUser,
      basicAuthPassword: basicAuthPassword ?? this.basicAuthPassword,
      sm: sm ?? this.sm,
    );
  }
}

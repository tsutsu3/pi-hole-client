/// Model class for Pi-hole server
///
/// This class is used to store information about a Pi-hole server.
class Server {
  /// Pi-hole server IP address with port. Expected unique.
  final String address;

  /// Pi-hole server alias
  String alias;

  /// Pi-hole server API token
  String? token;

  /// Whether this server is the default server
  bool defaultServer;

  /// Wheter this server is enabled(selected)
  bool? enabled;

  /// Pi-hole API version
  String apiVersion;

  /// Basic authentication username
  String? basicAuthUser;

  /// Basic authentication password
  String? basicAuthPassword;

  Server({
    required this.address,
    required this.alias,
    this.token,
    required this.defaultServer,
    this.enabled,
    required this.apiVersion,
    this.basicAuthUser,
    this.basicAuthPassword,
  });
}

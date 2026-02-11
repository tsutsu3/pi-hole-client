import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';

class RepositoryBundle {
  const RepositoryBundle({
    required this.auth,
    required this.serverAddress,
  });

  final AuthRepository auth;
  final String serverAddress;
}

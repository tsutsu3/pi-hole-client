import 'package:pi_hole_client/data/repositories/api/v5/base_v5_token_repository.dart';

class FakeBaseV5TokenRepository implements BaseV5TokenRepository {
  bool shouldFail = false;

  @override
  Future<String> getToken() async {
    if (shouldFail) {
      throw Exception('Failed to get token');
    }
    return 'token123';
  }

  @override
  Future<void> clearToken() async {}
}

import 'package:pi_hole_client/data/services/local/session_credential_service.dart';
import 'package:result_dart/result_dart.dart';

class FakeSessionCredentialService implements SessionCredentialService {
  bool shouldFailSave = false;
  bool shouldFailRead = false;
  bool shouldFailDelete = false;

  String addressPassword = 'pass123';
  String addressToken = 'token123';
  String addressSid = 'sid123';

  @override
  Future<Result<String>> get password async {
    if (shouldFailRead) {
      return Failure(Exception('Forced read failure'));
    }
    return Success(addressPassword);
  }

  @override
  Future<Result<String>> get token async {
    if (shouldFailRead) {
      return Failure(Exception('Forced read failure'));
    }
    return Success(addressToken);
  }

  @override
  Future<Result<String>> get sid async {
    if (shouldFailRead) {
      return Failure(Exception('Forced read failure'));
    }
    return Success(addressSid);
  }

  @override
  Future<Result<void>> saveSid(String sid) async {
    if (shouldFailSave) {
      return Failure(Exception('Forced save failure'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> deleteSid() async {
    if (shouldFailDelete) {
      return Failure(Exception('Forced delete failure'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> savePassword(String password) async {
    if (shouldFailSave) {
      return Failure(Exception('Forced save failure'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> saveToken(String token) async {
    if (shouldFailSave) {
      return Failure(Exception('Forced save failure'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> deletePassword() async {
    if (shouldFailDelete) {
      return Failure(Exception('Forced delete failure'));
    }
    return Success.unit();
  }

  @override
  Future<Result<void>> deleteToken() async {
    if (shouldFailDelete) {
      return Failure(Exception('Forced delete failure'));
    }
    return Success.unit();
  }
}

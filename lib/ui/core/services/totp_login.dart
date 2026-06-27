import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/ui/core/types/resolve_totp.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:result_dart/result_dart.dart';

/// Logs in, prompting for a 6-digit TOTP code when the server requires 2FA and
/// re-prompting on a rejected code.
///
/// The first attempt sends the password only. A 2FA server answers with
/// [TotpRequiredException]; the loop then collects a code via [resolveTotp] and
/// retries with `password + totp`, looping on [TotpInvalidException] /
/// [TotpReusedException]. Any other failure (e.g. a rate limit) is terminal and
/// returned as-is. Returns `cancelled: true` when the user dismisses the prompt.
Future<({bool cancelled, Result<Auth> result})> runTotpLogin({
  required AuthRepository auth,
  required String password,
  required ResolveTotp resolveTotp,
}) async {
  var result = await auth.createSession(password);
  if (result.isSuccess()) return (cancelled: false, result: result);
  if (result.exceptionOrNull() is! TotpRequiredException) {
    return (cancelled: false, result: result);
  }

  // Server requires 2FA.
  TotpPromptError? promptError;
  while (true) {
    final code = await resolveTotp(error: promptError);
    if (code == null) return (cancelled: true, result: result);

    result = await auth.createSession(password, totp: code);
    if (result.isSuccess()) return (cancelled: false, result: result);

    final err = result.exceptionOrNull();
    if (err is TotpInvalidException) {
      promptError = TotpPromptError.invalid;
      continue;
    }
    if (err is TotpReusedException) {
      promptError = TotpPromptError.reused;
      continue;
    }
    // Rate limit or any other error is terminal - stop re-prompting.
    return (cancelled: false, result: result);
  }
}

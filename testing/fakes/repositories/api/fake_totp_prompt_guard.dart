import 'package:pi_hole_client/data/repositories/api/v6/totp_prompt_guard.dart';

/// A fake [TotpPromptGuard] that keeps the cancelled addresses in a set and
/// records each call.
class FakeTotpPromptGuard implements TotpPromptGuard {
  final Set<String> declined = {};

  final List<String> declinedAddresses = [];
  final List<String> allowedAddresses = [];

  @override
  bool isDeclined(String address) => declined.contains(address);

  @override
  void decline(String address) {
    declined.add(address);
    declinedAddresses.add(address);
  }

  @override
  void allowPrompt(String address) {
    declined.remove(address);
    allowedAddresses.add(address);
  }
}

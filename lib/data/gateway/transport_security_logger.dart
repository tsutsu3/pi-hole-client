import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/utils/logger.dart';

/// Utility class for logging transport security policies.
///
/// This class handles logging of SSL/TLS certificate configuration details
/// for each unique server address. It ensures that each server configuration
/// is logged only once to avoid log spam.
class TransportSecurityLogger {
  static final Set<String> _loggedTransportSecurityPolicies = <String>{};

  /// Logs the transport security policy for a server once per unique configuration.
  ///
  /// Parameters:
  /// - [server]: The Pi-hole server object containing address and certificate settings
  static void logTransportSecurityPolicyOnce(Server server) {
    Uri? uri;
    try {
      uri = Uri.parse(server.address);
    } catch (_) {
      return;
    }

    final key =
        '${uri.scheme}://${uri.host}:${uri.hasPort ? uri.port : (uri.scheme == 'https' ? 443 : 80)}'
        ':allowSelfSigned=${server.allowSelfSignedCert}'
        ':ignoreCertErrors=${server.ignoreCertificateErrors}'
        ':pinSet=${server.pinnedCertificateSha256?.isNotEmpty == true}';

    if (!_loggedTransportSecurityPolicies.add(key)) return;

    if (uri.scheme == 'http') {
      logger.w('Transport security: HTTP (cleartext) for ${uri.host}.');
      return;
    }

    if (uri.scheme != 'https') {
      logger.w(
        'Transport security: unknown scheme "${uri.scheme}" for ${uri.host}.',
      );
      return;
    }

    if (server.ignoreCertificateErrors) {
      logger.w(
        'Transport security: HTTPS certificate validation ignored (ignoreCertificateErrors=true) for ${uri.host}.',
      );
      return;
    }

    if (!server.allowSelfSignedCert) {
      logger.i(
        'Transport security: HTTPS with platform TLS validation only (allowSelfSignedCert=false) for ${uri.host}.',
      );
      return;
    }

    if (server.pinnedCertificateSha256 == null ||
        server.pinnedCertificateSha256!.isEmpty) {
      logger.w(
        'Transport security: HTTPS with allowSelfSignedCert=true but no pin set; untrusted certificates may be accepted (legacy behavior) for ${uri.host}.',
      );
      return;
    }

    logger.i(
      'Transport security: HTTPS with platform TLS validation and pin fallback enabled for ${uri.host} (pin is checked only when TLS validation fails).',
    );
  }
}

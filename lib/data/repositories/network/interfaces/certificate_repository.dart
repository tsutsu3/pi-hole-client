import 'package:pi_hole_client/domain/model/server/certificate_inspection.dart';

/// Inspects the live TLS certificate of a server.
// ignore: one_member_abstracts
abstract interface class CertificateRepository {
  /// Returns the live certificate inspection for [uri], or `null` when it
  /// cannot be obtained (non-HTTPS, timeout, or connection error).
  Future<CertificateInspection?> inspect(Uri uri, {Duration timeout});
}

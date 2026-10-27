/// @docImport 'package:pi_hole_client/ui/core/ui/certificate/certificate_trust_flow.dart';
library;

import 'package:pi_hole_client/domain/model/server/server.dart';

/// Checks the certificate of [Server] before it is saved, returning the
/// server to save (possibly with a pinned fingerprint) or `null` when the
/// user cancels or the certificate is blocked.
///
/// The dialog and the error snackbar live in the UI; callers only decide what
/// to do with the result.
///
/// In the app, the add/edit screen passes a function that calls
/// [CertificateTrustFlow.checkBeforeSave].
typedef ResolveCertificate = Future<Server?> Function(Server server);

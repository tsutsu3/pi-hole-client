/// @docImport 'package:pi_hole_client/ui/core/ui/modals/confirm_pin_modal.dart';
library;

import 'package:pi_hole_client/utils/tls_certificate.dart';

/// Shows the certificate [info] and asks the user whether to pin it.
/// Returns true when the user confirms, false when the user cancels.
///
/// The dialog lives in the UI; callers only decide what to do with the
/// result.
///
/// In the app, it calls [showConfirmPinModal].
typedef ConfirmPin = Future<bool> Function(TlsCertificateInfo info);

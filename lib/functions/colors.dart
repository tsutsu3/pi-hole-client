import 'dart:math';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/functions/misc.dart';

Color generateRandomColor() {
  Random rnd = Random();
  return Color.fromRGBO(
    (0 + rnd.nextInt(255 - 0)),
    (0 + rnd.nextInt(255 - 0)),
    (0 + rnd.nextInt(255 - 0)),
    1,
  );
}

/// Returns the appropriate text color for a list item based on the current theme.
///
/// - **Android 12 and above**: Uses the system-determined color (`listTileTheme.textColor`).
/// - **Android 11 and below, or other OS**: Uses the default body text color (`textTheme.bodyMedium.color`).
Color getListTextColor(BuildContext context) {
  final androidVersion = getAndroidVersion();

  if (androidVersion >= 12) {
    return Theme.of(context).listTileTheme.textColor ?? Colors.grey;
  }
  return Theme.of(context).textTheme.bodyMedium?.color ?? Colors.grey;
}

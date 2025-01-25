// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/globals.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';

void showSuccessSnackBar({
  required BuildContext context,
  required AppConfigProvider appConfigProvider,
  required String label,
}) {
  showSnackBar(
    context: context,
    appConfigProvider: appConfigProvider,
    label: label,
    colorSelector: (theme) => theme.snackBarSuccess!,
    labelColorSelector: (theme) => theme.snackBarSuccessText!,
  );
}

void showErrorSnackBar({
  required BuildContext context,
  required AppConfigProvider appConfigProvider,
  required String label,
}) {
  showSnackBar(
    context: context,
    appConfigProvider: appConfigProvider,
    label: label,
    colorSelector: (theme) => theme.snackBarError!,
    labelColorSelector: (theme) => theme.snackBarErrorText!,
  );
}

void showNeutralSnackBar({
  required BuildContext context,
  required AppConfigProvider appConfigProvider,
  required String label,
}) {
  showSnackBar(
    context: context,
    appConfigProvider: appConfigProvider,
    label: label,
    colorSelector: (theme) => theme.snackBarNeutral!,
    labelColorSelector: (theme) => theme.snackBarNeutralText!,
  );
}

Future<void> showSnackBar({
  required BuildContext context,
  required AppConfigProvider appConfigProvider,
  required String label,
  required Color Function(AppColors) colorSelector,
  Color Function(AppColors)? labelColorSelector,
}) async {
  if (appConfigProvider.showingSnackbar) {
    scaffoldMessengerKey.currentState?.clearSnackBars();
    await Future.delayed(const Duration(milliseconds: 500));
  }
  appConfigProvider.setShowingSnackbar(true);

  final theme = Theme.of(context).extension<AppColors>()!;
  final backgroundColor = colorSelector(theme);
  final textColor = labelColorSelector?.call(theme) ?? Colors.white;

  final snackBar = SnackBar(
    content: Text(
      label,
      style: TextStyle(color: textColor),
    ),
    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 3),
  );

  await scaffoldMessengerKey.currentState
      ?.showSnackBar(snackBar)
      .closed
      .then((_) => appConfigProvider.setShowingSnackbar(false));
}

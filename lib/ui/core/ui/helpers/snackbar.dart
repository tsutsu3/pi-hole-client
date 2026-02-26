import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/globals.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';

void showSuccessSnackBar({
  required BuildContext context,
  required AppConfigViewModel appConfigViewModel,
  required String label,
  int? duration = 3,
}) {
  showSnackBar(
    context: context,
    appConfigViewModel: appConfigViewModel,
    label: label,
    colorSelector: (theme) => theme.snackBarSuccess!,
    labelColorSelector: (theme) => theme.snackBarSuccessText!,
    duration: duration!,
  );
}

void showCautionSnackBar({
  required BuildContext context,
  required AppConfigViewModel appConfigViewModel,
  required String label,
  int? duration = 3,
}) {
  showSnackBar(
    context: context,
    appConfigViewModel: appConfigViewModel,
    label: label,
    colorSelector: (theme) => theme.snackBarCaution!,
    labelColorSelector: (theme) => theme.snackBarCautionText!,
    duration: duration!,
  );
}

void showErrorSnackBar({
  required BuildContext context,
  required AppConfigViewModel appConfigViewModel,
  required String label,
  int? duration = 3,
}) {
  showSnackBar(
    context: context,
    appConfigViewModel: appConfigViewModel,
    label: label,
    colorSelector: (theme) => theme.snackBarError!,
    labelColorSelector: (theme) => theme.snackBarErrorText!,
    duration: duration!,
  );
}

void showNeutralSnackBar({
  required BuildContext context,
  required AppConfigViewModel appConfigViewModel,
  required String label,
  int? duration = 3,
}) {
  showSnackBar(
    context: context,
    appConfigViewModel: appConfigViewModel,
    label: label,
    colorSelector: (theme) => theme.snackBarNeutral!,
    labelColorSelector: (theme) => theme.snackBarNeutralText!,
    duration: duration!,
  );
}

Future<void> showSnackBar({
  required BuildContext context,
  required AppConfigViewModel appConfigViewModel,
  required String label,
  required Color Function(AppColors) colorSelector,
  required int duration,
  Color Function(AppColors)? labelColorSelector,
}) async {
  if (appConfigViewModel.showingSnackbar) {
    scaffoldMessengerKey.currentState?.clearSnackBars();
    await Future.delayed(const Duration(milliseconds: 500));
  }
  appConfigViewModel.setShowingSnackbar(true);

  if (!context.mounted) return;

  final theme = Theme.of(context).extension<AppColors>()!;
  final backgroundColor = colorSelector(theme);
  final textColor = labelColorSelector?.call(theme) ?? Colors.white;

  final snackBar = SnackBar(
    content: Text(label, style: TextStyle(color: textColor)),
    backgroundColor: backgroundColor,
    duration: Duration(seconds: duration),
  );

  await scaffoldMessengerKey.currentState
      ?.showSnackBar(snackBar)
      .closed
      .then((_) => appConfigViewModel.setShowingSnackbar(false));
}

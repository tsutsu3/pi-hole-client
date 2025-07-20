import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';

class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    required this.message,
    this.fontSize,
    this.fontColor,
    super.key,
  });

  final String message;
  final double? fontSize;
  final Color? fontColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error,
            size: 60,
            color: Theme.of(context).colorScheme.error,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.noticeError,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 32),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: fontSize ?? 16,
              height: 1.5,
              color: fontColor,
            ),
          ),
        ],
      ),
    );
  }
}

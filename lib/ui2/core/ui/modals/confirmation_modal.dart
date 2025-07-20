import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';

class ConfirmationModal extends StatelessWidget {
  const ConfirmationModal({
    required this.title,
    required this.message,
    required this.onConfirm,
    this.submessage,
    this.confirmButtonText,
    this.icon,
    this.confirmButtonColor,
    this.confirmButtonTextColor,
    super.key,
  });

  final String title;
  final String message;
  final VoidCallback onConfirm;
  final String? submessage;
  final String? confirmButtonText;
  final IconData? icon;
  final Color? confirmButtonColor;
  final Color? confirmButtonTextColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return AlertDialog(
      title: Column(
        children: [
          Icon(
            icon ?? Icons.help_outline,
            size: 24,
            color: colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(color: colorScheme.onSurface),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(color: colorScheme.onSurface),
          ),
          if (submessage != null) ...[
            const SizedBox(height: 8),
            Text(
              submessage!,
              style: const TextStyle(fontStyle: FontStyle.italic),
            ),
          ],
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              style: TextButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 24),
              ),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: TextStyle(
                  color: colorScheme.onSurface..withValues(alpha: 0.8),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: onConfirm,
              style: ElevatedButton.styleFrom(
                backgroundColor: confirmButtonColor ?? Colors.redAccent,
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                confirmButtonText ?? AppLocalizations.of(context)!.confirm,
                style: TextStyle(
                  color: confirmButtonTextColor ?? Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';

class DeleteModal extends StatelessWidget {
  const DeleteModal({
    required this.title,
    required this.message,
    required this.onDelete,
    this.submessage,
    super.key,
  });

  final String title;
  final String message;
  final VoidCallback onDelete;
  final String? submessage;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.delete_rounded,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            message,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
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
                  color: Theme.of(context)
                      .colorScheme
                      .onSurface
                      .withValues(alpha: 0.8),
                ),
              ),
            ),
            const SizedBox(width: 16),
            ElevatedButton(
              onPressed: onDelete,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.redAccent,
                elevation: 0,
                shadowColor: Colors.transparent,
              ),
              child: Text(
                AppLocalizations.of(context)!.delete,
                style: TextStyle(
                  color: Colors.white.withValues(alpha: 0.9),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

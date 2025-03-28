import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';

class DeleteSubscriptionModal extends StatelessWidget {
  const DeleteSubscriptionModal({required this.onConfirm, super.key});

  final void Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        children: [
          Icon(
            Icons.delete,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          const SizedBox(height: 16),
          Text(
            AppLocalizations.of(context)!.deleteAdlist,
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
        ],
      ),
      content: Text(
        AppLocalizations.of(context)!.deleteAdlistMessage,
        style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              child: Text(AppLocalizations.of(context)!.cancel),
            ),
            const SizedBox(width: 16),
            TextButton(
              onPressed: onConfirm,
              child: Text(AppLocalizations.of(context)!.confirm),
            ),
          ],
        ),
      ],
    );
  }
}

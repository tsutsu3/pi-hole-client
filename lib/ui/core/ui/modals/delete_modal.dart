import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/modals/confirmation_modal.dart';

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
    return ConfirmationModal(
      title: title,
      message: message,
      submessage: submessage,
      onConfirm: onDelete,
      confirmButtonText: AppLocalizations.of(context)!.delete,
      icon: Icons.delete_rounded,
      confirmButtonColor: Colors.redAccent,
      confirmButtonTextColor: Colors.white,
    );
  }
}

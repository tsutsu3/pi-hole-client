import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DomainCommentModal extends StatelessWidget {
  const DomainCommentModal({super.key, required this.comment});

  final String comment;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        children: [
          Icon(
            Icons.comment_rounded,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppLocalizations.of(context)!.comment,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      content: Text(
        comment,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.maybePop(context),
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }
}

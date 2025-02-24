import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/domain.dart';

class DomainCommentModal extends StatefulWidget {
  const DomainCommentModal({
    required this.domain,
    required this.readonly,
    super.key,
  });

  final Domain domain;
  final bool readonly;

  @override
  State<DomainCommentModal> createState() => _DomainCommentModalState();
}

class _DomainCommentModalState extends State<DomainCommentModal> {
  late TextEditingController _commentController;
  late bool readonly = widget.readonly;

  bool isSaveEnabled = false;

  @override
  void initState() {
    super.initState();
    _commentController = TextEditingController(text: widget.domain.comment);
    _commentController.addListener(() {
      setState(() {
        isSaveEnabled = _commentController.text != widget.domain.comment;
      });
    });
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

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
      content: readonly
          // v5: read only, because the API does not support updating comments
          ? Text(
              widget.domain.comment == ''
                  ? AppLocalizations.of(context)!.noComment
                  : widget.domain.comment!,
              style: TextStyle(fontSize: 16, color: Colors.grey[700]),
            )
          // v6: editable
          : TextField(
              controller: _commentController,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                hintText: AppLocalizations.of(context)!.enterComment,
              ),
              maxLines: 5,
              minLines: 1,
            ),
      actions: [
        TextButton(
          onPressed: () => Navigator.maybePop(context, widget.domain.comment),
          child: Text(AppLocalizations.of(context)!.cancel),
        ),
        const SizedBox(width: 14),
        if (!readonly)
          TextButton(
            onPressed: isSaveEnabled
                ? () async {
                    await Navigator.maybePop(context, _commentController.text);
                  }
                : null,
            style: ButtonStyle(
              foregroundColor: WidgetStateProperty.all(
                isSaveEnabled ? null : Colors.grey,
              ),
            ),
            child: Text(AppLocalizations.of(context)!.save),
          ),
      ],
    );
  }
}

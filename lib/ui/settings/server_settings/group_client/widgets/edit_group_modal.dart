import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class EditGroupModal extends StatefulWidget {
  const EditGroupModal({
    required this.group,
    required this.keyItem,
    required this.title,
    required this.icon,
    required this.onConfirm,
    required this.window,
    super.key,
  });

  final Group group;
  final String keyItem;
  final String title;
  final IconData icon;
  final void Function(({String name, String? comment, bool? enabled}))
  onConfirm;
  final bool window;

  @override
  State<EditGroupModal> createState() => _EditGroupModalState();
}

class _EditGroupModalState extends State<EditGroupModal> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  bool allDataValid = false;

  @override
  void initState() {
    super.initState();
    if (widget.keyItem == 'name') {
      nameController.text = widget.group.name;
    }
    if (widget.keyItem == 'comment') {
      commentController.text = widget.group.comment ?? '';
    }
  }

  void validateName(String value) {
    final name = value.trim();
    setState(() {
      allDataValid = name.isNotEmpty && name != widget.group.name;
    });
  }

  void validateComment(String value) {
    setState(() {
      allDataValid = value.trim() != (widget.group.comment ?? '');
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    Widget content() {
      return Container(
        constraints: const BoxConstraints(minHeight: 360),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        widget.icon,
                        size: 24,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          widget.title,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                      if (widget.keyItem == 'name')
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            controller: nameController,
                            onChanged: validateName,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.group_rounded),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: AppLocalizations.of(
                                context,
                              )!.groupName,
                            ),
                          ),
                        ),
                      if (widget.keyItem == 'comment')
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            controller: commentController,
                            onChanged: validateComment,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.comment_rounded),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              labelText: AppLocalizations.of(context)!.comment,
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: isLandscape
                  ? EdgeInsets.zero
                  : const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.maybePop(context),
                    child: Text(AppLocalizations.of(context)!.cancel),
                  ),
                  const SizedBox(width: 14),
                  TextButton(
                    onPressed: allDataValid
                        ? () {
                            if (widget.keyItem == 'name') {
                              widget.onConfirm((
                                name: nameController.text.trim(),
                                comment: widget.group.comment,
                                enabled: widget.group.enabled,
                              ));
                            }
                            if (widget.keyItem == 'comment') {
                              final comment = commentController.text.trim();
                              widget.onConfirm((
                                name: widget.group.name,
                                comment: comment.isEmpty ? null : comment,
                                enabled: widget.group.enabled,
                              ));
                            }
                            Navigator.maybePop(context);
                          }
                        : null,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        allDataValid ? null : Colors.grey,
                      ),
                    ),
                    child: Text(AppLocalizations.of(context)!.edit),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    if (widget.window) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 480),
          child: Padding(
            padding: isLandscape
                ? const EdgeInsets.symmetric(horizontal: 16)
                : const EdgeInsets.all(16),
            child: content(),
          ),
        ),
      );
    }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SafeArea(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxHeight: 480),
          child: Padding(padding: const EdgeInsets.all(24), child: content()),
        ),
      ),
    );
  }
}

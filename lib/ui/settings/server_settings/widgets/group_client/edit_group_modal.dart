import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class EditGroupModal extends StatefulWidget {
  const EditGroupModal({
    required this.group,
    required this.onConfirm,
    required this.window,
    super.key,
  });

  final Group group;
  final void Function(({String name, String? comment, bool? enabled})) onConfirm;
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
    nameController.text = widget.group.name;
    commentController.text = widget.group.comment ?? '';
  }

  void validateForm() {
    final name = nameController.text.trim();
    final comment = commentController.text.trim();

    final hasChanges =
        name != widget.group.name || comment != (widget.group.comment ?? '');
    final nameValid = name.isNotEmpty;

    setState(() {
      allDataValid = nameValid && hasChanges;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.edit_rounded,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppLocalizations.of(context)!.groupEdit,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    onChanged: (_) => validateForm(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.group_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.groupName,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: commentController,
                    onChanged: (_) => validateForm(),
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.comment_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.comment,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
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
                        final name = nameController.text.trim();
                        final comment = commentController.text.trim();
                        widget.onConfirm((
                          name: name,
                          comment: comment.isEmpty ? null : comment,
                          enabled: widget.group.enabled,
                        ));
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
        ],
      );
    }

    if (widget.window) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 520),
          child: Padding(padding: const EdgeInsets.all(16), child: content()),
        ),
      );
    }

    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).dialogTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
        ),
        child: SafeArea(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 520),
            child: Padding(padding: const EdgeInsets.all(24), child: content()),
          ),
        ),
      ),
    );
  }
}

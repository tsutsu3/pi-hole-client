import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';

class AddGroupModal extends StatefulWidget {
  const AddGroupModal({
    required this.onConfirm,
    required this.window,
    super.key,
  });

  final void Function(({String name, String? comment, bool? enabled}))
  onConfirm;
  final bool window;

  @override
  State<AddGroupModal> createState() => _AddGroupModalState();
}

class _AddGroupModalState extends State<AddGroupModal> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  bool enabled = true;
  bool allDataValid = false;

  void validateName(String value) {
    setState(() => allDataValid = value.trim().isNotEmpty);
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
                    Icons.group_add_rounded,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      AppLocalizations.of(context)!.groupAdd,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  TextField(
                    controller: nameController,
                    onChanged: validateName,
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
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.comment_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: AppLocalizations.of(context)!.comment,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CustomListTile(
                    leadingIcon: Icons.check_rounded,
                    label: AppLocalizations.of(context)!.status,
                    onTap: () => setState(() => enabled = !enabled),
                    trailing: Switch(
                      value: enabled,
                      onChanged: (value) => setState(() => enabled = value),
                    ),
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
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
                        final comment = commentController.text.trim();
                        widget.onConfirm((
                          name: nameController.text.trim(),
                          comment: comment.isEmpty ? null : comment,
                          enabled: enabled,
                        ));
                        Navigator.maybePop(context);
                      }
                    : null,
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                    allDataValid ? null : Colors.grey,
                  ),
                ),
                child: Text(AppLocalizations.of(context)!.add),
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

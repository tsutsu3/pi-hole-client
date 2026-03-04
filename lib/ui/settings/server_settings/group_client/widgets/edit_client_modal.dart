import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/labeled_multi_select_tile.dart';

class EditClientModal extends StatefulWidget {
  const EditClientModal({
    required this.client,
    required this.keyItem,
    required this.title,
    required this.icon,
    required this.onConfirm,
    required this.window,
    required this.groups,
    super.key,
  });

  final ManagedClient client;
  final String keyItem;
  final String title;
  final IconData icon;
  final void Function(({String? comment, List<int> groups})) onConfirm;
  final bool window;
  final Map<int, String> groups;

  @override
  State<EditClientModal> createState() => _EditClientModalState();
}

class _EditClientModalState extends State<EditClientModal> {
  final TextEditingController commentController = TextEditingController();
  List<int> selectedGroups = [];
  bool allDataValid = false;

  @override
  void initState() {
    super.initState();
    if (widget.keyItem == 'comment') {
      commentController.text = widget.client.comment ?? '';
    }
    if (widget.keyItem == 'groups') {
      selectedGroups = widget.client.groups;
    }
  }

  void validateComment(String value) {
    setState(() {
      allDataValid = value != (widget.client.comment ?? '');
    });
  }

  void validateGroups() {
    setState(() {
      allDataValid = selectedGroups != widget.client.groups;
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
                  if (widget.keyItem == 'comment')
                    TextField(
                      controller: commentController,
                      onChanged: validateComment,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.comment_rounded),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: AppLocalizations.of(context)!.comment,
                      ),
                    ),
                  if (widget.keyItem == 'groups')
                    LabeledMultiSelectTile(
                      isExpanded: true,
                      initiallySelectedItems: widget.client.groups,
                      labelText: AppLocalizations.of(context)!.groups,
                      hintText: AppLocalizations.of(
                        context,
                      )!.selectGroupsMessage,
                      icon: Icons.group_rounded,
                      options: widget.groups,
                      onSelectionChanged: (list) {
                        selectedGroups = list;
                        validateGroups();
                      },
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
                        if (widget.keyItem == 'comment') {
                          final comment = commentController.text.trim();
                          widget.onConfirm((
                            comment: comment.isEmpty ? null : comment,
                            groups: widget.client.groups,
                          ));
                        }
                        if (widget.keyItem == 'groups') {
                          widget.onConfirm((
                            comment: widget.client.comment,
                            groups: selectedGroups,
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
        ],
      );
    }

    if (widget.window) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 480),
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
            constraints: const BoxConstraints(maxHeight: 480),
            child: Padding(padding: const EdgeInsets.all(24), child: content()),
          ),
        ),
      ),
    );
  }
}

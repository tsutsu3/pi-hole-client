import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/labeled_multi_select_tile.dart';

class EditAdlistModal extends StatefulWidget {
  const EditAdlistModal({
    required this.adlist,
    required this.keyItem,
    required this.title,
    required this.icon,
    required this.onConfirm,
    required this.window,
    required this.groups,
    super.key,
  });

  final Adlist adlist;
  final String keyItem;
  final String title;
  final IconData icon;
  final void Function(Adlist) onConfirm;
  final bool window;
  final Map<int, String> groups;

  @override
  State<EditAdlistModal> createState() => _EditAdlistModalState();
}

class _EditAdlistModalState extends State<EditAdlistModal> {
  final TextEditingController addressController = TextEditingController();
  String? addressError;
  bool status = true;
  bool allDataValid = false;
  List<int> selectedGroups = [];
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.keyItem == 'comment') {
      commentController.text = widget.adlist.comment ?? '';
    }
    if (widget.keyItem == 'groups') {
      selectedGroups = widget.adlist.groups;
    }
  }

  void validateComment(String? value) {
    if (value == widget.adlist.comment) {
      setState(() {
        allDataValid = false;
      });
    } else {
      setState(() {
        allDataValid = true;
      });
    }
  }

  void validateGroups() {
    if (selectedGroups == widget.adlist.groups) {
      setState(() {
        allDataValid = false;
      });
    } else {
      setState(() {
        allDataValid = true;
      });
    }
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
                      Column(
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
                        ],
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
                      if (widget.keyItem == 'groups')
                        LabeledMultiSelectTile(
                          isExpanded: true,
                          initiallySelectedItems: widget.adlist.groups,
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
                    onPressed: allDataValid == true
                        ? () {
                            if (widget.keyItem == 'comment') {
                              widget.onConfirm(
                                widget.adlist.copyWith(
                                  comment: commentController.text,
                                ),
                              );
                            }
                            if (widget.keyItem == 'groups') {
                              widget.onConfirm(
                                widget.adlist.copyWith(
                                  groups: selectedGroups,
                                ),
                              );
                            }
                            Navigator.maybePop(context);
                          }
                        : null,
                    style: ButtonStyle(
                      foregroundColor: WidgetStateProperty.all(
                        allDataValid == true ? null : Colors.grey,
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

    if (widget.window == true) {
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
    } else {
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
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: content(),
              ),
            ),
          ),
        ),
      );
    }
  }
}

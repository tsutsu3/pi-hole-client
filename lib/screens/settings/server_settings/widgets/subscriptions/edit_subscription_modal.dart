import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/subscriptions.dart';
import 'package:pi_hole_client/widgets/labeled_multi_select_tile.dart';

class EditSubscriptionModal extends StatefulWidget {
  const EditSubscriptionModal({
    required this.subscription,
    required this.keyItem,
    required this.title,
    required this.icon,
    required this.onConfirm,
    required this.window,
    required this.groups,
    super.key,
  });

  final Subscription subscription;
  final String keyItem;
  final String title;
  final IconData icon;
  final void Function(Map<String, dynamic>) onConfirm;
  final bool window;
  final Map<int, String> groups;

  @override
  State<EditSubscriptionModal> createState() => _EditSubscriptionModalState();
}

enum ListType { whitelist, blacklist }

class _EditSubscriptionModalState extends State<EditSubscriptionModal> {
  final TextEditingController subscriptionController = TextEditingController();
  String? subscriptionError;
  ListType selectedType = ListType.whitelist;
  bool status = true;
  bool allDataValid = false;
  List<int> selectedGroups = [];
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.keyItem == 'address') {
      subscriptionController.text = widget.subscription.address;
    }
    if (widget.keyItem == 'comment') {
      commentController.text = widget.subscription.comment ?? '';
    }
    if (widget.keyItem == 'groups') {
      selectedGroups = widget.subscription.groups;
    }
  }

  void validateAddress(String? value) {
    if (value != null && value != '') {
      final subrouteRegexp = RegExp(
        r'^(https?|ftp):\/\/' // protocol
        '('
        'localhost' // localhost
        r'|(\d{1,3}\.){3}\d{1,3}' // IPv4
        r'|[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}' // domain
        ')'
        r'(:\d+)?' // port
        r'(\/[^\s]*)?$', // path
      );

      if (subrouteRegexp.hasMatch(value) == true) {
        setState(() {
          subscriptionError = null;
        });
      } else {
        setState(() {
          // subscriptionError = AppLocalizations.of(context)!.invalidSubscription;
          subscriptionError = 'Invalid subscription';
        });
      }
    } else {
      setState(() {
        subscriptionError = null;
      });
    }

    if (value == widget.subscription.address) {
      setState(() {
        allDataValid = false;
      });
      return;
    }

    if (value != '' && subscriptionError == null) {
      setState(() {
        allDataValid = true;
      });
    } else {
      setState(() {
        allDataValid = false;
      });
    }
  }

  void validateComment(String? value) {
    if (value == widget.subscription.comment) {
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
    if (selectedGroups == widget.subscription.groups) {
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
    Widget content() {
      return Container(
        constraints: const BoxConstraints(minHeight: 360),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            Flexible(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (widget.keyItem == 'address')
                        SizedBox(
                          width: double.infinity,
                          child: TextField(
                            controller: subscriptionController,
                            onChanged: validateAddress,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.public_rounded),
                              border: const OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: AppLocalizations.of(context)!.adlist,
                              errorText: subscriptionError,
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                              ),
                              labelText: AppLocalizations.of(context)!.comment,
                            ),
                          ),
                        ),
                      if (widget.keyItem == 'groups')
                        LabeledMultiSelectTile(
                          isExpanded: true,
                          initiallySelectedItems: widget.subscription.groups,
                          labelText: AppLocalizations.of(context)!.groups,
                          hintText:
                              AppLocalizations.of(context)!.selectGroupsMessage,
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
              padding: const EdgeInsets.only(top: 20),
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
                            if (widget.keyItem == 'address') {
                              widget.onConfirm(
                                widget.subscription
                                    .copyWith(
                                      address: subscriptionController.text,
                                    )
                                    .toJson(),
                              );
                            }
                            if (widget.keyItem == 'comment') {
                              widget.onConfirm(
                                widget.subscription
                                    .copyWith(comment: commentController.text)
                                    .toJson(),
                              );
                            }
                            if (widget.keyItem == 'groups') {
                              widget.onConfirm(
                                widget.subscription
                                    .copyWith(groups: selectedGroups)
                                    .toJson(),
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
            padding: const EdgeInsets.all(16),
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

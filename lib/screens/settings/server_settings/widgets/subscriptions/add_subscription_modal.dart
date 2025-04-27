import 'package:flutter/material.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/labeled_multi_select_tile.dart';

class AddSubscriptionModal extends StatefulWidget {
  const AddSubscriptionModal({
    required this.selectedlist,
    required this.addSubscription,
    required this.window,
    required this.groups,
    super.key,
  });

  final String selectedlist;
  final void Function(Map<String, dynamic>) addSubscription;
  final bool window;
  final Map<int, String> groups;

  @override
  State<AddSubscriptionModal> createState() => _AddSubscriptionModalState();
}

enum ListType { whitelist, blacklist }

class _AddSubscriptionModalState extends State<AddSubscriptionModal> {
  final TextEditingController subscriptionController = TextEditingController();
  String? subscriptionError;
  ListType selectedType = ListType.whitelist;
  bool status = true;
  bool allDataValid = false;
  List<int> selectedGroups = [0];
  final TextEditingController commentController = TextEditingController();

  @override
  void initState() {
    selectedType = widget.selectedlist == 'whitelist'
        ? ListType.whitelist
        : ListType.blacklist;
    super.initState();
  }

  String getSelectedList() {
    if (selectedType == ListType.whitelist) {
      return 'allow';
    }
    if (selectedType == ListType.blacklist) {
      return 'block';
    }
    return '';
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
          subscriptionError = AppLocalizations.of(context)!.invalidAdlist;
        });
      }
    } else {
      setState(() {
        subscriptionError = null;
      });
    }
    validateAllData();
  }

  void validateAllData() {
    if (subscriptionController.text != '' &&
        subscriptionError == null &&
        (selectedType == ListType.blacklist ||
            selectedType == ListType.whitelist)) {
      setState(() {
        allDataValid = true;
      });
    } else {
      setState(() {
        allDataValid = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final isLandscape = mediaQuery.orientation == Orientation.landscape;

    Widget content() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Wrap(
                alignment: WrapAlignment.center,
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.public_rounded,
                        size: 24,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          AppLocalizations.of(context)!.addAdlist,
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    width: double.maxFinite,
                    child: SegmentedButton<ListType>(
                      segments: [
                        ButtonSegment(
                          value: ListType.whitelist,
                          label: Text(AppLocalizations.of(context)!.allowList),
                        ),
                        ButtonSegment(
                          value: ListType.blacklist,
                          label: Text(AppLocalizations.of(context)!.blockList),
                        ),
                      ],
                      selected: <ListType>{selectedType},
                      onSelectionChanged: (value) =>
                          setState(() => selectedType = value.first),
                    ),
                  ),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: subscriptionController,
                      onChanged: validateAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.public_rounded),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: AppLocalizations.of(context)!.adlist,
                        errorText: subscriptionError,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  Container(
                    width: double.maxFinite,
                    padding: const EdgeInsets.only(top: 20),
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.comment_rounded),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelText: AppLocalizations.of(context)!.comment,
                      ),
                    ),
                  ),
                  const Padding(padding: EdgeInsets.all(12)),
                  LabeledMultiSelectTile(
                    labelText: AppLocalizations.of(context)!.groups,
                    hintText: AppLocalizations.of(context)!.selectGroupsMessage,
                    icon: Icons.group_rounded,
                    options: widget.groups,
                    onSelectionChanged: (list) {
                      selectedGroups = list;
                    },
                    initiallySelectedItems: selectedGroups,
                  ),
                  const Padding(padding: EdgeInsets.all(8)),
                  CustomListTile(
                    leadingIcon: Icons.check_rounded,
                    label: AppLocalizations.of(context)!.status,
                    onTap: () => setState(() => status = !status),
                    trailing: Switch(
                      value: status,
                      onChanged: (value) => {setState(() => status = value)},
                    ),
                    padding: const EdgeInsets.only(top: 8, bottom: 8, left: 8),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding:
                isLandscape ? EdgeInsets.zero : const EdgeInsets.only(top: 20),
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
                          widget.addSubscription({
                            'address': subscriptionController.text,
                            'type': getSelectedList(),
                            'enabled': status,
                            'comment': commentController.text,
                            'groups': selectedGroups,
                          });
                          Navigator.maybePop(context);
                        }
                      : null,
                  style: ButtonStyle(
                    foregroundColor: WidgetStateProperty.all(
                      allDataValid == true ? null : Colors.grey,
                    ),
                  ),
                  child: Text(AppLocalizations.of(context)!.add),
                ),
              ],
            ),
          ),
        ],
      );
    }

    if (widget.window == true) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
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
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Theme.of(context).dialogTheme.backgroundColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(28),
              topRight: Radius.circular(28),
            ),
          ),
          child: SafeArea(child: content()),
        ),
      );
    }
  }
}

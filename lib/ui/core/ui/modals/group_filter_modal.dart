import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class GroupFilterModal extends StatefulWidget {
  const GroupFilterModal({
    required this.groups,
    required this.selectedGroupId,
    required this.onApply,
    required this.window,
    super.key,
  });

  final Map<int, String> groups;
  final int? selectedGroupId;
  final void Function(int?) onApply;
  final bool window;

  @override
  State<GroupFilterModal> createState() => _GroupFilterModalState();
}

class _GroupFilterModalState extends State<GroupFilterModal> {
  int? _selectedGroupId;

  @override
  void initState() {
    super.initState();
    _selectedGroupId = widget.selectedGroupId;
  }

  @override
  Widget build(BuildContext context) {
    Widget content() {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: Icon(
              Icons.filter_list,
              size: 24,
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 24),
            child: Text(
              AppLocalizations.of(context)!.groups,
              style: const TextStyle(fontSize: 24),
            ),
          ),
          Flexible(
            child: SingleChildScrollView(
              child: RadioGroup<int?>(
                groupValue: _selectedGroupId,
                onChanged: (value) {
                  setState(() => _selectedGroupId = value);
                },
                child: Column(
                  children: [
                    RadioListTile<int?>(
                      title: Text(AppLocalizations.of(context)!.all),
                      value: null,
                    ),
                    ...widget.groups.entries.map((entry) {
                      return RadioListTile<int?>(
                        title: Text(entry.value),
                        value: entry.key,
                      );
                    }),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() => _selectedGroupId = null);
                  },
                  child: Text(AppLocalizations.of(context)!.reset),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.maybePop(context),
                      child: Text(AppLocalizations.of(context)!.close),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: () {
                        widget.onApply(_selectedGroupId);
                        Navigator.maybePop(context);
                      },
                      child: Text(AppLocalizations.of(context)!.apply),
                    ),
                  ],
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
          constraints: const BoxConstraints(maxWidth: 400, maxHeight: 500),
          child: content(),
        ),
      );
    } else {
      return Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.7,
        ),
        decoration: BoxDecoration(
          color: Theme.of(context).dialogTheme.backgroundColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SafeArea(child: content()),
      );
    }
  }
}

void showGroupFilterModal({
  required BuildContext context,
  required Map<int, String> groups,
  required int? selectedGroupId,
  required void Function(int?) onApply,
}) {
  final width = MediaQuery.of(context).size.width;

  if (width > ResponsiveConstants.medium) {
    showDialog(
      context: context,
      useRootNavigator: false,
      builder: (context) => GroupFilterModal(
        groups: groups,
        selectedGroupId: selectedGroupId,
        onApply: onApply,
        window: true,
      ),
    );
  } else {
    showModalBottomSheet(
      context: context,
      builder: (context) => GroupFilterModal(
        groups: groups,
        selectedGroupId: selectedGroupId,
        onApply: onApply,
        window: false,
      ),
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
    );
  }
}

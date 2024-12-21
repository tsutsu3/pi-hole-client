import 'package:flutter/material.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:pi_hole_client/providers/filters_provider.dart';

class StatusFiltersModal extends StatefulWidget {
  final double statusBarHeight;
  final double bottomNavBarHeight;
  final List<int> statusSelected;
  final bool window;

  const StatusFiltersModal(
      {super.key,
      required this.statusBarHeight,
      required this.bottomNavBarHeight,
      required this.statusSelected,
      required this.window});

  @override
  State<StatusFiltersModal> createState() => _StatusFiltersModalState();
}

class _StatusFiltersModalState extends State<StatusFiltersModal> {
  late List<int> _statusSelected;

  @override
  void initState() {
    setState(() {
      _statusSelected = widget.statusSelected;
    });
    super.initState();
  }

  void _updateStatusSelected(int option) {
    if (_statusSelected.contains(option) == true) {
      setState(() {
        _statusSelected =
            _statusSelected.where((status) => status != option).toList();
      });
    } else {
      setState(() {
        _statusSelected.add(option);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtersProvider = Provider.of<FiltersProvider>(context);
    final serversProvider = Provider.of<ServersProvider>(context);

    void updateList() {
      filtersProvider.setStatusSelected(_statusSelected);
    }

    Widget listItem({
      required IconData icon,
      required String label,
      required int value,
    }) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _updateStatusSelected(value),
          child: ListTile(
            leading: Icon(icon),
            title: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                value: _statusSelected.contains(value),
                onChanged: (_) => _updateStatusSelected(value)),
          ),
        ),
      );
    }

    void checkUncheckAll() {
      if (_statusSelected.length < serversProvider.numShown) {
        setState(() {
          _statusSelected = filtersProvider.defaultSelected;
        });
      } else {
        setState(() {
          _statusSelected = [];
        });
      }
    }

    List<Widget> generateListItems() {
      return serversProvider.queryStatuses
          .where((item) => item.isShown)
          .map((item) {
        return listItem(
          icon: item.icon,
          label: item.text,
          value: item.index,
        );
      }).toList();
    }

    Widget content() {
      return Wrap(
        alignment: WrapAlignment.center,
        children: [
          ConstrainedBox(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.8),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24),
                  child: Icon(
                    Icons.shield_rounded,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24, bottom: 24),
                      child: Text(
                        AppLocalizations.of(context)!.logsStatus,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ],
                ),
                ...generateListItems(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: checkUncheckAll,
                    child: Text(
                        _statusSelected.length == serversProvider.numShown
                            ? AppLocalizations.of(context)!.uncheckAll
                            : AppLocalizations.of(context)!.checkAll)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text(AppLocalizations.of(context)!.close),
                    ),
                    const SizedBox(width: 20),
                    TextButton(
                      onPressed: _statusSelected.isNotEmpty
                          ? () {
                              updateList();
                              Navigator.pop(context);
                            }
                          : null,
                      style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                              _statusSelected.isNotEmpty
                                  ? Theme.of(context).colorScheme.primary
                                  : Colors.grey),
                          overlayColor: WidgetStateProperty.all(
                              Theme.of(context)
                                  .colorScheme
                                  .primary
                                  .withOpacity(0.1))),
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
            constraints: const BoxConstraints(maxWidth: 500), child: content()),
      );
    } else {
      return Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(28), topRight: Radius.circular(28)),
            color: Theme.of(context).dialogBackgroundColor,
          ),
          child: SafeArea(
            bottom: true,
            child: content(),
          ));
    }
  }
}

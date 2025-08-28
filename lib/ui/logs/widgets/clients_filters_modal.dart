import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/viewmodel/filters_provider.dart';
import 'package:provider/provider.dart';

class ClientsFiltersModal extends StatefulWidget {
  const ClientsFiltersModal({
    required this.statusBarHeight,
    required this.bottomNavBarHeight,
    required this.selectedClients,
    required this.window,
    super.key,
  });

  final double statusBarHeight;
  final double bottomNavBarHeight;
  final List<String> selectedClients;
  final bool window;

  @override
  State<ClientsFiltersModal> createState() => _ClientsFiltersModalState();
}

class _ClientsFiltersModalState extends State<ClientsFiltersModal> {
  List<String> _selectedClients = [];

  @override
  void initState() {
    setState(() {
      _selectedClients = widget.selectedClients;
    });
    super.initState();
  }

  void _updateStatusSelected(String option) {
    if (_selectedClients.contains(option) == true) {
      setState(() {
        _selectedClients = _selectedClients
            .where((status) => status != option)
            .toList();
      });
    } else {
      setState(() {
        _selectedClients.add(option);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filtersProvider = Provider.of<FiltersProvider>(context);

    void updateList() {
      filtersProvider.setSelectedClients(_selectedClients);
    }

    Widget listItem({required String label, required String value}) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => _updateStatusSelected(value),
          child: ListTile(
            title: Text(
              label,
              style: const TextStyle(fontWeight: FontWeight.w400),
            ),
            trailing: Checkbox(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              value: _selectedClients.contains(value),
              onChanged: (_) => _updateStatusSelected(value),
            ),
          ),
        ),
      );
    }

    void checkUncheckAll() {
      if (_selectedClients.length < filtersProvider.totalClients.length) {
        setState(() {
          _selectedClients = filtersProvider.totalClients;
        });
      } else {
        setState(() {
          _selectedClients = [];
        });
      }
    }

    Widget content() {
      return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 24),
                    child: Icon(
                      Icons.phone_android_rounded,
                      size: 24,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 24, bottom: 24),
                    child: Text(
                      AppLocalizations.of(context)!.clients,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  ...filtersProvider.totalClients.map(
                    (e) => listItem(label: e, value: e),
                  ),
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
                      _selectedClients.length ==
                              filtersProvider.totalClients.length
                          ? AppLocalizations.of(context)!.uncheckAll
                          : AppLocalizations.of(context)!.checkAll,
                    ),
                  ),
                  Row(
                    children: [
                      TextButton(
                        onPressed: () => Navigator.maybePop(context),
                        child: Text(AppLocalizations.of(context)!.close),
                      ),
                      const SizedBox(width: 20),
                      TextButton(
                        onPressed: _selectedClients.isNotEmpty
                            ? () {
                                updateList();
                                Navigator.maybePop(context);
                              }
                            : null,
                        style: ButtonStyle(
                          foregroundColor: WidgetStateProperty.all(
                            _selectedClients.isNotEmpty
                                ? Theme.of(context).colorScheme.primary
                                : Colors.grey,
                          ),
                          overlayColor: WidgetStateProperty.all(
                            Theme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                          ),
                        ),
                        child: Text(AppLocalizations.of(context)!.apply),
                      ),
                    ],
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
          constraints: const BoxConstraints(maxWidth: 500),
          child: content(),
        ),
      );
    } else {
      return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(28),
            topRight: Radius.circular(28),
          ),
          color: Theme.of(context).dialogTheme.backgroundColor,
        ),
        child: SafeArea(child: content()),
      );
    }
  }
}

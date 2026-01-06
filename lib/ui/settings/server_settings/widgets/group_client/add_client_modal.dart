import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/auto_complate_field.dart';
import 'package:pi_hole_client/ui/core/ui/components/labeled_multi_select_tile.dart';

class AddClientModal extends StatefulWidget {
  const AddClientModal({
    required this.onConfirm,
    required this.window,
    required this.groups,
    this.devices,
    this.ipToHostname = const {},
    super.key,
  });

  final void Function(ClientRequest) onConfirm;
  final bool window;
  final Map<int, String> groups;
  final List<DeviceOption>? devices;
  final Map<String, String> ipToHostname;

  @override
  State<AddClientModal> createState() => _AddClientModalState();
}

class _AddClientModalState extends State<AddClientModal> {
  final TextEditingController clientController = TextEditingController();
  final TextEditingController commentController = TextEditingController();
  List<int> selectedGroups = [0];
  bool allDataValid = false;

  void validateClient(String value) {
    setState(() => allDataValid = value.trim().isNotEmpty);
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;
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
                    Icons.person_add_rounded,
                    size: 24,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      locale.clientAdd,
                      style: const TextStyle(fontSize: 24),
                    ),
                  ),
                  AutoCompleteField<DeviceOption>(
                    icon: Icons.location_on_rounded,
                    labelText: locale.clientAddress,
                    hintText: locale.clientAddress,
                    items: widget.devices ?? const [],
                    controller: clientController,
                    onChanged: validateClient,
                    textOf: (item) => item.ip,
                    titleOf: (item) {
                      final hostname = widget.ipToHostname[item.ip];
                      return hostname == null || hostname.isEmpty
                          ? item.ip
                          : '$hostname (${item.ip})';
                    },
                    subtitleOf: (item) {
                      final vendor = item.macVendor.isNotEmpty
                          ? item.macVendor
                          : locale.unknown;
                      return '${item.hwaddr} ($vendor)';
                    },
                    matches: (item, query) {
                      final hostname =
                          (widget.ipToHostname[item.ip] ?? '').toLowerCase();
                      final ip = item.ip.toLowerCase();
                      return ip.contains(query) || hostname.contains(query);
                    },
                    visualDensity: const VisualDensity(vertical: -4),
                    expandAnimationDurationMilliseconds: 160,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.comment_rounded),
                      border: const OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      labelText: locale.comment,
                    ),
                  ),
                  const SizedBox(height: 16),
                  LabeledMultiSelectTile(
                    initiallySelectedItems: selectedGroups,
                    labelText: locale.groups,
                    hintText: locale.selectGroupsMessage,
                    icon: Icons.group_rounded,
                    options: widget.groups,
                    onSelectionChanged: (list) {
                      setState(() {
                        selectedGroups = list.isEmpty ? [0] : list;
                      });
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
                child: Text(locale.cancel),
              ),
              const SizedBox(width: 14),
              TextButton(
                onPressed: allDataValid
                    ? () {
                        final comment = commentController.text.trim();
                        widget.onConfirm(
                          ClientRequest(
                            client: clientController.text.trim(),
                            comment: comment.isEmpty ? null : comment,
                            groups: selectedGroups,
                          ),
                        );
                        Navigator.maybePop(context);
                      }
                    : null,
                style: ButtonStyle(
                  foregroundColor: WidgetStateProperty.all(
                    allDataValid ? null : Colors.grey,
                  ),
                ),
                child: Text(locale.add),
              ),
            ],
          ),
        ],
      );
    }

    if (widget.window) {
      return Dialog(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600, maxHeight: 560),
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
            constraints: const BoxConstraints(maxHeight: 560),
            child: Padding(padding: const EdgeInsets.all(24), child: content()),
          ),
        ),
      ),
    );
  }
}

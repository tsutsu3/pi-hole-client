import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

class LabeledSingleSelectTile extends StatefulWidget {
  const LabeledSingleSelectTile({
    required this.options,
    required this.onChanged,
    this.labelText = '',
    this.hintText = '',
    this.icon,
    this.height = 160,
    this.isExpanded = false,
    this.initialSelectedKey,
    super.key,
  });

  final Map<int, DeviceOption> options;

  final ValueChanged<int?> onChanged;

  final String labelText;
  final String hintText;
  final IconData? icon;
  final int height;
  final bool isExpanded;
  final int? initialSelectedKey;

  @override
  State<LabeledSingleSelectTile> createState() =>
      _LabeledSingleSelectTileState();
}

class _LabeledSingleSelectTileState extends State<LabeledSingleSelectTile> {
  late int? selectedKey;
  late bool isExpanded;
  final _expansionController = ExpansibleController();

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    if (widget.options.isEmpty) {
      selectedKey = null;
    } else if (widget.initialSelectedKey != null &&
        widget.options.containsKey(widget.initialSelectedKey)) {
      selectedKey = widget.initialSelectedKey;
    } else {
      selectedKey = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final borderColor = isExpanded ? primary : Theme.of(context).dividerColor;
    final showFloatingLabel =
        widget.labelText.isNotEmpty && ((selectedKey != null) || isExpanded);

    final entries = widget.options.entries.toList();
    final selected = selectedKey != null ? widget.options[selectedKey] : null;

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: isExpanded ? 2 : 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              splashColor: Colors.transparent,
              hoverColor: Colors.transparent,
              highlightColor: Colors.transparent,
              listTileTheme: const ListTileThemeData(minTileHeight: 52.0),
            ),
            child: ExpansionTile(
              controller: _expansionController,
              initiallyExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                setState(() => isExpanded = expanded);
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: 11),
              childrenPadding: EdgeInsets.zero,
              leading: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    )
                  : null,
              title: Text(
                selected == null ? widget.hintText : selected.ip,
                style: TextStyle(
                  fontSize: 16,
                  color: selected == null
                      ? Theme.of(context).colorScheme.onSurfaceVariant
                      : Theme.of(context).colorScheme.onSurface,
                ),
              ),
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                    maxHeight: widget.height.toDouble(),
                  ),
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: entries.length,
                    itemBuilder: (context, index) {
                      final entry = entries[index];
                      final isSelected = selectedKey == entry.key;
                      final device = entry.value;
                      return ListTile(
                        title: Text(device.ip),
                        visualDensity: const VisualDensity(vertical: -4),
                        subtitle: Text(
                          '${device.hwaddr} (${device.macVendor})',
                          overflow: TextOverflow.ellipsis,
                        ),
                        trailing: isSelected ? const Icon(Icons.check) : null,
                        selected: isSelected,
                        onTap: () {
                          setState(() {
                            selectedKey = entry.key;
                            isExpanded = false;
                          });
                          widget.onChanged(selectedKey);
                          _expansionController.collapse();
                          setState(() => isExpanded = false);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        if (showFloatingLabel)
          Positioned(
            left: 12,
            top: 3,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Text(
                widget.labelText,
                style: TextStyle(
                  fontSize: 12,
                  color: isExpanded
                      ? primary
                      : Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

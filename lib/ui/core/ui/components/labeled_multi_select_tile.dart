import 'package:flutter/material.dart';

/// A multi-select dropdown widget with a floating label and optional icon,
/// styled to resemble a text field. Uses [ExpansionTile] and checkboxes
/// to allow selecting multiple options from a list.
class LabeledMultiSelectTile extends StatefulWidget {
  /// Creates a [LabeledMultiSelectTile].
  ///
  /// [onSelectionChanged] is called whenever the selection changes.
  /// [options] is the list of selectable items.
  const LabeledMultiSelectTile({
    required this.onSelectionChanged,
    required this.options,
    this.labelText = '',
    this.hintText = '',
    this.icon,
    this.height = 160,
    this.isExpanded = false,
    this.initiallySelectedItems,
    super.key,
  });

  /// The list of selectable options shown as checkboxes.
  final Map<int, String> options;

  /// Callback invoked when the selected items change.
  final ValueChanged<List<int>> onSelectionChanged;

  /// The floating label displayed above the tile when expanded or not empty.
  final String labelText;

  /// The hint text shown when no item is selected.
  final String hintText;

  /// Optional icon displayed at the leading edge of the tile.
  final IconData? icon;

  /// The maximum height of the dropdown list.
  final int height;

  /// Whether the tile is initially expanded.
  final bool isExpanded;

  /// The initially selected items.
  final List<int>? initiallySelectedItems;

  @override
  State<LabeledMultiSelectTile> createState() => _LabeledMultiSelectTileState();
}

class _LabeledMultiSelectTileState extends State<LabeledMultiSelectTile> {
  late List<int> selectedItems;
  late bool isExpanded;

  @override
  void initState() {
    super.initState();
    isExpanded = widget.isExpanded;
    if (widget.options.isEmpty) {
      selectedItems = [];
    } else if (widget.options.isNotEmpty &&
        widget.initiallySelectedItems != null) {
      selectedItems = List<int>.from(widget.initiallySelectedItems!);
    } else {
      selectedItems = [widget.options.keys.first];
    }
  }

  @override
  Widget build(BuildContext context) {
    final primary = Theme.of(context).colorScheme.primary;
    final borderColor = isExpanded ? primary : Theme.of(context).dividerColor;
    final showFloatingLabel =
        widget.labelText.isNotEmpty && (selectedItems.isNotEmpty || isExpanded);
    final entries = widget.options.entries.toList();

    return Stack(
      children: [
        // Outer container with border and rounded corners.
        Container(
          margin: const EdgeInsets.only(top: 12),
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: isExpanded ? 2 : 1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Theme(
            data: Theme.of(context).copyWith(
              dividerColor: Colors.transparent,
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: ExpansionTile(
              initiallyExpanded: isExpanded,
              onExpansionChanged: (expanded) {
                setState(() {
                  isExpanded = expanded;
                });
              },
              tilePadding: const EdgeInsets.symmetric(horizontal: 8),
              childrenPadding: EdgeInsets.zero,
              leading: widget.icon != null
                  ? Icon(
                      widget.icon,
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    )
                  : null,
              title: Text(
                selectedItems.isEmpty
                    ? widget.hintText
                    : getSelectedItems().join(', '),
                style: const TextStyle(fontSize: 16),
              ),
              children: [
                // Child theme for customizing checkbox list style separately.
                Theme(
                  data: Theme.of(context).copyWith(),
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      maxHeight: widget.height.toDouble(),
                    ),
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: entries.length,
                      itemBuilder: (context, index) {
                        final entry = entries[index];
                        final key = entry.key;
                        final value = entry.value;
                        final isSelected = selectedItems.contains(key);
                        return CheckboxListTile(
                          dense: true,
                          title: Text(value),
                          value: isSelected,
                          controlAffinity: ListTileControlAffinity.leading,
                          onChanged: (_) {
                            setState(() {
                              isSelected
                                  ? selectedItems.remove(key)
                                  : selectedItems.add(key);
                              widget.onSelectionChanged(selectedItems);
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Floating label when needed.
        if (showFloatingLabel)
          Positioned(
            left: 12,
            top: 2,
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

  List<String> getSelectedItems() {
    return selectedItems.map((index) => widget.options[index] ?? '').toList();
  }
}

import 'package:flutter/material.dart';

/// A generic autocomplete field widget that expands suggestions inside
/// the same container instead of using an overlay.
///
/// Features:
/// - Displays a [TextField] with a floating label style.
/// - Suggestions list is shown inside the bordered container when focused.
/// - Supports custom matching logic for filtering items.
/// - Uses an external [TextEditingController] to integrate with forms.
///
/// Example:
/// ```dart
/// AutoCompleteField<Device>(
///   items: devices,
///   controller: ipController,
///   onChanged: (value) => validateIp(value),
///   textOf: (d) => d.ip,
///   titleOf: (d) => d.name ?? d.ip,
///   subtitleOf: (d) => '${d.hwaddr} (${d.vendor})',
///   matches: (d, q) =>
///       d.ip.contains(q) || (d.name ?? '').toLowerCase().contains(q),
///   labelText: 'IP Address',
///   hintText: 'Enter or select an IP',
///   icon: Icons.location_on,
/// )
/// ```
class AutoCompleteField<T> extends StatefulWidget {
  const AutoCompleteField({
    required this.items,
    required this.controller,
    required this.onChanged,
    required this.textOf,
    this.titleOf,
    this.subtitleOf,
    this.matches,
    this.icon,
    this.initialText,
    this.keyboardType,
    this.visualDensity,
    this.errorText,
    this.labelText = '',
    this.hintText = '',
    this.maxPopupHeight = 160,
    this.isAnimated = true,
    this.expandAnimationDurationMilliseconds = 200,
    this.contentPadding = const EdgeInsets.symmetric(vertical: 14),
    super.key,
  });

  /// Items used as suggestions.
  final List<T> items;

  /// Controller for the text field (external).
  final TextEditingController controller;

  /// Callback when the text value changes.
  final ValueChanged<String> onChanged;

  /// Converts an item to the text value inserted into the field.
  final String Function(T item) textOf;

  /// Title text shown in suggestion rows.
  /// Defaults to [textOf] if not provided.
  final String Function(T item)? titleOf;

  /// Subtitle text shown below the title in suggestion rows.
  final String Function(T item)? subtitleOf;

  /// Custom matcher function to filter items based on query.
  /// Defaults to searching in text/title/subtitle.
  final bool Function(T item, String query)? matches;

  /// Floating label for the field.
  final String labelText;

  /// Hint text when field is empty.
  final String hintText;

  /// Leading icon for the text field.
  final IconData? icon;

  /// Maximum height of the suggestions list.
  final double maxPopupHeight;

  /// Initial text for the field.
  final String? initialText;

  /// Keyboard type for the text field.
  final TextInputType? keyboardType;

  /// Padding inside the text field.
  final EdgeInsetsGeometry contentPadding;

  /// Duration for the expand/collapse animation.
  final int expandAnimationDurationMilliseconds;

  /// Whether the expand/collapse animation is enabled.
  final bool isAnimated;

  /// Visual density for suggestion list tiles.
  final VisualDensity? visualDensity;

  /// Error text shown below the field when validation fails.
  final String? errorText;

  @override
  State<AutoCompleteField<T>> createState() => _AutoCompleteFieldState<T>();
}

class _AutoCompleteFieldState<T> extends State<AutoCompleteField<T>> {
  late FocusNode _focusNode;
  late TextEditingController _textCtrl;
  late bool _isExpanded;

  String? _selectedText;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textCtrl = widget.controller;
    _isExpanded = false;

    // Initialize with initial text if provided
    if ((widget.initialText ?? '').isNotEmpty) {
      _textCtrl.text = widget.initialText!;
      _selectedText = widget.initialText;
    }

    // Expand/collapse suggestions when focus changes
    _focusNode.addListener(() {
      setState(() => _isExpanded = _focusNode.hasFocus);
    });

    // Handle text changes
    _textCtrl.addListener(() {
      widget.onChanged(_textCtrl.text);
      if (_focusNode.hasFocus && !_isExpanded) {
        // Expand suggestions if focused and not already expanded
        setState(() => _isExpanded = true);
      } else if (!_focusNode.hasFocus &&
          _textCtrl.text.isEmpty &&
          _isExpanded) {
        // Collapse suggestions if not focused and empty
        setState(() => _isExpanded = false);
      }

      // Clear selection if text no longer matches
      if (_selectedText != null && _selectedText != _textCtrl.text) {
        _selectedText = null;
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  /// Filters items based on query.
  List<T> _filteredItems() {
    final q = _textCtrl.text.toLowerCase();
    if (q.isEmpty) return widget.items;
    if (widget.matches != null) {
      return widget.items.where((it) => widget.matches!(it, q)).toList();
    }

    // Fallback to title and subtitle matching
    final titleOf = widget.titleOf;
    final subtitleOf = widget.subtitleOf;
    return widget.items.where((it) {
      final text = widget.textOf(it).toLowerCase();
      final title = (titleOf?.call(it) ?? widget.textOf(it)).toLowerCase();
      final sub = (subtitleOf?.call(it) ?? '').toLowerCase();
      return text.contains(q) || title.contains(q) || sub.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;
    final isError = (widget.errorText ?? '').isNotEmpty;
    final hasValue = _textCtrl.text.isNotEmpty || _isExpanded;
    final borderColor = isError
        ? theme.colorScheme.error
        : _isExpanded
        ? primary
        : theme.dividerColor;
    final labelVisible = widget.labelText.isNotEmpty && hasValue;

    final items = _filteredItems();

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 12), // adjust label overlap
              decoration: BoxDecoration(
                border: Border.all(
                  color: borderColor,
                  width: _isExpanded ? 2 : 1,
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  // Input field
                  TextField(
                    textAlignVertical: TextAlignVertical.center,
                    controller: _textCtrl,
                    focusNode: _focusNode,
                    keyboardType: widget.keyboardType ?? TextInputType.text,
                    decoration: InputDecoration(
                      hintText: widget.hintText,
                      prefixIcon: widget.icon != null
                          ? Icon(
                              size: 24.0,
                              widget.icon,
                              color: theme.colorScheme.onSurfaceVariant,
                            )
                          : null,
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: widget.contentPadding,
                    ),
                  ),
                  // Suggestions list
                  _buildSuggestions(items),
                ],
              ),
            ),
            if (isError)
              Padding(
                padding: const EdgeInsets.only(left: 12, top: 6),
                child: Text(
                  widget.errorText!,
                  style: TextStyle(
                    color: theme.colorScheme.error,
                    fontSize: 12,
                  ),
                ),
              ),
          ],
        ),

        if (labelVisible)
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
                  color: isError
                      ? theme.colorScheme.error
                      : _isExpanded
                      ? primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
      ],
    );
  }

  /// Build the suggestions list
  Widget _buildSuggestions(List<T> items) {
    final listView = ConstrainedBox(
      constraints: BoxConstraints(maxHeight: widget.maxPopupHeight),
      child: Material(
        type: MaterialType.transparency,
        child: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final it = items[index];
            final title = widget.titleOf?.call(it) ?? widget.textOf(it);
            final subtitle = widget.subtitleOf?.call(it);

            return ListTile(
              visualDensity: widget.visualDensity,
              title: Text(title),
              subtitle: subtitle != null
                  ? Text(subtitle, overflow: TextOverflow.ellipsis)
                  : null,
              onTap: () {
                final text = widget.textOf(it);
                setState(() {
                  _textCtrl.text = text;
                  _textCtrl.selection = TextSelection.fromPosition(
                    TextPosition(offset: _textCtrl.text.length),
                  );
                  _selectedText = text;
                  _isExpanded = false;
                });
                widget.onChanged(text);
                _focusNode.unfocus();
              },
            );
          },
        ),
      ),
    );

    if (!widget.isAnimated) {
      return _isExpanded ? listView : const SizedBox.shrink();
    }

    return AnimatedSize(
      duration: Duration(
        milliseconds: widget.expandAnimationDurationMilliseconds,
      ),
      curve: Curves.easeInOut,
      child: _isExpanded ? listView : const SizedBox.shrink(),
    );
  }
}

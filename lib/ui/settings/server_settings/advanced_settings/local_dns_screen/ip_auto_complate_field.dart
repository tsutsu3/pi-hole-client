import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';

class IpAutoCompleteField extends StatefulWidget {
  const IpAutoCompleteField({
    required this.devices,
    required this.controller,
    required this.onChanged,
    this.labelText = '',
    this.hintText = '',
    this.icon,
    this.maxPopupHeight = 160,
    this.initialIp,
    super.key,
  });

  final List<DeviceOption> devices;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  final String labelText;
  final String hintText;
  final IconData? icon;
  final double maxPopupHeight;
  final String? initialIp;

  @override
  State<IpAutoCompleteField> createState() => _IpAutoCompleteFieldState();
}

class _IpAutoCompleteFieldState extends State<IpAutoCompleteField> {
  late FocusNode _focusNode;
  late TextEditingController _textCtrl;
  late bool _isExpanded;

  String? _selectedIp;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _textCtrl = widget.controller;
    _isExpanded = false;

    if (widget.initialIp?.isNotEmpty == true) {
      _textCtrl.text = widget.initialIp!;
      _selectedIp = widget.initialIp;
    }

    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        setState(() => _isExpanded = true);
      } else {
        setState(() => _isExpanded = false);
      }
    });

    _textCtrl.addListener(() {
      widget.onChanged(_textCtrl.text);
      if (_focusNode.hasFocus) {
        if (!_isExpanded) setState(() => _isExpanded = true);
      } else if (_textCtrl.text.isEmpty && _isExpanded) {
        setState(() => _isExpanded = false);
      }
      if (_selectedIp != null && _selectedIp != _textCtrl.text) {
        setState(() => _selectedIp = null);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  List<DeviceOption> _filteredDevices() {
    final q = _textCtrl.text.toLowerCase();
    if (q.isEmpty) return widget.devices;
    return widget.devices.where((d) {
      final name = d.hwaddr.toLowerCase();
      final ip = d.ip.toLowerCase();
      final mac = d.hwaddr.toLowerCase();
      final vendor = d.macVendor.toLowerCase();
      return name.contains(q) ||
          ip.contains(q) ||
          mac.contains(q) ||
          vendor.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final primary = theme.colorScheme.primary;

    final hasValue = _textCtrl.text.isNotEmpty || _isExpanded;
    final borderColor = _isExpanded ? primary : theme.dividerColor;
    final labelVisible = widget.labelText.isNotEmpty && hasValue;

    final candidates = _filteredDevices();

    return Stack(
      children: [
        Container(
          margin: const EdgeInsets.only(
            top: 12,
          ), // Without this, the floating label position shifts
          decoration: BoxDecoration(
            border: Border.all(color: borderColor, width: _isExpanded ? 2 : 1),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TextField(
                textAlignVertical: TextAlignVertical.center,
                controller: _textCtrl,
                focusNode: _focusNode,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: widget.hintText,
                  prefixIcon: widget.icon != null
                      ? Icon(
                          widget.icon,
                          color: theme.colorScheme.onSurfaceVariant,
                        )
                      : null,
                  border: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),

              if (_isExpanded)
                ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: widget.maxPopupHeight),
                  child: Material(
                    type: MaterialType.transparency,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const ClampingScrollPhysics(),
                      itemCount: candidates.length,
                      itemBuilder: (context, index) {
                        final d = candidates[index];
                        return ListTile(
                          visualDensity: const VisualDensity(vertical: -4),
                          title: Text(d.ip),
                          subtitle: Text(
                            '${d.hwaddr} (${d.macVendor})',
                            overflow: TextOverflow.ellipsis,
                          ),
                          onTap: () {
                            setState(() {
                              _textCtrl.text = d.ip;
                              _textCtrl.selection = TextSelection.fromPosition(
                                TextPosition(offset: _textCtrl.text.length),
                              );
                              _selectedIp = d.ip;
                              _isExpanded = false;
                            });
                            widget.onChanged(d.ip);
                            _focusNode.unfocus();
                          },
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),

        // Floating Label
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
                  color: _isExpanded
                      ? primary
                      : theme.colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
      ],
    );
  }
}

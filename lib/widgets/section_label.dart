import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({
    required this.label,
    this.icon,
    this.padding,
    this.color,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  final String label;
  final IconData? icon;
  final EdgeInsets? padding;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: Row(
        children: [
          if (icon != null)
            Icon(icon, color: color ?? Theme.of(context).colorScheme.primary),
          if (icon != null) const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontWeight: fontWeight ?? FontWeight.w500,
              fontSize: fontSize ?? 16,
              color: color ?? Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

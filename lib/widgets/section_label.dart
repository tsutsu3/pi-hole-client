import 'package:flutter/material.dart';

class SectionLabel extends StatelessWidget {
  const SectionLabel({required this.label, super.key, this.padding});

  final String label;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: padding ?? const EdgeInsets.all(16),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 16,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}

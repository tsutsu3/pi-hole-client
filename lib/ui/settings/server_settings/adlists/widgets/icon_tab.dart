import 'package:flutter/material.dart';

class IconTab extends StatelessWidget {
  const IconTab({required this.icon, required this.label, super.key});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Tab(
      child: Row(children: [Icon(icon), const SizedBox(width: 4), Text(label)]),
    );
  }
}

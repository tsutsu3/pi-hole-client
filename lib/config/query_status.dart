import 'package:flutter/material.dart';

enum QueryColorCategory { red, green, blue, orange, grey }

class QueryStatus {
  const QueryStatus({
    required this.index,
    required this.key,
    required this.text,
    required this.colorCategory,
    required this.icon,
    this.isShown = true,
  });

  final int index;
  final String key;
  final String text;
  final QueryColorCategory colorCategory;
  final IconData icon;
  final bool isShown;
}

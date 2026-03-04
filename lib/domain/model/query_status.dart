import 'package:flutter/material.dart';

enum QueryColorCategory { red, green, blue, orange, grey }

enum QueryRequestCategory { allowed, blocked, retried, inProgress, other }

class QueryStatus {
  const QueryStatus({
    required this.index,
    required this.key,
    required this.text,
    required this.colorCategory,
    required this.requestCategory,
    required this.icon,
    this.isShown = true,
  });

  final int index;
  final String key;
  final String text;
  final QueryColorCategory colorCategory;
  final QueryRequestCategory requestCategory;
  final IconData icon;
  final bool isShown;
}

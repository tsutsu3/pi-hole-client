import 'package:flutter/material.dart';

class AppScreen {
  const AppScreen({
    required this.icon,
    required this.name,
    required this.widget,
  });

  final String name;
  final Icon icon;
  final Widget widget;
}

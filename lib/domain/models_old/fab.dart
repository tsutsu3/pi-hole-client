import 'package:flutter/material.dart';

class Fab {
  const Fab({required this.icon, required this.color, required this.onTap});

  final Icon icon;
  final Color color;
  final void Function() onTap;
}

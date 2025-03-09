import 'package:flutter/material.dart';

Widget listTileTitle(String title, {ColorScheme? colorScheme}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        color: colorScheme?.onSurface,
      ),
    ),
  );
}

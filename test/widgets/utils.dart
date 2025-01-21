import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void showText() {
  final texts = find.byType(Text);
  for (final text in texts.evaluate()) {
    print(text.widget.toString());
  }
}

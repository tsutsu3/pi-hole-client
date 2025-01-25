import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void showText() {
  final texts = find.byType(Text);
  for (final text in texts.evaluate()) {
    // ignore: avoid_print
    print(text.widget);
  }
}

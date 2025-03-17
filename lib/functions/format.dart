import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String formatTimestamp(DateTime timestamp, String format) {
  final f = DateFormat(format);
  return f.format(timestamp);
}

String formatTimeOfDay(TimeOfDay timestamp, String format) {
  final f = DateFormat(format);
  return f.format(DateTime(0, 0, 0, timestamp.hour, timestamp.minute));
}

String formatTimestampForChart(String timestamp) {
  String formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  final time = DateTime.fromMillisecondsSinceEpoch(int.parse(timestamp) * 1000);
  final start = time.subtract(const Duration(minutes: 5));
  final end = time.add(const Duration(minutes: 5));
  return '${formatNumber(start.hour)}:${formatNumber(start.minute)} - ${formatNumber(end.hour)}:${formatNumber(end.minute)}';
}

String formatUptime(int seconds) {
  final days = seconds ~/ (24 * 3600);
  final hours = (seconds % (24 * 3600)) ~/ 3600;
  final minutes = (seconds % 3600) ~/ 60;
  return '$days d $hours h $minutes m';
}

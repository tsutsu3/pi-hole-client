import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pi_hole_client/constants/formats.dart';

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

String formatWithDuration(DateTime? startedAt, DateTime? completedAt) {
  if (startedAt == null && completedAt == null) {
    return '...';
  }

  final knownTime = (completedAt ?? startedAt)!.toLocal();
  final formattedTime = DateFormat(kUnifiedDateTimeFormat).format(knownTime);

  if (startedAt == null || completedAt == null) {
    return '$formattedTime (... s)';
  }

  final localStart = startedAt.toLocal();
  final localEnd = completedAt.toLocal();
  final duration = localEnd.difference(localStart).inMilliseconds / 1000;

  return '$formattedTime (${duration.toStringAsFixed(1)} seconds)';
}

/// Processes a log string and simulates carriage return (`\r`) overwrites,
/// outputting only the final visible state of each line.
///
/// - Removes ANSI escape sequences (e.g., color codes).
/// - Splits input by `\n` to process each line individually.
/// - If a line contains `\r`, it simulates in-place overwrites:
///   - The rightmost segment overwrites the previous segment.
///   - Shorter segments overwrite from the beginning, preserving suffix.
/// - Only the final state after overwriting is retained and added as a line.
///
/// Example:
/// ```dart
/// Input:  "Processing A\rProcessing B\rProcessing C\nDone"
/// Output:
/// Processing C
/// Done
/// ```
///
/// Use this when you want to display the latest log line status only,
/// such as simulating CLI-style progress updates.
String normalizeLogOutput(String input) {
  final buffer = StringBuffer();
  final lines = input.split('\n');

  for (final line in lines) {
    final cleanedLine = line.replaceAll(RegExp(r'\x1B\[[0-9;]*[A-Za-z]'), '');

    if (cleanedLine.trim().isEmpty) continue;

    if (cleanedLine.contains('\r')) {
      final segments = cleanedLine.split('\r');
      var result = segments.first;
      for (var i = 1; i < segments.length; i++) {
        final overwrite = segments[i];
        if (overwrite.length >= result.length) {
          result = overwrite;
        } else {
          result = overwrite + result.substring(overwrite.length);
        }
      }
      buffer.writeln(result.trim());
    } else {
      buffer.writeln(cleanedLine.trim());
    }
  }

  return buffer.toString().trim();
}

/// Normalizes a log string by removing ANSI escape sequences
/// and splitting it into clean individual lines.
///
/// - Removes ANSI escape codes (e.g., terminal color sequences).
/// - Splits the input by both `\n` and `\r`.
/// - Each non-empty segment is treated as a separate line.
///
/// Unlike `normalizeLogOutput3`, this method does not simulate carriage return
/// overwriting. It treats all segments as standalone output lines.
///
/// Example:
/// ```
/// Input:  "Step 1\rStep 2\rStep 3\nDone"
/// Output:
/// Step 1
/// Step 2
/// Step 3
/// Done
/// ```
///
/// Use this when you want to display every log state change, even if it
/// overwrites the same line in a real terminal.
// String normalizeLogOutput(String input) {
//   final buffer = StringBuffer();

//   final cleanedInput = input.replaceAll(RegExp(r'\x1B\[[0-9;]*[A-Za-z]'), '');
//   final segments = cleanedInput.split(RegExp(r'[\n\r]+'));

//   for (final segment in segments) {
//     final line = segment.trim();
//     if (line.isNotEmpty) {
//       buffer.writeln(line);
//     }
//   }

//   return buffer.toString().trim();
// }

import 'package:flutter/material.dart';

/// A widget that displays a text in a trailing position.
///
/// The text will be right-aligned if it fits within the available width.
/// Otherwise, it will scroll horizontally.
///
/// The `widthFactor` parameter can be used to control the width of the text.
class AdaptiveTrailingText extends StatelessWidget {
  const AdaptiveTrailingText({required this.text, this.widthFactor, super.key});

  final String text;
  final double? widthFactor;

  @override
  Widget build(BuildContext context) {
    final wFactor = widthFactor ?? 0.5;
    final textStyle = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: Theme.of(context).colorScheme.onSurfaceVariant,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: textStyle),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout();

        final textWidth = textPainter.size.width;
        final availableWidth = constraints.maxWidth * wFactor;

        if (textWidth <= availableWidth) {
          // Right align if the text is short
          return Container(
            width: availableWidth,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(bottom: 5.0),
            child: Text(text, maxLines: 1, style: textStyle, softWrap: false),
          );
        } else {
          // Scroll horizontally if the text is long
          return SizedBox(
            width: availableWidth,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(bottom: 5.0),
                child: Text(
                  text,
                  maxLines: 1,
                  style: textStyle,
                  softWrap: false,
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

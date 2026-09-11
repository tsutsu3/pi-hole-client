import 'package:flutter/material.dart';

/// Shared view for a screen or section whose data failed to load.
class ErrorMessage extends StatelessWidget {
  const ErrorMessage({
    required this.message,
    this.scrollable = false,
    super.key,
  });

  final String message;

  /// Wraps the message in a scroll view so a parent [RefreshIndicator] can
  /// be pulled.
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final content = Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.error, size: 48, color: theme.colorScheme.error),
            const SizedBox(height: 16),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );

    if (!scrollable) return content;

    return CustomScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: [SliverFillRemaining(hasScrollBody: false, child: content)],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class EmptyDataScreen extends StatelessWidget {
  const EmptyDataScreen({
    this.icon = Icons.inbox_rounded,
    this.title,
    this.message,
    super.key,
  });

  final IconData icon;
  final String? title;
  final String? message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 60),
              const SizedBox(height: 16),
              Text(
                title ?? AppLocalizations.of(context)!.noData,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                message ?? AppLocalizations.of(context)!.selectServerThenAccess,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, height: 1.5),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

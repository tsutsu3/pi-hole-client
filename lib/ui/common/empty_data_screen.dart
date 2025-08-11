import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';

class EmptyDataScreen extends StatelessWidget {
  const EmptyDataScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.inbox_rounded,
                size: 60,
              ),
              const SizedBox(height: 16),
              Text(
                AppLocalizations.of(context)!.noData,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 32),
              Text(
                AppLocalizations.of(context)!.selectServerThenAccess,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

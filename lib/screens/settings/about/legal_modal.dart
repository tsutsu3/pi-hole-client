import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LegalModal extends StatelessWidget {
  const LegalModal({super.key});

  Future<String> _loadLicensesAndNotice() async {
    try {
      final noticeText = await rootBundle.loadString('NOTICE');
      return noticeText;
    } catch (e, stack) {
      Error.throwWithStackTrace(
        Exception('Failed to load NOTICE file: $e'),
        stack,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: _loadLicensesAndNotice(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData) {
          final noticeText = snapshot.data!;
          return AlertDialog(
            scrollable: true,
            title: Column(
              children: [
                Icon(
                  Icons.info,
                  size: 24,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Text(
                    AppLocalizations.of(context)!.legalInfo,
                    style: const TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            contentPadding: const EdgeInsets.all(40),
            content: SingleChildScrollView(
              child: Text(noticeText),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.maybePop(context),
                child: Text(AppLocalizations.of(context)!.close),
              ),
            ],
          );
        }

        // Error handling
        return AlertDialog(
          scrollable: true,
          title: Column(
            children: [
              Icon(
                Icons.error,
                size: 24,
                color: Theme.of(context).colorScheme.error,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(
                  AppLocalizations.of(context)!.noticeError,
                  style: const TextStyle(fontSize: 24),
                ),
              ),
            ],
          ),
          content: Text(
            AppLocalizations.of(context)!.noticeErrorDetail,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.maybePop(context),
              child: Text(AppLocalizations.of(context)!.close),
            ),
          ],
        );
      },
    );
  }
}

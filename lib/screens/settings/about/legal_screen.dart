import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';

class LegalScreen extends StatelessWidget {
  const LegalScreen({super.key});

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
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.legalInfo),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<String>(
          future: _loadLicensesAndNotice(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError ||
                !snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error,
                      size: 48,
                      color: Theme.of(context).colorScheme.error,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      AppLocalizations.of(context)!.noticeError,
                      style: const TextStyle(fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        AppLocalizations.of(context)!.noticeErrorDetail,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).colorScheme.error,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Text(snapshot.data!),
              ),
            );
          },
        ),
      ),
    );
  }
}

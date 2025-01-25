import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ImportantInfoModal extends StatelessWidget {
  const ImportantInfoModal({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      scrollable: true,
      title: Column(
        children: [
          Icon(
            Icons.info_rounded,
            size: 24,
            color: Theme.of(context).colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              AppLocalizations.of(context)!.importantAnnouncement,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24,
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ),
        ],
      ),
      contentPadding: const EdgeInsets.all(40),
      content: Column(
        children: [
          Column(
            children: [
              Text(
                AppLocalizations.of(context)!.requiredVersions,
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
              ),
              Container(
                width: double.maxFinite,
                margin: const EdgeInsets.only(top: 10),
                child: const Column(
                  children: [
                    Text('Pi-hole: v5.12+'),
                    SizedBox(height: 5),
                    Text('Web interface: v5.14.2+'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                AppLocalizations.of(context)!.olderVersion,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context)!.letMeKnow,
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 30),
          Text(
            AppLocalizations.of(context)!.howToContact,
            textAlign: TextAlign.justify,
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.maybePop(context),
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }
}

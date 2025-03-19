import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/list_tile_title.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class AppDetailScreen extends StatelessWidget {
  const AppDetailScreen({super.key, String? appVersion})
      : _appVersion = appVersion;

  final String? _appVersion;
  String get appVersion => _appVersion ?? '';

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.applicationDetail),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // App Info
              SectionLabel(label: AppLocalizations.of(context)!.appInfo),
              ListTile(
                leading: const Icon(Icons.label_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.appVersion,
                  colorScheme: colorScheme,
                ),
                subtitle: Text(appVersion),
              ),
              ListTile(
                leading: const Icon(Icons.account_circle_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.createdBy,
                  colorScheme: colorScheme,
                ),
                subtitle: const Text('tsutsu3'),
              ),
              const SizedBox(height: 20),
              // Support & Feedback
              SectionLabel(
                label: AppLocalizations.of(context)!.supportFeedback,
              ),
              ListTile(
                leading: SvgPicture.asset(
                  'assets/resources/github.svg',
                  colorFilter:
                      ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
                  width: 25,
                  height: 25,
                ),
                title: listTileTitle(
                  'GitHub',
                  colorScheme: colorScheme,
                ),
                subtitle: Text(AppLocalizations.of(context)!.openIssueGitHub),
                onTap: () => openUrl(Urls.issue),
                trailing: Icon(
                  Icons.open_in_browser_rounded,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.contact_support_rounded,
                  color: colorScheme.onSurface,
                ),
                title: listTileTitle(
                  AppLocalizations.of(context)!.supportForm,
                  colorScheme: colorScheme,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!.supportFormDescription,
                ),
                onTap: () => openUrl(Urls.support),
                trailing: Icon(
                  Icons.open_in_browser_rounded,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_link_rounded,
                  color: colorScheme.onSurface,
                ),
                title: listTileTitle(
                  AppLocalizations.of(context)!.serverConnectionGuide,
                  colorScheme: colorScheme,
                ),
                subtitle: Text(
                  AppLocalizations.of(context)!
                      .serverConnectionGuideDescription,
                ),
                onTap: () => openUrl(Urls.createAConnection),
                trailing: Icon(
                  Icons.open_in_browser_rounded,
                  color: colorScheme.onSurfaceVariant.withValues(alpha: 0.8),
                ),
              ),
              const SizedBox(height: 20),
              // Version Requirements
              SectionLabel(
                label: AppLocalizations.of(context)!.versionRequirements,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pi-hole: v5.12+'),
                    SizedBox(height: 5),
                    Text('Web interface: v5.14.2+'),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppLocalizations.of(context)!.olderVersion,
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/constants/urls.dart';
import 'package:pi_hole_client/functions/open_url.dart';

class AppDetailModal extends StatefulWidget {
  final String? _appVersion;

  const AppDetailModal({super.key, String? appVersion})
      : _appVersion = appVersion;

  @override
  State<AppDetailModal> createState() => _AppDetailModalState();
}

class _AppDetailModalState extends State<AppDetailModal> {
  final expandableController = ExpandableController();

  String get _appVersion => widget._appVersion ?? "";

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return AlertDialog(
      scrollable: true,
      title: Column(
        children: [
          Icon(
            Icons.contact_page_rounded,
            size: 24,
            color: colorScheme.secondary,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Text(
              AppLocalizations.of(context)!.applicationDetail,
              style: const TextStyle(fontSize: 24),
            ),
          ),
        ],
      ),
      contentPadding: EdgeInsets.all(40),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _appDetailLine(
            url: issueUrl,
            icon: SvgPicture.asset(
              'assets/resources/github.svg',
              colorFilter:
                  ColorFilter.mode(colorScheme.onSurface, BlendMode.srcIn),
              width: 25,
              height: 25,
            ),
            title: "GitHub",
            subtitle: AppLocalizations.of(context)!.openIssueGitHub,
            colorScheme: colorScheme,
          ),
          _appDetailLine(
            url: supportUrl,
            icon:
                Icon(Icons.question_mark_rounded, color: colorScheme.onSurface),
            title: AppLocalizations.of(context)!.supportForm,
            subtitle: AppLocalizations.of(context)!.supportFormDescription,
            colorScheme: colorScheme,
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 20)),
          _appDetailLine(
            title: AppLocalizations.of(context)!.appVersion,
            subtitle: _appVersion,
            colorScheme: colorScheme,
            showWebViewIcon: false,
          ),
          _appDetailLine(
            title: AppLocalizations.of(context)!.createdBy,
            subtitle: "tsutsu3",
            colorScheme: colorScheme,
            showWebViewIcon: false,
          ),
          Padding(padding: const EdgeInsets.only(top: 10)),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text(AppLocalizations.of(context)!.close),
        ),
      ],
    );
  }

  Widget _appDetailLine({
    String? url,
    Widget? icon,
    required String title,
    required String subtitle,
    required ColorScheme colorScheme,
    bool showWebViewIcon = true,
  }) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: url != null ? () => openUrl(url) : null,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            children: [
              icon ?? const SizedBox(width: 0),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16, color: colorScheme.onSurface),
                        ),
                        if (showWebViewIcon) ...[
                          const SizedBox(width: 8),
                          Tooltip(
                            message:
                                AppLocalizations.of(context)!.openExternalUrl,
                            child: Icon(
                              Icons.open_in_browser_rounded,
                              size: 16,
                              color:
                                  colorScheme.onSurfaceVariant.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 5),
                    Text(
                      subtitle,
                      style: TextStyle(color: colorScheme.onSurfaceVariant),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

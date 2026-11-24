import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_type_icon.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/utils/format.dart';

class AppLogDetailsScreen extends StatelessWidget {
  const AppLogDetailsScreen({required this.log, super.key});

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context);
    final dateTime = formatTimestamp(log.dateTime, kUnifiedDateTimeLogFormat);

    Future<void> copyLogClipboard() async {
      await Clipboard.setData(
        ClipboardData(text: appLogToText(log, dateTime: dateTime)),
      );

      if (!context.mounted) return;

      final appColors = Theme.of(context).extension<AppColors>()!;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            loc.logCopiedClipboard,
            style: TextStyle(color: appColors.snackBarNeutralText),
          ),
          backgroundColor: appColors.snackBarNeutral,
          duration: const Duration(seconds: 3),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.logDetails),
        actions: [
          IconButton(
            onPressed: copyLogClipboard,
            icon: const Icon(Icons.copy_rounded),
            tooltip: loc.copyLogClipboard,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            SectionLabel(label: loc.overview),
            ListTile(
              leading: const Icon(Icons.subject_rounded),
              title: Text(loc.summary),
              subtitle: Text(log.message),
            ),
            ListTile(
              leading: Icon(appLogTypeIcon(log.type)),
              title: Text(loc.type),
              subtitle: Text(log.type),
            ),
            ListTile(
              leading: const Icon(Icons.access_time_outlined),
              title: Text(loc.time),
              subtitle: Text(dateTime),
            ),
            if (log.serverAddress != null)
              ListTile(
                leading: const Icon(Icons.dns_rounded),
                title: Text(loc.serverAddress),
                subtitle: Text(log.serverAddress!),
              ),
            if (log.statusCode != null)
              ListTile(
                leading: const Icon(Icons.numbers_rounded),
                title: Text(loc.statusCode),
                subtitle: Text(log.statusCode!),
              ),
            if (log.details != null) ...[
              SectionLabel(label: loc.details),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SelectableText(log.details!),
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// Returns [log] as plain text to paste in an issue.
///
/// The labels are not translated, so that anyone can read the text.
String appLogToText(AppLog log, {required String dateTime}) {
  return [
    'Summary: ${log.message}',
    'Type: ${log.type}',
    'Time: $dateTime',
    if (log.serverAddress != null) 'Server address: ${log.serverAddress}',
    if (log.statusCode != null) 'Status code: ${log.statusCode}',
    if (log.details != null) 'Details: ${log.details}',
  ].join('\n');
}

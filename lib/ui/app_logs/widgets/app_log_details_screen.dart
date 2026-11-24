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
                child: _DetailsBox(details: log.details!),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

/// A read-only text box that scrolls when [details] has more than 5 lines.
class _DetailsBox extends StatefulWidget {
  const _DetailsBox({required this.details});

  final String details;

  @override
  State<_DetailsBox> createState() => _DetailsBoxState();
}

class _DetailsBoxState extends State<_DetailsBox> {
  static const _maxLines = 5;
  static const _padding = 16.0;

  // Shared with the Scrollbar, so that the bar is shown on mobile too.
  final _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style = DefaultTextStyle.of(context).style;
    final lineHeight =
        MediaQuery.textScalerOf(context).scale(style.fontSize ?? 14) *
        (style.height ?? 1.2);

    return Container(
      constraints: BoxConstraints(
        maxHeight: lineHeight * _maxLines + _padding * 2,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Theme.of(context).colorScheme.outline),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
      ),
      // Keep the bar inside the rounded border.
      child: ScrollbarTheme(
        data: ScrollbarTheme.of(
          context,
        ).copyWith(crossAxisMargin: 4, mainAxisMargin: 10),
        child: Scrollbar(
          controller: _scrollController,
          thumbVisibility: true,
          // Hide the bar that desktop adds by default, so that only one is shown.
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(
              context,
            ).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: _scrollController,
              padding: const EdgeInsets.all(_padding),
              child: SizedBox(
                width: double.infinity,
                child: SelectableText(widget.details),
              ),
            ),
          ),
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

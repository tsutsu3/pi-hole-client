import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/app_logs/view_models/app_logs_viewmodel.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_type_icon.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';

class AppLogsScreen extends StatelessWidget {
  const AppLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<AppLogsViewModel>();
    final logs = vm.logs;
    final colorScheme = Theme.of(context).colorScheme;

    Future<void> copyLogsClipboard() async {
      final logsString = logs
          .map(
            (log) => {
              'type': log.type,
              'dateTime': log.dateTime.toString(),
              'message': log.message,
              'serverAddress': log.serverAddress,
              'details': log.details,
              'statusCode': log.statusCode,
            },
          )
          .toList();
      await Clipboard.setData(ClipboardData(text: jsonEncode(logsString)));

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context).logsCopiedClipboard,
            style: TextStyle(
              color: Theme.of(
                context,
              ).extension<AppColors>()!.snackBarNeutralText,
            ),
          ),
          backgroundColor: Theme.of(
            context,
          ).extension<AppColors>()!.snackBarNeutral,
          duration: const Duration(seconds: 3),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appLogs),
        actions: [
          IconButton(
            onPressed: logs.isNotEmpty ? copyLogsClipboard : null,
            icon: const Icon(Icons.share),
            tooltip: AppLocalizations.of(context).copyLogsClipboard,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: logs.isNotEmpty
            ? ListView(
                padding: EdgeInsets.zero,
                children: [
                  for (final group in vm.logsByDay) ...[
                    SectionLabel(
                      label: formatTimestamp(group.day, 'yyyy-MM-dd'),
                      padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                    ),
                    for (final log in group.logs) _AppLogTile(log: log),
                  ],
                ],
              )
            : Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.receipt_long_rounded,
                      size: 48,
                      color: colorScheme.onSurfaceVariant,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppLocalizations.of(context).noSavedLogs,
                      style: TextStyle(
                        fontSize: 24,
                        color: colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}

class _AppLogTile extends StatelessWidget {
  const _AppLogTile({required this.log});

  final AppLog log;

  @override
  Widget build(BuildContext context) {
    final subtitle = [?log.serverAddress, ?log.statusCode].join(' · ');

    return ListTile(
      leading: Icon(appLogTypeIcon(log.type)),
      title: Text(log.message, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: subtitle.isNotEmpty
          ? Text(subtitle, maxLines: 1, overflow: TextOverflow.ellipsis)
          : null,
      trailing: Text(formatTimestamp(log.dateTime, 'HH:mm:ss')),
      onTap: () => context.pushNamed(
        Routes.settingsAppAdvancedAppLogsDetails,
        extra: log,
      ),
    );
  }
}

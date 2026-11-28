import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:pi_hole_client/domain/model/app/app_log.dart';
import 'package:pi_hole_client/routing/routes.dart';
import 'package:pi_hole_client/ui/app_logs/view_models/app_logs_viewmodel.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_type_icon.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
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

      final appConfigViewModel = context.read<AppConfigViewModel>();

      try {
        await Clipboard.setData(ClipboardData(text: jsonEncode(logsString)));
      } on PlatformException {
        if (!context.mounted) return;
        showErrorSnackBar(
          context: context,
          appConfigViewModel: appConfigViewModel,
          label: AppLocalizations.of(context).logsCopyFailed,
        );
        return;
      }

      if (!context.mounted) return;

      showNeutralSnackBar(
        context: context,
        appConfigViewModel: appConfigViewModel,
        label: AppLocalizations.of(context).logsCopiedClipboard,
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context).appLogs),
        actions: [
          IconButton(
            onPressed: logs.isNotEmpty ? copyLogsClipboard : null,
            icon: const Icon(Icons.copy_rounded),
            tooltip: AppLocalizations.of(context).copyLogsClipboard,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: logs.isNotEmpty
            ? CustomScrollView(
                slivers: [
                  for (final group in vm.logsByDay) ...[
                    SliverToBoxAdapter(
                      child: SectionLabel(
                        label: formatTimestamp(group.day, kUnifiedDateFormat),
                        padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                      ),
                    ),
                    // Builds only the rows on screen (up to 500 logs).
                    SliverList.builder(
                      itemCount: group.logs.length,
                      itemBuilder: (_, i) => _AppLogTile(log: group.logs[i]),
                    ),
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

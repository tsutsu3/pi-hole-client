import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/app_logs/view_models/app_logs_viewmodel.dart';
import 'package:pi_hole_client/ui/app_logs/widgets/app_log_details_modal.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:provider/provider.dart';

class AppLogsScreen extends StatelessWidget {
  const AppLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logs = context.watch<AppLogsViewModel>().logs;

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
        title: Text(AppLocalizations.of(context).logs),
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
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: logs.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    logs[index].message,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    [
                      ?logs[index].serverAddress,
                      logs[index].dateTime.toString(),
                    ].join('\n'),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).listTileTheme.textColor,
                    ),
                  ),
                  trailing: Text(logs[index].type),
                  onTap: () => {
                    showDialog(
                      context: context,
                      useRootNavigator:
                          false, // Prevents unexpected app exit on mobile when pressing back
                      builder: (context) =>
                          AppLogDetailsModal(log: logs[index]),
                    ),
                  },
                ),
              )
            : Center(
                child: Text(
                  AppLocalizations.of(context).noSavedLogs,
                  style: TextStyle(
                    fontSize: 24,
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                  ),
                ),
              ),
      ),
    );
  }
}

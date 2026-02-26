import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/ui/app_logs/app_log_details_modal.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:provider/provider.dart';

class AppLogsScreen extends StatelessWidget {
  const AppLogsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigViewModel = Provider.of<AppConfigViewModel>(context);

    Future<void> copyLogsClipboard() async {
      final logsString = appConfigViewModel.logs
          .map((log) => {
                'type': log.type,
                'dateTime': log.dateTime.toString(),
                'message': log.message,
                'statusCode': log.statusCode.toString(),
                'resBody': log.resBody.toString(),
              })
          .toList();
      await Clipboard.setData(ClipboardData(text: jsonEncode(logsString)));

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.logsCopiedClipboard,
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
        title: Text(AppLocalizations.of(context)!.logs),
        actions: [
          IconButton(
            onPressed: appConfigViewModel.logs.isNotEmpty
                ? copyLogsClipboard
                : null,
            icon: const Icon(Icons.share),
            tooltip: AppLocalizations.of(context)!.copyLogsClipboard,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: appConfigViewModel.logs.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: appConfigViewModel.logs.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    appConfigViewModel.logs[index].message,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    appConfigViewModel.logs[index].dateTime.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).listTileTheme.textColor,
                    ),
                  ),
                  trailing: Text(appConfigViewModel.logs[index].type),
                  onTap: () => {
                    showDialog(
                      context: context,
                      useRootNavigator:
                          false, // Prevents unexpected app exit on mobile when pressing back
                      builder: (context) => AppLogDetailsModal(
                        log: appConfigViewModel.logs[index],
                      ),
                    ),
                  },
                ),
              )
            : Center(
                child: Text(
                  AppLocalizations.of(context)!.noSavedLogs,
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

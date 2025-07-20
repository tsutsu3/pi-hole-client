import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/screens/app_logs/app_log_details_modal.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:provider/provider.dart';

class AppLogs extends StatelessWidget {
  const AppLogs({super.key});

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    Future<void> copyLogsClipboard() async {
      final logsString =
          appConfigProvider.logs.map((log) => log.toMap()).toList();
      await Clipboard.setData(ClipboardData(text: jsonEncode(logsString)));

      if (!context.mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalizations.of(context)!.logsCopiedClipboard,
            style: TextStyle(
              color:
                  Theme.of(context).extension<AppColors>()!.snackBarNeutralText,
            ),
          ),
          backgroundColor:
              Theme.of(context).extension<AppColors>()!.snackBarNeutral,
          duration: const Duration(seconds: 3),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.logs),
        actions: [
          IconButton(
            onPressed:
                appConfigProvider.logs.isNotEmpty ? copyLogsClipboard : null,
            icon: const Icon(Icons.share),
            tooltip: AppLocalizations.of(context)!.copyLogsClipboard,
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: appConfigProvider.logs.isNotEmpty
            ? ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: appConfigProvider.logs.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(
                    appConfigProvider.logs[index].message,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  subtitle: Text(
                    appConfigProvider.logs[index].dateTime.toString(),
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: Theme.of(context).listTileTheme.textColor,
                    ),
                  ),
                  trailing: Text(appConfigProvider.logs[index].type),
                  onTap: () => {
                    showDialog(
                      context: context,
                      useRootNavigator:
                          false, // Prevents unexpected app exit on mobile when pressing back
                      builder: (context) => AppLogDetailsModal(
                        log: appConfigProvider.logs[index],
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

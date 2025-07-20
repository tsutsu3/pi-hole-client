import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/screens/common/pi_hole_v6_not_supported_screen.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/widgets/custom_radio_list_tile.dart';
import 'package:provider/provider.dart';

class LogOption {
  const LogOption(this.time, this.labelBuilder);
  final double time;
  final String Function(AppLocalizations loc) labelBuilder;

  static final List<LogOption> all = [
    LogOption(0.5, (loc) => loc.minutes30),
    LogOption(1.0, (loc) => loc.hour1),
    LogOption(2.0, (loc) => loc.hours2),
    LogOption(4.0, (loc) => loc.hours4),
    LogOption(6.0, (loc) => loc.hours6),
    LogOption(8.0, (loc) => loc.hours8),
  ];

  static double timeFromIndex(int index) =>
      (index >= 0 && index < all.length) ? all[index].time : 2.0;

  static int indexFromTime(double time) =>
      all.indexWhere((opt) => opt.time == time).clamp(0, all.length - 1);
}

class LogsQuantityLoadScreen extends StatelessWidget {
  const LogsQuantityLoadScreen({required this.apiVersion, super.key});

  final String apiVersion;

  Future<void> _onChange(BuildContext context, int option) async {
    final appConfigProvider =
        Provider.of<AppConfigProvider>(context, listen: false);
    final result = await appConfigProvider
        .setLogsPerQuery(LogOption.timeFromIndex(option));

    if (!context.mounted) return;

    if (result) {
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.logsPerQueryUpdated,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.cantUpdateLogsPerQuery,
      );
    }
  }

  Widget _buildWarningCard(BuildContext context, AppLocalizations loc) {
    final appColors = Theme.of(context).extension<AppColors>()!;
    return Padding(
      padding: const EdgeInsets.only(
        top: 10,
        bottom: 20,
        left: 20,
        right: 20,
      ),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: appColors.cardWarning,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Icon(
              Icons.warning_rounded,
              color: appColors.cardWarningText,
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Text(
                loc.logsPerQueryWarning,
                style: TextStyle(
                  color: appColors.cardWarningText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(loc.logsQuantityPerLoad),
      ),
      body: SafeArea(
        child: apiVersion == 'v6'
            ? PiHoleV6NotSupportedScreen(
                message: loc.featureNotSupportedMessageLogOption,
              )
            : Selector<AppConfigProvider, double>(
                selector: (_, provider) => provider.logsPerQuery,
                builder: (context, logsPerQuery, child) {
                  final selectedOption = LogOption.indexFromTime(logsPerQuery);

                  return ListView(
                    children: [
                      _buildWarningCard(context, loc),
                      ...List.generate(LogOption.all.length, (i) {
                        return CustomRadioListTile(
                          groupValue: selectedOption,
                          value: i,
                          title: LogOption.all[i].labelBuilder(loc),
                          radioBackgroundColor:
                              Theme.of(context).colorScheme.surface,
                          onChanged: (val) => _onChange(context, val),
                        );
                      }),
                    ],
                  );
                },
              ),
      ),
    );
  }
}

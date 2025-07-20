import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/services/gateways/shared/models/sensors.dart';
import 'package:pi_hole_client/data/services/gateways/shared/models/system.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/adaptive_trailing_text.dart';
import 'package:pi_hole_client/ui/core/ui/components/list_tile_title.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:pi_hole_client/utils/misc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class PerformanceUsageSection extends StatelessWidget {
  const PerformanceUsageSection({
    required this.system,
    required this.sensors,
    super.key,
  });

  final SystemInfo? system;
  final SensorsInfo? sensors;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Skeleton.keep(
          child: SectionLabel(label: AppLocalizations.of(context)!.performance),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: Icon(Icons.memory_rounded),
          ),
          title: Skeleton.keep(
            child: listTileTitle(
              AppLocalizations.of(context)!.cpuUsage,
              colorScheme: colorScheme,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (system?.cpuUsage ?? 0.0) / 100.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 4),
              Text('${(system?.cpuUsage ?? 0.0).toStringAsFixed(2)}%'),
            ],
          ),
        ),
        ListTile(
          dense: true,
          leading: const Skeleton.keep(
            child: Icon(Icons.speed_rounded),
          ),
          title: Skeleton.keep(
            child: listTileTitle(
              AppLocalizations.of(context)!.memoryUsage,
              colorScheme: colorScheme,
            ),
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LinearProgressIndicator(
                value: (system?.ramUsage ?? 0.0) / 100.0,
                valueColor: AlwaysStoppedAnimation<Color>(
                  Theme.of(context).colorScheme.primary,
                ),
                backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              ),
              const SizedBox(height: 4),
              Text('${(system?.ramUsage ?? 0.0).toStringAsFixed(2)}%'),
            ],
          ),
        ),
        Theme(
          data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
          child: ExpansionTile(
            title: Skeleton.keep(
              child: listTileTitle(
                AppLocalizations.of(context)!.moreDetails,
                colorScheme: colorScheme,
              ),
            ),
            children: [
              ListTile(
                dense: true,
                leading: const Icon(Icons.access_time),
                title: listTileTitle(
                  AppLocalizations.of(context)!.uptime,
                  colorScheme: colorScheme,
                ),
                trailing: AdaptiveTrailingText(
                  text: system != null
                      ? formatUptime(system!.uptime)
                      : AppLocalizations.of(context)!.unknown,
                ),
              ),
              ListTile(
                dense: true,
                leading: const Icon(Icons.thermostat_rounded),
                title: listTileTitle(
                  AppLocalizations.of(context)!.cpuTemperature,
                  colorScheme: colorScheme,
                ),
                trailing: AdaptiveTrailingText(
                  text: sensors?.cpuTemp != null
                      ? '${(sensors?.cpuTemp ?? 0.0).toStringAsFixed(2)} ${convertTemperatureUnit(sensors?.unit)}'
                      : AppLocalizations.of(context)!.unknown,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

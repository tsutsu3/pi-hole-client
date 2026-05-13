import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/sensor.dart';
import 'package:pi_hole_client/domain/model/ftl/system.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/view_models/status_viewmodel.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ServerStatusChips extends StatelessWidget {
  const ServerStatusChips({super.key});

  @override
  Widget build(BuildContext context) {
    final statusLoading = context.select<StatusViewModel, LoadStatus>(
      (provider) => provider.getStatusLoading,
    );
    final isLoading = statusLoading == LoadStatus.loading;

    final locale = Platform.localeName;
    final graphColors = Theme.of(context).extension<GraphColors>()!;
    final loc = AppLocalizations.of(context)!;

    final qpm = context.select<StatusViewModel, double?>(
      (p) => p.getQueriesPerMinute,
    );
    final cpuLoad = context.select<StatusViewModel, CpuLoad?>(
      (p) => p.getFtlSystem?.cpuLoad,
    );
    final cpuUsage = context.select<StatusViewModel, double?>(
      (p) => p.getFtlSystem?.cpuUsage,
    );
    final ramUsage = context.select<StatusViewModel, double?>(
      (p) => p.getFtlSystem?.ramUsage,
    );
    final sensor = context.select<StatusViewModel, FtlSensor?>(
      (p) => p.getFtlSensor,
    );
    final uptime = context.select<StatusViewModel, int?>(
      (p) => p.getFtlSystem?.uptime,
    );

    final tempUnitSymbol = switch (sensor?.unit) {
      TemperatureUnit.fahrenheit => '°F',
      TemperatureUnit.kelvin => 'K',
      _ => '°C',
    };

    final chips = [
      (
        icon: Icons.trending_up_rounded,
        color: graphColors.getColorByTheme('blue'),
        tooltip: loc.chipTooltipQueriesPerMinute,
        label:
            qpm == null ? '- q/min' : '${qpm.toStringAsFixed(1)} q/min',
      ),
      (
        icon: Icons.speed_rounded,
        color: graphColors.getColorByTheme('purple'),
        tooltip: loc.chipTooltipCpuLoadAverage,
        label: cpuLoad == null
            ? 'Load -/-/-'
            : 'Load ${cpuLoad.avg1m.toStringAsFixed(2)}/${cpuLoad.avg5m.toStringAsFixed(2)}/${cpuLoad.avg15m.toStringAsFixed(2)}',
      ),
      (
        icon: Icons.memory_rounded,
        color: graphColors.getColorByTheme('green'),
        tooltip: loc.chipTooltipCpuUsage,
        label:
            cpuUsage == null ? 'CPU -%' : 'CPU ${formatPercentage(cpuUsage, locale)}%',
      ),
      (
        icon: Icons.developer_board_rounded,
        color: graphColors.getColorByTheme('teal'),
        tooltip: loc.chipTooltipRamUsage,
        label:
            ramUsage == null ? 'RAM -%' : 'RAM ${formatPercentage(ramUsage, locale)}%',
      ),
      (
        icon: Icons.thermostat_rounded,
        color: graphColors.getColorByTheme('orange'),
        tooltip: loc.chipTooltipCpuTemperature,
        label: sensor?.cpuTemp == null
            ? 'Temp -$tempUnitSymbol'
            : 'Temp ${sensor!.cpuTemp!.toStringAsFixed(1)}$tempUnitSymbol',
      ),
      (
        icon: Icons.schedule_rounded,
        color: graphColors.getColorByTheme('indigo'),
        tooltip: loc.chipTooltipSystemUptime,
        label: uptime == null
            ? 'Up -'
            : () {
                final d = Duration(seconds: uptime);
                return 'Up ${d.inDays}d ${d.inHours % 24}h ${d.inMinutes % 60}m';
              }(),
      ),
    ];

    return SizedBox(
      height: 32,
      child: Skeletonizer(
        enabled: isLoading,
        effect: ShimmerEffect(
          baseColor: Theme.of(context).colorScheme.secondaryContainer,
          highlightColor: Theme.of(context).colorScheme.surface,
        ),
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemCount: chips.length,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final chip = chips[index];
                  return _StatusChip(
                    icon: chip.icon,
                    iconColor: chip.color,
                    tooltip: chip.tooltip,
                    label: chip.label,
                  );
                },
              ),
            ),
            const _RightFade(),
          ],
        ),
      ),
    );
  }
}

class _RightFade extends StatelessWidget {
  const _RightFade();

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).scaffoldBackgroundColor;

    return Positioned(
      top: 0,
      right: 0,
      bottom: 0,
      child: IgnorePointer(
        child: Container(
          width: 64,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [color.withValues(alpha: 0), color],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.icon,
    required this.iconColor,
    required this.tooltip,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String tooltip;
  final String label;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;

    return Tooltip(
      message: tooltip,
      child: Chip(
        avatar: Icon(icon, size: 17, color: iconColor),
        label: Text(label),
        visualDensity: const VisualDensity(vertical: -4),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
        side: BorderSide(color: cs.outlineVariant),
        backgroundColor: cs.onSurfaceVariant.withValues(alpha: 0.06),
        labelStyle: theme.textTheme.labelMedium?.copyWith(
          color: cs.onSurface,
          fontWeight: FontWeight.w600,
          letterSpacing: 0.1,
        ),
      ),
    );
  }
}

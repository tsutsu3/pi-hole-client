import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
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
    final theme = Theme.of(context).extension<GraphColors>()!;

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
                itemCount: 6,
                separatorBuilder: (_, _) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  final loc = AppLocalizations.of(context)!;
                  return switch (index) {
                    0 => _StatusChip(
                      icon: Icons.trending_up_rounded,
                      iconColor: theme.getColorByTheme('blue'),
                      tooltip: loc.chipTooltipQueriesPerMinute,
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          final qpm = provider.getQueriesPerMinute;
                          if (qpm == null) return '- q/min';
                          return '${qpm.toStringAsFixed(1)} q/min';
                        });
                      },
                    ),
                    1 => _StatusChip(
                      icon: Icons.speed_rounded,
                      iconColor: theme.getColorByTheme('purple'),
                      tooltip: loc.chipTooltipCpuLoadAverage,
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          final load = provider.getFtlSystem?.cpuLoad;
                          if (load == null) return 'Load -/-/-';
                          return 'Load ${load.avg1m.toStringAsFixed(2)}/${load.avg5m.toStringAsFixed(2)}/${load.avg15m.toStringAsFixed(2)}';
                        });
                      },
                    ),
                    2 => _StatusChip(
                      icon: Icons.memory_rounded,
                      iconColor: theme.getColorByTheme('green'),
                      tooltip: loc.chipTooltipCpuUsage,
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          final cpu = provider.getFtlSystem?.cpuUsage;
                          if (cpu == null) return 'CPU -%';
                          return 'CPU ${formatPercentage(cpu, locale)}%';
                        });
                      },
                    ),
                    3 => _StatusChip(
                      icon: Icons.developer_board_rounded,
                      iconColor: theme.getColorByTheme('teal'),
                      tooltip: loc.chipTooltipRamUsage,
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          final ram = provider.getFtlSystem?.ramUsage;
                          if (ram == null) return 'RAM -%';
                          return 'RAM ${formatPercentage(ram, locale)}%';
                        });
                      },
                    ),
                    4 => _StatusChip(
                      icon: Icons.thermostat_rounded,
                      iconColor: theme.getColorByTheme('orange'),
                      tooltip: loc.chipTooltipCpuTemperature,
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          final sensor = provider.getFtlSensor;
                          final temp = sensor?.cpuTemp;
                          final unitSymbol = switch (sensor?.unit) {
                            TemperatureUnit.fahrenheit => '°F',
                            TemperatureUnit.kelvin => 'K',
                            _ => '°C',
                          };
                          if (temp == null) return 'Temp -$unitSymbol';
                          return 'Temp ${temp.toStringAsFixed(1)}$unitSymbol';
                        });
                      },
                    ),
                    _ => _StatusChip(
                      icon: Icons.schedule_rounded,
                      iconColor: theme.getColorByTheme('indigo'),
                      tooltip: loc.chipTooltipSystemUptime,
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          final uptime = provider.getFtlSystem?.uptime;
                          if (uptime == null) return 'Up -';
                          final d = Duration(seconds: uptime);
                          return 'Up ${d.inDays}d ${d.inHours % 24}h ${d.inMinutes % 60}m';
                        });
                      },
                    ),
                  };
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
    required this.labelSelector,
  });

  final IconData icon;
  final Color iconColor;
  final String tooltip;
  final String Function(BuildContext context) labelSelector;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cs = theme.colorScheme;
    final label = labelSelector(context);

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

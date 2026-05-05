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
    final loc = AppLocalizations.of(context)!;

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
                separatorBuilder: (_, __) => const SizedBox(width: 8),
                itemBuilder: (context, index) {
                  return switch (index) {
                    0 => _StatusChip(
                      icon: Icons.trending_up_rounded,
                      iconColor: theme.getColorByTheme('blue'),
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          // final qpm = provider.getQueriesPerMinute;
                          final qpm = 1.6 * 60; // Fake QPM for demo purposes
                          return '$qpm q/min';
                        });
                      },
                    ),
                    1 => _StatusChip(
                      icon: Icons.speed_rounded,
                      iconColor: theme.getColorByTheme('purple'),
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          // final load = provider.getSystemStatus?.loadAverage;
                          final load = [
                            0.42,
                            0.37,
                            0.31,
                          ]; // Fake load for demo purposes 1m, 5m, 15m
                          return 'Load ${load[0].toStringAsFixed(2)}/${load[1].toStringAsFixed(2)}/${load[2].toStringAsFixed(2)}';
                        });
                      },
                    ),
                    2 => _StatusChip(
                      icon: Icons.memory_rounded,
                      iconColor: theme.getColorByTheme('green'),
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          // final cpu = provider.getSystemStatus?.cpuUsage;
                          final cpu = 27.3; // Fake CPU usage for demo purposes
                          return 'CPU ${formatPercentage(cpu, locale)}%';
                        });
                      },
                    ),
                    3 => _StatusChip(
                      icon: Icons.developer_board_rounded,
                      iconColor: theme.getColorByTheme('teal'),
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          // final ram = provider.getSystemStatus?.memoryUsage;
                          final ram = 18.5; // Fake RAM usage for demo purposes
                          return 'RAM ${formatPercentage(ram, locale)}%';
                        });
                      },
                    ),
                    4 => _StatusChip(
                      icon: Icons.thermostat_rounded,
                      iconColor: theme.getColorByTheme('orange'),
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          // final temp = provider.getSystemStatus?.cpuTemperature;
                          final temp =
                              48.0; // Fake temperature for demo purposes
                          return '${temp.toStringAsFixed(0)}°C';
                        });
                      },
                    ),
                    _ => _StatusChip(
                      icon: Icons.schedule_rounded,
                      iconColor: theme.getColorByTheme('indigo'),
                      labelSelector: (context) {
                        return context.select<StatusViewModel, String>((
                          provider,
                        ) {
                          // final uptime = provider.getSystemStatus?.uptime;
                          // use same serverinfo uptime func
                          final uptime =
                              1234567; // Fake uptime for demo purposes
                          return 'Up ${Duration(seconds: uptime).inDays}d ${Duration(seconds: uptime).inHours % 24}h ${Duration(seconds: uptime).inMinutes % 60}m';
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
    required this.labelSelector,
  });

  final IconData icon;
  final Color iconColor;
  final String Function(BuildContext context) labelSelector;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final label = labelSelector(context);

    return Container(
      height: 36,
      padding: const EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: isDark
            ? Colors.white.withValues(alpha: 0.06)
            : Colors.black.withValues(alpha: 0.04),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.12)
              : Colors.black.withValues(alpha: 0.10),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 17, color: iconColor),
          const SizedBox(width: 6),
          Text(
            label,
            style: theme.textTheme.labelMedium?.copyWith(
              color: isDark
                  ? Colors.white.withValues(alpha: 0.92)
                  : Colors.black.withValues(alpha: 0.82),
              fontWeight: FontWeight.w600,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}

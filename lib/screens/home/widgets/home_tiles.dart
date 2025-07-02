import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/home_tile.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

const _fakeTotal = 12345;
const _fakeblocked = 1234;
const _fakePercentage = 12.34;
const _fakeDomains = 123456;

/// A widget that displays a set of summary tiles on the home screen, each showing
/// a different Pi-hole status metric (total queries, queries blocked, percentage blocked,
/// and domains on adlists).
///
/// The tiles are displayed in a responsive [Wrap] layout and use skeleton loading
/// placeholders while data is being fetched. Each tile retrieves its value from the
/// [StatusProvider] using context selectors for efficient rebuilds.
///
/// Parameters:
/// - [width]: The width to be used for each tile.
///
/// The widget uses themed colors and localized labels, and supports shimmer loading
/// effects for a better user experience during data fetches.
class HomeTiles extends StatelessWidget {
  const HomeTiles({
    required this.width,
    super.key,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    debugPrint('HomeTiles rebuild');

    final statusLoading = context.select<StatusProvider, LoadStatus>(
      (provider) => provider.getStatusLoading,
    );
    final isLoading = statusLoading == LoadStatus.loading;

    final locale = Platform.localeName;
    final theme = Theme.of(context).extension<DataVisColors>()!;
    final loc = AppLocalizations.of(context)!;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Skeletonizer(
        enabled: isLoading,
        effect: ShimmerEffect(
          baseColor: Colors.white.withValues(alpha: 0.4),
          highlightColor: Colors.white.withValues(alpha: 0.8),
        ),
        child: Wrap(
          runSpacing: 16,
          children: [
            HomeTileItem(
              icon: Icons.public,
              iconColor: theme.blueDark!,
              color: theme.blue!,
              label: loc.totalQueries,
              valueSelector: (context) {
                return context.select<StatusProvider, String>(
                  (provider) => intFormat(
                    provider.getRealtimeStatus?.dnsQueriesToday ?? _fakeTotal,
                    locale,
                  ),
                );
              },
              width: width,
            ),
            HomeTileItem(
              icon: Icons.block,
              iconColor: theme.redDark!,
              color: theme.red!,
              label: loc.queriesBlocked,
              valueSelector: (context) {
                return context.select<StatusProvider, String>(
                  (provider) => intFormat(
                    provider.getRealtimeStatus?.adsBlockedToday ?? _fakeblocked,
                    locale,
                  ),
                );
              },
              width: width,
            ),
            HomeTileItem(
              icon: Icons.pie_chart,
              iconColor: theme.orangeDark!,
              color: theme.orange!,
              label: loc.percentageBlocked,
              valueSelector: (context) {
                return context.select<StatusProvider, String>(
                  (provider) => '${formatPercentage(
                    provider.getRealtimeStatus?.adsPercentageToday ??
                        _fakePercentage,
                    locale,
                  )}%',
                );
              },
              width: width,
            ),
            HomeTileItem(
              icon: Icons.list,
              iconColor: theme.greenDark!,
              color: theme.green!,
              label: loc.domainsAdlists,
              valueSelector: (context) {
                return context.select<StatusProvider, String>(
                  (provider) => intFormat(
                    provider.getRealtimeStatus?.domainsBeingBlocked ??
                        _fakeDomains,
                    locale,
                  ),
                );
              },
              width: width,
            ),
          ],
        ),
      ),
    );
  }
}

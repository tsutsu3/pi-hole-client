import 'package:flutter/material.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_graph.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/queries/queries_legend_dot.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/ui/components/section_label.dart';

/// A widget that displays the content for the queries section, including:
/// - A section label for total queries in the last 24 hours.
/// - A graph visualizing the queries.
/// - A legend indicating blocked and not blocked queries.
///
/// This widget is intended to be used within the home charts area of the app.
class QueriesContent extends StatelessWidget {
  const QueriesContent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionLabel(
          label: AppLocalizations.of(context)!.totalQueries24,
        ),
        Container(
          width: double.maxFinite,
          height: 350,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: const QueriesGraph(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            QueriesLegendDot(
              colorIndex: 0,
              label: AppLocalizations.of(context)!.blocked,
            ),
            QueriesLegendDot(
              colorIndex: 3,
              label: AppLocalizations.of(context)!.notBlocked,
            ),
          ],
        ),
      ],
    );
  }
}

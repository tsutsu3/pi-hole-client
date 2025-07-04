import 'package:flutter/material.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/client_activity_chart_section.dart';
import 'package:pi_hole_client/screens/home/widgets/home_charts/total_queries_chart_section.dart';

/// A responsive container widget that displays two types of Pi-hole charts:
///
/// This widget does **not** depend directly on any provider or application state.
/// Instead, it delegates data access to the internal chart sections, making it
/// lightweight and rebuild-safe.
///
/// ### Contained charts:
/// - [TotalQueriesChartSection] — Displays DNS query and ad-block trends over time.
/// - [ClientActivityChartSection] — Visualizes traffic from each client IP over time.
///
/// ### Features:
/// - Responsive layout: Renders charts full-width or half-width based on screen size.
/// - Stateless and rebuild-optimized: Does not react to periodic updates unless passed data changes.
/// - Layout-only concern: All logic related to status or data loading is encapsulated inside the chart widgets.
class HomeCharts extends StatelessWidget {
  const HomeCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Wrap(
      children: [
        TotalQueriesChartSection(width: width),
        ClientActivityChartSection(width: width),
      ],
    );
  }
}

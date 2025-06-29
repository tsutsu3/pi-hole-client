import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/status_provider.dart';
import 'package:pi_hole_client/screens/home/widgets/client_activity_chart_section.dart';
import 'package:pi_hole_client/screens/home/widgets/total_queries_chart_section.dart';
import 'package:provider/provider.dart';

/// A responsive widget that displays two types of Pi-hole charts:
/// - Total queries and ads over time
/// - Client activity over time
///
/// This widget reacts to the current [LoadStatus] from [StatusProvider]:
/// - Shows a loading spinner while data is loading
/// - Shows chart visualizations when data is loaded
/// - Displays an error icon and message if loading fails
///
/// It also includes logic to handle:
/// - Conditional rendering based on available data
/// - Responsive layout between full-width and half-width charts
/// - Graph color assignment based on clients' IP addresses
class HomeCharts extends StatelessWidget {
  const HomeCharts({super.key});

  @override
  Widget build(BuildContext context) {
    final statusProvider = Provider.of<StatusProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);

    final width = MediaQuery.of(context).size.width;

    final clientsListIps = statusProvider.getOvertimeData != null
        ? statusProvider.getOvertimeData!.clients.map((client) {
            return client.ip;
          }).toList()
        : <String>[];

    return Wrap(
      children: [
        TotalQueriesChartSection(
          width: width,
          statusProvider: statusProvider,
          appConfigProvider: appConfigProvider,
        ),
        ClientActivityChartSection(
          width: width,
          statusProvider: statusProvider,
          appConfigProvider: appConfigProvider,
          clientsListIps: clientsListIps,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:provider/provider.dart';

class LogStatus extends StatelessWidget {
  final String status;
  final bool showIcon;

  const LogStatus({
    super.key,
    required this.status,
    required this.showIcon,
  });

  @override
  Widget build(BuildContext context) {
    final serverProvider = Provider.of<ServersProvider>(context);

    Widget logStatusWidget({
      required IconData icon,
      required Color color,
      required String text,
    }) {
      return Row(
        children: showIcon == true
            ? [
                Icon(
                  icon,
                  color: color,
                  size: 14,
                ),
                const SizedBox(width: 10),
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ),
              ]
            : [
                Text(
                  text,
                  style: TextStyle(
                    color: color,
                    fontWeight: FontWeight.w400,
                    fontSize: 13,
                  ),
                ),
              ],
      );
    }

    final queryStatus = serverProvider.getQueryStatus(status);
    if (queryStatus == null) {
      return logStatusWidget(
        icon: Icons.shield_rounded,
        color: Colors.grey,
        text: 'Unknown',
      );
    }

    return logStatusWidget(
      icon: queryStatus.icon,
      color: queryStatus.color,
      text: queryStatus.text,
    );
  }
}

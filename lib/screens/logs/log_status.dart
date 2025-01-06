import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:provider/provider.dart';

class LogStatus extends StatelessWidget {
  const LogStatus({
    super.key,
    required this.status,
    required this.showIcon,
  });

  final String status;
  final bool showIcon;

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
                const Flexible(child: SizedBox(width: 10)),
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
        color: Theme.of(context).extension<AppColors>()!.queryGrey!,
        text: 'Unknown',
      );
    }

    final colorTheme = serverProvider.colors;

    return logStatusWidget(
      icon: queryStatus.icon,
      color: convertColor(colorTheme, queryStatus.color),
      text: queryStatus.text,
    );
  }
}

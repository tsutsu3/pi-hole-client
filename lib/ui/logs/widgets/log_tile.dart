import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/logs/widgets/log_status.dart';
import 'package:pi_hole_client/utils/format.dart';

class LogTile extends StatelessWidget {
  const LogTile({
    required this.log,
    required this.showLogDetails,
    super.key,
    this.isLogSelected,
  });

  final Log log;
  final void Function(Log) showLogDetails;
  final bool? isLogSelected;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isLarge =
        MediaQuery.of(context).size.width > ResponsiveConstants.large;

    final innerContent = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (log.status != null)
                LogStatus(status: log.status!, showIcon: true),
              const SizedBox(height: 10),
              Text(
                log.url,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                log.device,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: theme.listTileTheme.textColor,
                  fontSize: 14,
                  height: 1.4,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
        if (isLarge) const SizedBox(width: 16),
        Text(formatTimestamp(log.dateTime, 'HH:mm:ss')),
      ],
    );

    if (isLarge) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Material(
          borderRadius: BorderRadius.circular(28),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () => showLogDetails(log),
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 200),
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: isLogSelected == true
                    ? theme.colorScheme.primaryContainer
                    : null,
              ),
              child: innerContent,
            ),
          ),
        ),
      );
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => showLogDetails(log),
        child: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: innerContent,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/urls.dart';
import 'package:pi_hole_client/ui/logs/view_models/logs_viewmodel.dart';
import 'package:pi_hole_client/ui/logs/widgets/log_status.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:pi_hole_client/utils/math.dart';
import 'package:pi_hole_client/utils/open_url.dart';
import 'package:provider/provider.dart';

class LogDetailsScreen extends StatelessWidget {
  const LogDetailsScreen({
    required this.log,
    required this.whiteBlackList,
    super.key,
  });

  final Log log;
  final void Function(String, Log) whiteBlackList;

  @override
  Widget build(BuildContext context) {
    final logsViewModel = Provider.of<LogsViewModel>(context);

    Widget item(IconData icon, String label, Widget value) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.onSurface),
            const SizedBox(width: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                value,
              ],
            ),
          ],
        ),
      );
    }

    Widget blackWhiteListButton() {
      if (logsViewModel.isAllowedOrRetried(log.status)) {
        return IconButton(
          onPressed: () {
            Navigator.maybePop(context);
            whiteBlackList('black', log);
          },
          icon: const Icon(Icons.gpp_bad_rounded),
          tooltip: AppLocalizations.of(context)!.blacklist,
        );
      } else {
        return IconButton(
          onPressed: () {
            Navigator.maybePop(context);
            whiteBlackList('white', log);
          },
          icon: const Icon(Icons.verified_user_rounded),
          tooltip: AppLocalizations.of(context)!.whitelist,
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.logDetails),
        actions: [
          IconButton(
            onPressed: () => openUrl('${Urls.googleSearch}${log.url}'),
            icon: const Icon(Icons.travel_explore_rounded),
            tooltip: AppLocalizations.of(context)!.domainSearchOnline,
          ),
          blackWhiteListButton(),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(Icons.link),
              title: Text(AppLocalizations.of(context)!.url),
              subtitle: Text(log.url),
            ),
            ListTile(
              leading: const Icon(Icons.http_rounded),
              title: Text(AppLocalizations.of(context)!.type),
              subtitle: Text(log.type.name.toUpperCase()),
            ),
            ListTile(
              leading: const Icon(Icons.phone_android_rounded),
              title: Text(AppLocalizations.of(context)!.device),
              subtitle: Text(log.device),
            ),
            ListTile(
              leading: const Icon(Icons.access_time_outlined),
              title: Text(AppLocalizations.of(context)!.time),
              subtitle: Text(
                formatTimestamp(log.dateTime, kUnifiedDateTimeLogFormat),
              ),
            ),
            if (log.status != null)
              item(
                Icons.shield_outlined,
                AppLocalizations.of(context)!.status,
                LogStatus(status: log.status!, showIcon: false),
              ),
            if (log.status == QueryStatusType.forwarded &&
                log.answeredBy != null)
              ListTile(
                leading: const Icon(Icons.domain),
                title: Text(AppLocalizations.of(context)!.answeredBy),
                subtitle: Text(log.answeredBy!),
              ),
            ListTile(
              leading: const Icon(Icons.system_update_alt_outlined),
              title: Text(AppLocalizations.of(context)!.reply),
              subtitle: Text(
                '${log.replyType?.name.toUpperCase() ?? 'N/A'} (${prettyReplyTimeWithUnit(log.replyTime)})',
              ),
            ),
          ],
        ),
      ),
    );
  }
}

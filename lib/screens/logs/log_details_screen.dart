// ignore_for_file: prefer_single_quotes

import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:pi_hole_client/providers/filters_provider.dart';

import 'package:pi_hole_client/screens/logs/log_status.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';

import 'package:pi_hole_client/functions/open_url.dart';
import 'package:pi_hole_client/models/log.dart';
import 'package:pi_hole_client/constants/search_domain_base_url.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:provider/provider.dart';

class LogDetailsScreen extends StatelessWidget {
  final Log log;
  final void Function(String, Log) whiteBlackList;

  const LogDetailsScreen({
    super.key,
    required this.log,
    required this.whiteBlackList,
  });

  @override
  Widget build(BuildContext context) {
    final filterProvider = Provider.of<FiltersProvider>(context);

    Widget item(IconData icon, String label, Widget value) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Icon(
              icon,
              color: Theme.of(context).colorScheme.onSurface,
            ),
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
      if (filterProvider.statusAllowedAndRetried
          .contains(int.parse(log.status!))) {
        return IconButton(
          onPressed: () {
            Navigator.pop(context);
            whiteBlackList('black', log);
          },
          icon: const Icon(Icons.gpp_bad_rounded),
          tooltip: AppLocalizations.of(context)!.blacklist,
        );
      } else {
        return IconButton(
          onPressed: () {
            Navigator.pop(context);
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
            onPressed: () => openUrl('$searchDomainBaseUrlGoogle${log.url}'),
            icon: const Icon(Icons.travel_explore_rounded),
            tooltip: AppLocalizations.of(context)!.searchDomainInternet,
          ),
          blackWhiteListButton(),
          const SizedBox(width: 10),
        ],
      ),
      body: ListView(
        children: [
          CustomListTile(
            leadingIcon: Icons.link,
            label: AppLocalizations.of(context)!.url,
            description: log.url,
          ),
          CustomListTile(
            leadingIcon: Icons.http_rounded,
            label: AppLocalizations.of(context)!.type,
            description: log.type,
          ),
          CustomListTile(
            leadingIcon: Icons.phone_android_rounded,
            label: AppLocalizations.of(context)!.device,
            description: log.device,
          ),
          CustomListTile(
            leadingIcon: Icons.access_time_outlined,
            label: AppLocalizations.of(context)!.time,
            description: formatTimestamp(log.dateTime, 'HH:mm:ss'),
          ),
          if (log.status != null)
            item(
              Icons.shield_outlined,
              AppLocalizations.of(context)!.status,
              LogStatus(status: log.status!, showIcon: false),
            ),
          if (log.status == '2' && log.answeredBy != null)
            CustomListTile(
              leadingIcon: Icons.domain,
              label: AppLocalizations.of(context)!.answeredBy,
              description: log.answeredBy!,
            ),
          CustomListTile(
            leadingIcon: Icons.system_update_alt_outlined,
            label: AppLocalizations.of(context)!.reply,
            description:
                '${log.replyType} (${(log.replyTime / BigInt.from(10))} ms)',
          ),
        ],
      ),
    );
  }
}

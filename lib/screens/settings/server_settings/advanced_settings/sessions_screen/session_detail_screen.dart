import 'package:flutter/material.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/sessions.dart';
import 'package:pi_hole_client/widgets/custom_list_tile.dart';
import 'package:pi_hole_client/widgets/delete_modal.dart';
import 'package:pi_hole_client/widgets/section_label.dart';

class SessionDetailScreen extends StatelessWidget {
  const SessionDetailScreen({
    required this.session,
    required this.onDelete,
    super.key,
  });

  final SessionInfo session;
  final void Function(SessionInfo) onDelete;

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.session),
        actions: [
          if (!session.isCurrentSession)
            IconButton(
              onPressed: () => showDialog(
                context: context,
                useRootNavigator:
                    false, // Prevents unexpected app exit on mobile when pressing back
                builder: (context) => DeleteModal(
                  title: AppLocalizations.of(context)!.deleteSession,
                  message: AppLocalizations.of(context)!.deleteSessionMessage,
                  onDelete: () {
                    Navigator.maybePop(context);
                    onDelete(session);
                  },
                ),
              ),
              icon: const Icon(Icons.delete_rounded),
            ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionLabel(label: locale.sessionStatus),
              CustomListTile(
                leadingIcon: Icons.tag_rounded,
                label: locale.id,
                description: session.id.toString(),
              ),
              CustomListTile(
                leadingIcon: Icons.check_rounded,
                label: locale.validSession,
                description: session.isValid.toString(),
              ),
              CustomListTile(
                leadingIcon: Icons.my_location_rounded,
                label: locale.currentSession,
                description: session.isCurrentSession.toString(),
              ),
              CustomListTile(
                leadingIcon: Icons.event_busy_rounded,
                label: locale.validUntil,
                description: formatTimestamp(
                  session.validUntil,
                  kUnifiedDateTimeLogFormat,
                ),
              ),
              SectionLabel(label: locale.clientInformation),
              CustomListTile(
                leadingIcon: Icons.location_on_rounded,
                label: locale.clientIp,
                description: session.clientIp,
              ),
              CustomListTile(
                leadingIcon: Icons.lock_rounded,
                label: locale.tlsStatus,
                description: session.tlsStatus.name,
              ),
              CustomListTile(
                leadingIcon: Icons.settings_applications,
                label: locale.usedAppPassword,
                description: session.isApp.toString(),
              ),
              CustomListTile(
                leadingIcon: Icons.code_rounded,
                label: locale.usedCLIPassword,
                description: session.isCli.toString(),
              ),
              SectionLabel(label: locale.activityLog),
              CustomListTile(
                leadingIcon: Icons.smart_toy_outlined,
                label: locale.userAgent,
                description: session.userAgent ?? locale.unknown,
              ),
              CustomListTile(
                leadingIcon: Icons.event_available_rounded,
                label: locale.loginTime,
                description:
                    formatTimestamp(session.loginAt, kUnifiedDateTimeLogFormat),
              ),
              CustomListTile(
                leadingIcon: Icons.event_repeat_rounded,
                label: locale.lastActive,
                description: formatTimestamp(
                  session.lastActive,
                  kUnifiedDateTimeLogFormat,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/formats.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/utils/format.dart';

class SessionDetailScreen extends StatelessWidget {
  const SessionDetailScreen({
    required this.session,
    required this.onDelete,
    super.key,
  });

  final AuthSession session;
  final void Function(AuthSession) onDelete;

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
                  title: AppLocalizations.of(context)!.sessionDelete,
                  message: AppLocalizations.of(context)!.sessionDeleteMessage,
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
              ListTile(
                leading: const Icon(Icons.tag_rounded),
                title: Text(locale.id),
                subtitle: Text(session.id.toString()),
              ),
              ListTile(
                leading: const Icon(Icons.check_rounded),
                title: Text(locale.sessionValid),
                subtitle: Text(session.isValid.toString()),
              ),
              ListTile(
                leading: const Icon(Icons.my_location_rounded),
                title: Text(locale.sessionCurrent),
                subtitle: Text(session.isCurrentSession.toString()),
              ),
              ListTile(
                leading: const Icon(Icons.event_busy_rounded),
                title: Text(locale.validUntil),
                subtitle: Text(
                  formatTimestamp(
                    session.validUntil,
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
              ),
              SectionLabel(label: locale.clientInformation),
              ListTile(
                leading: const Icon(Icons.location_on_rounded),
                title: Text(locale.clientIp),
                subtitle: Text(session.clientIp),
              ),
              ListTile(
                leading: const Icon(Icons.lock_rounded),
                title: Text(locale.tlsStatus),
                subtitle: Text(session.tlsStatus.name),
              ),
              ListTile(
                leading: const Icon(Icons.settings_applications),
                title: Text(locale.usedAppPassword),
                subtitle: Text(session.isApp.toString()),
              ),
              ListTile(
                leading: const Icon(Icons.code_rounded),
                title: Text(locale.usedCLIPassword),
                subtitle: Text(session.isCli.toString()),
              ),
              SectionLabel(label: locale.activityLog),
              ListTile(
                leading: const Icon(Icons.smart_toy_outlined),
                title: Text(locale.userAgent),
                subtitle: Text(session.userAgent ?? locale.unknown),
              ),
              ListTile(
                leading: const Icon(Icons.event_available_rounded),
                title: Text(locale.loginTime),
                subtitle: Text(
                  formatTimestamp(
                    session.loginAt,
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.event_repeat_rounded),
                title: Text(locale.lastActive),
                subtitle: Text(
                  formatTimestamp(
                    session.lastActive,
                    kUnifiedDateTimeLogFormat,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/gravity_provider.dart';
import 'package:pi_hole_client/widgets/section_label.dart';
import 'package:provider/provider.dart';

class GravityUpdate extends StatefulWidget {
  const GravityUpdate({super.key});

  @override
  State<GravityUpdate> createState() => _GravityUpdateState();
}

class _GravityUpdateState extends State<GravityUpdate> {
  final ScrollController _logScrollController = ScrollController();
  List<String> _previousLogs = [];

  Future<void> runGravity() async {
    _previousLogs = [];
    final gravityProvider = context.read<GravityUpdateProvider>();
    logger.i('Starting gravity update...');
    await gravityProvider.start();
    logger.i('Gravity update completed successfully.');
  }

  SectionLabel buildStatusLabel(BuildContext context, GravityStatus status) {
    final theme = Theme.of(context).extension<AppColors>()!;
    final loc = AppLocalizations.of(context)!;

    switch (status) {
      case GravityStatus.success:
        return SectionLabel(
          icon: Icons.check_circle,
          label: loc.gravityUpdateCompleted,
          color: theme.queryGreen,
        );
      case GravityStatus.error:
        return SectionLabel(
          icon: Icons.error,
          label: loc.gravityUpdateFailed,
          color: theme.queryRed,
        );
      case GravityStatus.running:
        return SectionLabel(
          icon: Icons.hourglass_bottom,
          label: loc.gravityIsRunning,
          color: theme.queryOrange,
        );
      case GravityStatus.idle:
        return SectionLabel(
          icon: Icons.pause_circle_filled,
          label: loc.gravityNotYetRun,
          color: theme.queryGrey,
        );
    }
  }

  Widget buildMessageTile({
    required String title,
    required String subtitle,
    Icon? icon,
  }) {
    return ListTile(
      dense: true,
      contentPadding: const EdgeInsets.only(left: 32),
      leading: icon,
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(subtitle),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final gravityLogs = context.watch<GravityUpdateProvider>().logs;

    if (gravityLogs.length > _previousLogs.length) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_logScrollController.hasClients) {
          _logScrollController.animateTo(
            _logScrollController.position.maxScrollExtent,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeOut,
          );
        }
      });

      _previousLogs = List.from(gravityLogs);
    }
  }

  @override
  void dispose() {
    _logScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final appConfigProvider = context.watch<AppConfigProvider>();
    final gravityProvider = context.watch<GravityUpdateProvider>();

    return Stack(
      children: [
        ListView(
          children: [
            buildStatusLabel(context, gravityProvider.status),
            Padding(
              padding: const EdgeInsets.only(left: 32, top: 4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (gravityProvider.status == GravityStatus.success ||
                      gravityProvider.status == GravityStatus.error)
                    Text(
                      formatWithDuration(
                        gravityProvider.startedAtTime,
                        gravityProvider.completedAtTime,
                      ),
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  if (gravityProvider.status == GravityStatus.idle)
                    Text(
                      AppLocalizations.of(context)!.notYetExecuted,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  if (gravityProvider.status == GravityStatus.running)
                    Padding(
                      padding: const EdgeInsets.only(top: 4),
                      child: Text(
                        'Updating... this may take a while. Please do not navigate away from or close this page.',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SectionLabel(
              icon: Icons.circle_notifications_outlined,
              label: AppLocalizations.of(context)!.messages,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
            ),
            if (gravityProvider.status == GravityStatus.success ||
                gravityProvider.status == GravityStatus.error)
              if (gravityProvider.messages.isNotEmpty)
                ...gravityProvider.messages.map((message) {
                  return buildMessageTile(
                    icon: const Icon(Icons.warning_amber_rounded),
                    title: message.message,
                    subtitle: message.url,
                  );
                })
              else
                buildMessageTile(
                  title: AppLocalizations.of(context)!.noMessages,
                  subtitle: 'No issues were reported',
                )
            else if (gravityProvider.status == GravityStatus.running)
              buildMessageTile(
                title: 'Running...',
                subtitle: 'Waiting for messages...',
              )
            else
              buildMessageTile(
                title: AppLocalizations.of(context)!.noMessages,
                subtitle: 'No issues were reported',
              ),
            const SizedBox(height: 24),
            SectionLabel(
              icon: Icons.code_rounded,
              label: AppLocalizations.of(context)!.executionLog,
              padding: const EdgeInsets.only(
                left: 16,
                right: 16,
                top: 16,
                bottom: 8,
              ),
            ),
            Theme(
              data: Theme.of(context).copyWith(
                dividerColor: Colors.transparent,
                hoverColor: Colors.transparent,
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: ExpansionTile(
                    collapsedIconColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    title: Text(
                      gravityProvider.logs.isNotEmpty
                          ? gravityProvider.logs.last == ''
                              ? '...'
                              : gravityProvider.logs.last
                          : 'No logs',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      softWrap: false,
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: Divider(
                          height: 1,
                          thickness: 1,
                          color: Theme.of(context).dividerColor,
                        ),
                      ),
                      const SizedBox(height: 16),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 3,
                        child: Scrollbar(
                          controller: _logScrollController,
                          child: ListView.builder(
                            controller: _logScrollController,
                            padding: const EdgeInsets.only(
                              left: 32,
                              right: 32,
                              bottom: 8,
                            ),
                            itemCount: gravityProvider.logs.length,
                            itemBuilder: (context, index) {
                              return Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  normalizeLogOutput(
                                    gravityProvider.logs[index],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 96,
            ),
          ],
        ),
        SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                bottom: gravityProvider.status == GravityStatus.running
                    ? -70 // running: hide
                    : appConfigProvider.showingSnackbar
                        ? 70 // show snackbar: up
                        : 20, // normal
                right: 20,
                child: FloatingActionButton(
                  onPressed: gravityProvider.status == GravityStatus.running
                      ? null
                      : runGravity,
                  child: const Icon(Icons.rocket_launch_rounded),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

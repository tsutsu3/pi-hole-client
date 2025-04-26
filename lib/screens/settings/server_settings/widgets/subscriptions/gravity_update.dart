import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
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

  Widget buildMessageCard({
    required String title,
    required String subtitle,
    required VoidCallback onDelete,
    required Icon icon,
    Key? key,
  }) {
    return Dismissible(
      key: key ?? UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        color: Theme.of(context).extension<AppColors>()!.commonRed,
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      onDismissed: (_) => onDelete(),
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 16,
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: icon,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),
              ),
              Icon(
                Icons.swipe_left_alt_rounded,
                color: Theme.of(context).colorScheme.outlineVariant,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildMessageTilesFromProvider(
    BuildContext context,
    GravityUpdateProvider provider,
  ) {
    final l10n = AppLocalizations.of(context)!;

    if (provider.status == GravityStatus.success) {
      if (provider.messages.isNotEmpty) {
        return Column(
          children: provider.messages.map((message) {
            return buildMessageCard(
              key: ValueKey(message.url),
              icon: const Icon(Icons.warning_amber_rounded),
              title: message.message,
              subtitle: message.url,
              onDelete: () => handleDeleteMessage(
                context: context,
                provider: provider,
                appConfigProvider: context.read<AppConfigProvider>(),
                messageId: message.id,
              ),
            );
          }).toList(),
        );
      } else {
        // No messages
        return buildMessageTile(
          title: l10n.noMessages,
          subtitle: l10n.noIssuesReported,
        );
      }
    }

    if (provider.status == GravityStatus.running) {
      return buildMessageTile(
        title: l10n.runningStatus,
        subtitle: l10n.runningSubtitle,
      );
    }

    if (provider.status == GravityStatus.error) {
      return buildMessageTile(
        title: l10n.noMessages,
        subtitle: l10n.noIssuesReported,
      );
    }

    // GravityStatus.idle
    return buildMessageTile(
      title: l10n.noMessages,
      subtitle: l10n.noIssuesReported,
    );
  }

  Future<void> handleDeleteMessage({
    required BuildContext context,
    required GravityUpdateProvider provider,
    required AppConfigProvider appConfigProvider,
    required int messageId,
  }) async {
    final deleted = await provider.removeMessage(messageId);
    if (deleted == true) {
      if (!context.mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.messageDeleteSuccess,
      );
    } else {
      if (!context.mounted) return;
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.messageDeleteFailed,
      );
    }
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

    return SafeArea(
      child: Stack(
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
                          AppLocalizations.of(context)!
                              .updatingInProgressMessage,
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
              buildMessageTilesFromProvider(context, gravityProvider),
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
                            ? normalizeLogOutput(gravityProvider.logs.last) ==
                                    ''
                                ? '...'
                                : normalizeLogOutput(gravityProvider.logs.last)
                            : AppLocalizations.of(context)!.noLogs,
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
          Stack(
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
        ],
      ),
    );
  }
}

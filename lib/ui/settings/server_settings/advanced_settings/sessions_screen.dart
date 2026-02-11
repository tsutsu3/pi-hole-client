import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/session_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/session_list_view.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/viewmodel/sessions_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
final _fakeSession = AuthSession(
  id: 0,
  isValid: false,
  isCurrentSession: false,
  tlsStatus: TlsStatus.none,
  isApp: false,
  isCli: false,
  loginAt: DateTime(2025, 6, 28, 12),
  lastActive: DateTime(2025, 6, 28, 15),
  validUntil: DateTime(2025, 6, 28, 17),
  clientIp: '192.168.1.100',
  userAgent: 'Dart/3.7 (dart:io)',
);
final _fakeSessions = List.filled(5, _fakeSession);

/// A screen that displays session information to the user.
///
/// Users can view their current sessions and delete them if necessary.
/// Session information is fetched and displayed only when this screen is accessed.
class SessionsScreen extends StatefulWidget {
  const SessionsScreen({required this.viewModel, super.key});

  final SessionsViewModel viewModel;

  @override
  State<SessionsScreen> createState() => _SessionsScreenState();
}

class _SessionsScreenState extends State<SessionsScreen> {
  Future<void> _removeSession(AuthSession session) async {
    final locale = AppLocalizations.of(context)!;
    final appConfigProvider = context.read<AppConfigProvider>();
    final process = ProcessModal(context: context);
    process.open(locale.deleting);

    try {
      await widget.viewModel.deleteSession.runAsync(session.id);
      if (!mounted) return;
      process.close();
      // TODO: migrate to context.pop() when detail screen uses go_router
      await Navigator.maybePop(context);

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.sessionDeleteSuccess,
      );
    } catch (_) {
      if (!mounted) return;
      process.close();
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: locale.sessionDeleteFailed,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return ListenableBuilder(
      listenable: widget.viewModel,
      builder: (context, _) {
        final viewModel = widget.viewModel;
        final isLoading = viewModel.loadSessions.isRunning.value;
        final hasError = viewModel.loadSessions.errors.value != null;
        final sessions = viewModel.loadSessions.value;

        return ScrollConfiguration(
          behavior: CustomScrollBehavior(),
          child: Scaffold(
            appBar: AppBar(
              title: Text(locale.sessions),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: IconButton(
                    icon: const Icon(Icons.refresh_rounded),
                    onPressed: () => viewModel.loadSessions.run(),
                    tooltip: locale.refresh,
                  ),
                ),
              ],
            ),
            body: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  try {
                    await viewModel.loadSessions.runAsync();
                  } catch (_) {
                    // Error handled by command.errors
                  }
                },
                child: Builder(
                  builder: (context) {
                    if (isLoading) {
                      return Skeletonizer(
                        effect: ShimmerEffect(
                          baseColor: Theme.of(
                            context,
                          ).colorScheme.secondaryContainer,
                          highlightColor: Theme.of(context).colorScheme.surface,
                        ),
                        child: SessionListView(
                          sessions: _fakeSessions,
                          onSessionTap: (session) {},
                        ),
                      );
                    }

                    if (hasError) {
                      return ErrorMessage(message: locale.dataFetchFailed);
                    }

                    if (sessions.isEmpty) {
                      return const EmptyDataScreen();
                    }

                    return SessionListView(
                      sessions: sessions,
                      onSessionTap: (session) {
                        // TODO: migrate to go_router named route
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SessionDetailScreen(
                              session: session,
                              onDelete: _removeSession,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

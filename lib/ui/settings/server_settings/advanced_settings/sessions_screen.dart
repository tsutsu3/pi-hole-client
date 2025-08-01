import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/data/services/api/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/sessions.dart';
import 'package:pi_hole_client/ui/common/empty_data_screen.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/behavior/custom_scroll_behavior.dart';
import 'package:pi_hole_client/ui/core/ui/components/error_message.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/session_detail_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/session_list_view.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

// fake data for Skeletonizer
final _fakeSessionInfo = SessionInfo(
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
final _fakeSessionsInfo =
    SessionsInfo(sessions: List.filled(5, _fakeSessionInfo));

/// A screen that displays session information to the user.
///
/// Users can view their current sessions and delete them if necessary.
/// Session information is fetched and displayed only when this screen is accessed.
///
/// The displayed session information does not update automatically after session deletion
/// or when viewing session details. To refresh the session list, users must either
/// navigate back and reopen this screen, or tap the refresh icon in the top right corner.
class SessionsScreen extends StatefulWidget {
  const SessionsScreen({super.key});

  @override
  State<SessionsScreen> createState() => _SessionState();
}

class _SessionState extends State<SessionsScreen> {
  late AppConfigProvider appConfigProvider;
  SessionInfo? selectedSession;
  SessionsInfo? sessionsInfo;
  ApiGateway? apiGateway;
  ApiGateway? previousApiGateway;
  bool isLoading = true;
  bool isFetchError = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final currentApiGateway =
        context.watch<ServersProvider>().selectedApiGateway;
    appConfigProvider = context.watch<AppConfigProvider>();

    // Check if the selected API gateway has changed
    if (currentApiGateway != previousApiGateway) {
      previousApiGateway = currentApiGateway;
      apiGateway = currentApiGateway;

      if (apiGateway != null) {
        _loadSessions();
      } else {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    previousApiGateway = null;
    isLoading = false;
  }

  @override
  Widget build(BuildContext context) {
    if (apiGateway == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.sessions),
        ),
        body: const SafeArea(
          child: EmptyDataScreen(),
        ),
      );
    }

    Future<void> removeSession(SessionInfo session) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.deleting);

      final result = await apiGateway?.deleteSession(session.id);
      if (!context.mounted) return;

      process.close();

      if (result?.result == APiResponseType.success) {
        await Navigator.maybePop(context);
        await _loadSessions();

        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.sessionRemoved,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.sessionRemoveError,
        );
      }
    }

    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(AppLocalizations.of(context)!.sessions),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8),
              child: IconButton(
                icon: const Icon(Icons.refresh_rounded),
                onPressed: _loadSessions,
                tooltip: AppLocalizations.of(context)!.refresh,
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Builder(
            builder: (context) {
              if (isLoading) {
                return Skeletonizer(
                  effect: ShimmerEffect(
                    baseColor: Theme.of(context).colorScheme.secondaryContainer,
                    highlightColor: Theme.of(context).colorScheme.surface,
                  ),
                  child: SessionListView(
                    sessionsInfo: _fakeSessionsInfo,
                    onSessionTap: (session) {},
                  ),
                );
              }

              if (isFetchError) {
                return ErrorMessage(
                  message: AppLocalizations.of(context)!.dataFetchFailed,
                );
              }

              if (sessionsInfo == null || sessionsInfo!.sessions.isEmpty) {
                return const EmptyDataScreen();
              }

              return SessionListView(
                sessionsInfo: sessionsInfo!,
                onSessionTap: (session) {
                  setState(() {
                    selectedSession = session;
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SessionDetailScreen(
                        session: session,
                        onDelete: removeSession,
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }

  Future<void> _loadSessions() async {
    if (!mounted) return;

    setState(() {
      isLoading = true;
    });

    final result = await apiGateway!.getSessions();
    if (!mounted) return;

    setState(() {
      if (result.result == APiResponseType.success) {
        sessionsInfo = result.data;
      } else {
        isFetchError = true;
        logger.e('Failed to load sessions');
      }
      isLoading = false;
    });
  }
}

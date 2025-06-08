import 'package:flutter/material.dart';
import 'package:pi_hole_client/classes/custom_scroll_behavior.dart';
import 'package:pi_hole_client/classes/process_modal.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/enums.dart';
import 'package:pi_hole_client/constants/formats.dart';
import 'package:pi_hole_client/functions/format.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/functions/snackbar.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/models/gateways.dart';
import 'package:pi_hole_client/models/sessions.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/providers/servers_provider.dart';
import 'package:pi_hole_client/screens/common/empty_data_screen.dart';
import 'package:pi_hole_client/screens/settings/server_settings/advanced_settings/sessions_screen/session_detail_screen.dart';
import 'package:provider/provider.dart';

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
        logger.e('Failed to load sessions');
      }
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppColors>()!;

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

    Widget buildStatusIcon(bool isValid) {
      if (isValid) {
        return Icon(
          Icons.check_rounded,
          color: theme.queryGreen,
        );
      }

      return Icon(
        Icons.close_rounded,
        color: theme.queryGrey,
      );
    }

    Widget buildTlsLine(TlsStatus tlsStatus) {
      IconData iconData;
      Color iconColor;
      String statusText;

      switch (tlsStatus) {
        case TlsStatus.none:
          iconData = Icons.no_encryption_rounded;
          iconColor = theme.queryGrey ?? Colors.grey;
          statusText = 'OFF';
        case TlsStatus.login:
          iconData = Icons.lock_rounded;
          iconColor = theme.queryGreen ?? Colors.green;
          statusText = 'ON';
        case TlsStatus.mixed:
          iconData = Icons.lock_rounded;
          iconColor = theme.queryGreen ?? Colors.green;
          statusText = 'ON';
      }

      return Row(
        children: [
          Icon(iconData, size: 14, color: iconColor),
          const SizedBox(width: 4),
          Text(
            'TLS: $statusText',
            style: TextStyle(
              fontSize: 12,
              color: iconColor,
            ),
          ),
        ],
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
        ),
        body: SafeArea(
          child: isLoading
              ? const Center(child: CircularProgressIndicator())
              : sessionsInfo == null || sessionsInfo!.sessions.isEmpty
                  ? const EmptyDataScreen()
                  : ListView.builder(
                      padding: const EdgeInsets.only(top: 32),
                      itemCount: sessionsInfo!.sessions.length,
                      itemBuilder: (context, index) {
                        final session = sessionsInfo!.sessions[index];
                        return ListTile(
                          leading: buildStatusIcon(session.isValid),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              buildTlsLine(session.tlsStatus),
                              Text(
                                session.clientIp,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          subtitle: Text(
                            formatTimestamp(
                              session.validUntil,
                              kUnifiedDateTimeLogFormat,
                            ),
                          ),
                          trailing: session.isCurrentSession
                              ? Chip(
                                  avatar: const Icon(Icons.star_rounded),
                                  label:
                                      Text(AppLocalizations.of(context)!.inUse),
                                )
                              : null,
                          onTap: () {
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
}

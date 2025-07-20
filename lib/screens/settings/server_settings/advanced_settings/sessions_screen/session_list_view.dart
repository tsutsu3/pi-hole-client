import 'package:flutter/material.dart';
import 'package:pi_hole_client/config2/enums.dart';
import 'package:pi_hole_client/config2/formats.dart';
import 'package:pi_hole_client/models/sessions.dart';
import 'package:pi_hole_client/ui2/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui2/core/themes/theme.dart';
import 'package:pi_hole_client/utils2/format.dart';

/// A stateless widget that displays a list of active Pi-hole sessions with their
/// status, IP address, TLS status, and expiration time.
///
/// Each session is represented as a [ListTile] displaying:
/// - A status icon indicating whether the session is valid.
/// - A TLS status row with an icon and localized label (On/Off).
/// - The client IP address in bold.
/// - A subtitle showing the session's expiration timestamp.
/// - A trailing chip if the session is currently active.
///
/// Tapping a session triggers the optional [onSessionTap] callback with the
/// selected [SessionInfo] instance.
///
/// {@tool snippet}
/// Example usage:
/// ```dart
/// SessionListView(
///   sessionsInfo: mySessionsInfo,
///   onSessionTap: (session) {
///     print('Selected: ${session.clientIp}');
///   },
/// )
/// ```
/// {@end-tool}
class SessionListView extends StatelessWidget {
  const SessionListView({
    required this.sessionsInfo,
    this.onSessionTap,
    super.key,
  });

  final SessionsInfo sessionsInfo;
  final void Function(SessionInfo)? onSessionTap;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 32),
      itemCount: sessionsInfo.sessions.length,
      itemBuilder: (context, index) {
        final session = sessionsInfo.sessions[index];
        return ListTile(
          leading: _buildStatusIcon(context, session.isValid),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildTlsLine(context, session.tlsStatus),
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
            formatTimestamp(session.validUntil, kUnifiedDateTimeLogFormat),
          ),
          trailing: session.isCurrentSession
              ? Chip(
                  avatar: const Icon(Icons.star_rounded),
                  label: Text(AppLocalizations.of(context)!.inUse),
                )
              : null,
          onTap: () => onSessionTap?.call(session),
        );
      },
    );
  }

  /// Builds a status icon indicating whether a session is valid or not.
  ///
  /// Displays a green check icon if [isValid] is true, otherwise displays a grey close icon.
  /// The icon colors are retrieved from the current [AppColors] theme extension.
  ///
  /// [context] - The build context used to access theme data.
  /// [isValid] - Whether the session is valid (true) or invalid (false).
  ///
  /// Returns an [Icon] widget representing the session status.
  Widget _buildStatusIcon(BuildContext context, bool isValid) {
    final theme = Theme.of(context).extension<AppColors>()!;

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

  /// Builds a row widget displaying the TLS (Transport Layer Security) status.
  ///
  /// The row contains an icon and a text label indicating whether TLS is enabled or not,
  /// based on the provided [tlsStatus]. The icon and text color are determined by the
  /// current theme and the TLS status. The text is localized using [AppLocalizations].
  ///
  /// - [context]: The build context used to access theme and localization.
  /// - [tlsStatus]: The current TLS status, which determines the icon, color, and label.
  ///
  /// Returns a [Row] widget with an icon and a text label describing the TLS status.
  Widget _buildTlsLine(BuildContext context, TlsStatus tlsStatus) {
    final theme = Theme.of(context).extension<AppColors>()!;

    IconData iconData;
    Color iconColor;
    String statusText;

    switch (tlsStatus) {
      case TlsStatus.none:
        iconData = Icons.no_encryption_rounded;
        iconColor = theme.queryGrey ?? Colors.grey;
        statusText = AppLocalizations.of(context)!.off;
      case TlsStatus.login:
      case TlsStatus.mixed:
        iconData = Icons.lock_rounded;
        iconColor = theme.queryGreen ?? Colors.green;
        statusText = AppLocalizations.of(context)!.on;
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
}

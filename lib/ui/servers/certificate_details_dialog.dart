import 'package:flutter/material.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/utils/tls_certificate.dart';

class CertificateDetailsDialog extends StatelessWidget {
  const CertificateDetailsDialog({
    required this.title,
    required this.certificateInfo,
    this.description,
    this.actions,
    super.key,
  });

  final String title;
  final String? description;
  final TlsCertificateInfo certificateInfo;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final theme = Theme.of(context);

    Widget sectionTitle(IconData icon, String label) {
      return Row(
        children: [
          Icon(icon, size: 18, color: theme.colorScheme.onSurfaceVariant),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.onSurface,
              ),
            ),
          ),
        ],
      );
    }

    Widget keyValue({
      required IconData icon,
      required String label,
      required Widget value,
    }) {
      return ListTile(
        dense: true,
        visualDensity: VisualDensity.compact,
        leading: Icon(
          icon,
          size: 20,
          color: theme.colorScheme.onSurfaceVariant,
        ),
        title: Text(
          label,
          style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
        ),
        subtitle: value,
        contentPadding: EdgeInsets.zero,
      );
    }

    final info = certificateInfo;

    return AlertDialog(
      title: Text(title),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (description != null) ...[
              Text(
                description!,
                style: TextStyle(color: theme.colorScheme.onSurfaceVariant),
              ),
              const SizedBox(height: 12),
            ],
            Card(
              elevation: 0,
              margin: const EdgeInsets.symmetric(vertical: 8),
              color: theme.colorScheme.surfaceContainerHighest,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle(Icons.fingerprint, loc.tlsCertSha256),
                    const SizedBox(height: 8),
                    SelectableText(
                      info.sha256,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            keyValue(
              icon: Icons.badge_outlined,
              label: loc.tlsCertSubject,
              value: SelectableText(info.subject),
            ),
            keyValue(
              icon: Icons.verified_outlined,
              label: loc.tlsCertIssuer,
              value: SelectableText(info.issuer),
            ),
            keyValue(
              icon: Icons.event_outlined,
              label: loc.tlsCertValidFrom,
              value: Text(info.startValidity.toIso8601String()),
            ),
            keyValue(
              icon: Icons.event_available_outlined,
              label: loc.tlsCertValidUntil,
              value: Text(info.endValidity.toIso8601String()),
            ),
          ],
        ),
      ),
      actions: actions,
    );
  }
}

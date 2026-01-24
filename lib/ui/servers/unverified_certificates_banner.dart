import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/urls.dart';
import 'package:pi_hole_client/domain/models_old/server.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:url_launcher/url_launcher.dart';

class UnverifiedCertificatesBanner extends StatefulWidget {
  const UnverifiedCertificatesBanner({
    required this.servers,
    required this.onServerTap,
    required this.onDismiss,
    super.key,
  });

  final List<Server> servers;
  final void Function(Server server) onServerTap;
  final VoidCallback onDismiss;

  @override
  State<UnverifiedCertificatesBanner> createState() =>
      _UnverifiedCertificatesBannerState();
}

class _UnverifiedCertificatesBannerState
    extends State<UnverifiedCertificatesBanner> {
  bool _isExpanded = false;

  Future<void> _openDocumentation() async {
    final url = Uri.parse(Urls.certConfig);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final colorScheme = Theme.of(context).extension<AppColors>()!;

    return Card(
      margin: const EdgeInsets.all(16),
      color: colorScheme.cardWarning,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 12, 8, 12),
            child: Row(
              children: [
                Icon(
                  Icons.warning_amber_rounded,
                  color: colorScheme.cardWarningText,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    loc.unverifiedCertificatesBannerTitle(
                      widget.servers.length,
                    ),
                    style: TextStyle(
                      color: colorScheme.cardWarningText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.help_outline,
                    color: colorScheme.cardWarningText,
                    size: 20,
                  ),
                  onPressed: _openDocumentation,
                  tooltip: loc.unverifiedCertificatesBannerLearnMore,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
                IconButton(
                  icon: Icon(
                    Icons.close,
                    color: colorScheme.cardWarningText,
                    size: 20,
                  ),
                  onPressed: widget.onDismiss,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(
                    minWidth: 36,
                    minHeight: 36,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: InkWell(
              onTap: () => setState(() => _isExpanded = !_isExpanded),
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _isExpanded
                          ? loc.unverifiedCertificatesBannerCollapse
                          : loc.unverifiedCertificatesBannerExpand,
                      style: TextStyle(
                        color: colorScheme.cardWarningText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(
                      _isExpanded
                          ? Icons.keyboard_arrow_up
                          : Icons.keyboard_arrow_down,
                      color: colorScheme.cardWarningText,
                      size: 20,
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (_isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
              child: Column(
                children: widget.servers.map((server) {
                  return InkWell(
                    onTap: () => widget.onServerTap(server),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 10,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.dns_outlined,
                            size: 18,
                            color: colorScheme.cardWarningText,
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              server.alias.isNotEmpty
                                  ? server.alias
                                  : server.address,
                              style: TextStyle(
                                color: colorScheme.cardWarningText,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.chevron_right,
                            size: 20,
                            color: colorScheme.cardWarningText,
                          ),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
          ] else
            const SizedBox(height: 8),
        ],
      ),
    );
  }
}

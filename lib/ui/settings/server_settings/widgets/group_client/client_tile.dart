import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';

class ClientTile extends StatelessWidget {
  const ClientTile({
    required this.client,
    required this.showClientDetails,
    required this.groups,
    required this.ipToMac,
    required this.ipToHostname,
    required this.macToIp,
    this.isClientSelected,
    super.key,
  });

  final ClientItem client;
  final void Function(ClientItem) showClientDetails;
  final Map<int, String> groups;
  final Map<String, String> ipToMac;
  final Map<String, String> ipToHostname;
  final Map<String, String> macToIp;
  final bool? isClientSelected;

  String buildGroupNames() {
    if (client.groups.isEmpty) {
      return '-';
    }
    return client.groups.map((id) => groups[id] ?? id.toString()).join(', ');
  }

  @override
  Widget build(BuildContext context) {
    final ipAddress = _resolveIpAddress();
    final macAddress = _resolveMacAddress(ipAddress);
    final hostname = _resolveHostname(ipAddress);
    final groupsText = buildGroupNames();
    final hasHostname = hostname != '-' && hostname != ipAddress;
    final addressLine = hasHostname ? '$ipAddress ($hostname)' : ipAddress;
    final queryGrey = Theme.of(context).extension<AppColors>()!.queryGrey;

    final Widget content = Row(
      children: [
        Icon(
          Icons.devices_rounded,
          color: Theme.of(context).colorScheme.secondary,
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${AppLocalizations.of(context)!.macAddress}: $macAddress',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, height: 1.4),
              ),
              const SizedBox(height: 6),
              Text(
                addressLine,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '${AppLocalizations.of(context)!.groups}: $groupsText',
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(fontSize: 13, height: 1.4),
              ),
            ],
          ),
        ),
      ],
    );

    if (MediaQuery.of(context).size.width > ResponsiveConstants.large) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Material(
          borderRadius: BorderRadius.circular(28),
          color: Colors.transparent,
          child: InkWell(
            borderRadius: BorderRadius.circular(28),
            onTap: () => showClientDetails(client),
            child: AnimatedContainer(
              curve: Curves.ease,
              duration: const Duration(milliseconds: 200),
              width: double.maxFinite,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28),
                color: isClientSelected == true
                    ? Theme.of(context).colorScheme.primaryContainer
                    : null,
              ),
              child: content,
            ),
          ),
        ),
      );
    } else {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () => showClientDetails(client),
          child: Container(
            width: double.maxFinite,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: content,
          ),
        ),
      );
    }
  }

  String _resolveIpAddress() {
    if (_isMacAddress(client.client)) {
      return macToIp[client.client] ?? client.client;
    }
    if (_isIpAddress(client.client)) {
      return client.client;
    }
    return client.client;
  }

  String _resolveMacAddress(String ipAddress) {
    if (_isMacAddress(client.client)) {
      return client.client;
    }
    return ipToMac[ipAddress] ?? '-';
  }

  String _resolveHostname(String ipAddress) {
    if ((client.name ?? '').isNotEmpty) {
      return client.name!;
    }
    return ipToHostname[ipAddress] ?? '-';
  }

  bool _isIpAddress(String value) {
    return InternetAddress.tryParse(value) != null;
  }

  bool _isMacAddress(String value) {
    final macRegex = RegExp(r'^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$');
    return macRegex.hasMatch(value);
  }
}

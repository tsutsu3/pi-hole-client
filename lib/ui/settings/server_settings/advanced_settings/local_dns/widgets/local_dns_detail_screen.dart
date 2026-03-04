import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/responsive.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns/widgets/edit_local_dns_modal.dart';

class LocalDnsDetailScreen extends StatefulWidget {
  const LocalDnsDetailScreen({
    required this.localDns,
    required this.onDelete,
    required this.onUpdate,
    this.devices,
    super.key,
  });

  final LocalDns localDns;
  final List<DeviceOption>? devices;
  final Future<bool> Function(LocalDns) onDelete;
  final Future<bool> Function(LocalDns updated, String oldIp) onUpdate;

  @override
  State<LocalDnsDetailScreen> createState() => _LocalDnsDetailScreenState();
}

class _LocalDnsDetailScreenState extends State<LocalDnsDetailScreen> {
  late LocalDns _localDns;

  @override
  void initState() {
    super.initState();
    _localDns = widget.localDns.copyWith();
  }

  @override
  void didUpdateWidget(covariant LocalDnsDetailScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.localDns != widget.localDns) {
      setState(() {
        _localDns = widget.localDns.copyWith();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    final currentOption = widget.devices?.firstWhereOrNull(
      (o) => o.ip == _localDns.ip,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(locale.localDns),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: locale.localDnsDelete,
                message: locale.localDnsDeleteMessage,
                onDelete: () async {
                  final ok = await widget.onDelete(_localDns);
                  if (ok && context.mounted) {
                    await Navigator.maybePop(context);
                  }
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
              SectionLabel(label: locale.localDnsInformation),
              ListTile(
                leading: const Icon(Icons.computer_rounded),
                title: Text(locale.hostname),
                subtitle: Text(_localDns.name),
                trailing: Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: openHostNameModal,
              ),
              ListTile(
                leading: const Icon(Icons.location_on_rounded),
                title: Text(locale.ipAddress),
                subtitle: Text(_localDns.ip),
                trailing: Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: openIpModal,
              ),
              SectionLabel(label: locale.additionalInformation),
              ListTile(
                leading: const Icon(Icons.access_time_rounded),
                title: Text(locale.vendor),
                subtitle: Text(
                  (currentOption?.macVendor.isNotEmpty ?? false)
                      ? currentOption!.macVendor
                      : locale.unknown,
                ),
              ),
              ListTile(
                leading: const Icon(Icons.info_rounded),
                title: Text(locale.macAddress),
                subtitle: Text(currentOption?.hwaddr ?? locale.unknown),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onEditLocalDns(LocalDns localDns, String oldIp) async {
    final ok = await widget.onUpdate(localDns, oldIp);
    if (!mounted) return;
    if (ok) {
      setState(() => _localDns = localDns);
    }
  }

  void openHostNameModal() {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);
    final isSmallLandscape =
        mediaQuery.size.width > mediaQuery.size.height &&
        mediaQuery.size.height < ResponsiveConstants.medium;

    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useSafeArea: !isSmallLandscape,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (ctx) => EditLocalDnsModal(
          localDns: _localDns,
          keyItem: 'name',
          title: locale.editHostname,
          icon: Icons.computer_rounded,
          onConfirm: onEditLocalDns,
          window: true,
          devices: widget.devices,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditLocalDnsModal(
          localDns: _localDns,
          keyItem: 'name',
          title: locale.editHostname,
          icon: Icons.computer_rounded,
          onConfirm: onEditLocalDns,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }

  void openIpModal() {
    final locale = AppLocalizations.of(context)!;
    final mediaQuery = MediaQuery.of(context);
    final isSmallLandscape =
        mediaQuery.size.width > mediaQuery.size.height &&
        mediaQuery.size.height < ResponsiveConstants.medium;

    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useSafeArea: !isSmallLandscape,
        useRootNavigator:
            false, // Prevents unexpected app exit on mobile when pressing back
        builder: (ctx) => EditLocalDnsModal(
          localDns: _localDns,
          keyItem: 'ip',
          title: locale.editIp,
          icon: Icons.location_on_rounded,
          onConfirm: onEditLocalDns,
          devices: widget.devices,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditLocalDnsModal(
          localDns: _localDns,
          keyItem: 'ip',
          title: locale.editIp,
          icon: Icons.location_on_rounded,
          onConfirm: onEditLocalDns,
          devices: widget.devices,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}

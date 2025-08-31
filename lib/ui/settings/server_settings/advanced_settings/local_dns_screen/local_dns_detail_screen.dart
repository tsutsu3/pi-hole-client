import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/edit_local_dns_modal.dart';
import 'package:provider/provider.dart';

class LocalDnsDetailScreen extends StatefulWidget {
  const LocalDnsDetailScreen({
    required this.localDns,
    required this.onDelete,
    this.device,
    super.key,
  });

  final LocalDns localDns;
  final DeviceInfo? device;
  final void Function(LocalDns) onDelete;

  @override
  State<LocalDnsDetailScreen> createState() => _LocalDnsDetailScreenState();
}

class _LocalDnsDetailScreenState extends State<LocalDnsDetailScreen> {
  late LocalDns _localDns;
  late ServersProvider serversProvider;
  late ApiGateway? apiGateway;
  late AppConfigProvider appConfigProvider;

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
    appConfigProvider = context.watch<AppConfigProvider>();
    serversProvider = context.watch<ServersProvider>();
    apiGateway = serversProvider.selectedApiGateway;
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Local DNS'), // TODO: i18n
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator:
                  false, // Prevents unexpected app exit on mobile when pressing back
              builder: (context) => DeleteModal(
                title: 'Delete Local DNS', // TODO: i18n
                message:
                    'Do you really want to delete this Local DNS entry?', // TODO: i18n
                onDelete: () {
                  Navigator.maybePop(context);
                  widget.onDelete(widget.localDns);
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
              SectionLabel(label: 'Local DNS Information'), // TODO: i18n
              CustomListTile(
                leadingIcon: Icons.computer_rounded,
                label: locale.hostname,
                description: widget.localDns.name,
                trailing: Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: openHostNameModal,
              ),
              CustomListTile(
                leadingIcon: Icons.location_on_rounded,
                label: locale.ipAddress,
                description: widget.localDns.ip,
                trailing: Icon(
                  Icons.edit_rounded,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
                onTap: openIpModal,
              ),
              SectionLabel(label: 'Additional Information'), // TODO: i18n
              CustomListTile(
                leadingIcon: Icons.access_time_rounded,
                label: locale.vendor,
                description: (widget.device?.macVendor?.isNotEmpty ?? false)
                    ? widget.device!.macVendor
                    : locale.unknown,
              ),
              CustomListTile(
                leadingIcon: Icons.info_rounded,
                label: locale.macAddress,
                description: widget.device?.hwaddr ?? locale.unknown,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> onEditLocalDns(LocalDns localDns) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.updatingAdlist);

    final result = await apiGateway?.updateLocalDns(
      ip: localDns.ip,
      name: localDns.name,
    );

    process.close();

    if (result?.result == APiResponseType.success) {
      setState(() {
        _localDns = localDns;
      });

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: 'Successfully updated local DNS', // TODO: i18n
      );
    } else {
      if (!mounted) return;
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: 'Failed to update local DNS', // TODO: i18n
      );
    }
  }

  void openHostNameModal() {
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
          title: 'Edit Hostname', // TODO: i18n
          icon: Icons.computer_rounded,
          onConfirm: onEditLocalDns,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditLocalDnsModal(
          localDns: _localDns,
          keyItem: 'name',
          title: 'Edit Hostname', // TODO: i18n
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
          title: 'Edit IP Address', // TODO: i18n
          icon: Icons.location_on_rounded,
          onConfirm: onEditLocalDns,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditLocalDnsModal(
          localDns: _localDns,
          keyItem: 'ip',
          title: 'Edit IP Address', // TODO: i18n
          icon: Icons.location_on_rounded,
          onConfirm: onEditLocalDns,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}

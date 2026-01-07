import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/formats.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/data/gateway/api_gateway_interface.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/ui/components/custom_list_tile.dart';
import 'package:pi_hole_client/ui/core/ui/components/section_label.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/delete_modal.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/edit_client_modal.dart';
import 'package:pi_hole_client/utils/format.dart';
import 'package:provider/provider.dart';

class ClientDetailsScreen extends StatefulWidget {
  const ClientDetailsScreen({
    required this.client,
    required this.remove,
    required this.groups,
    this.ipToMac = const {},
    this.ipToHostname = const {},
    this.macToIp = const {},
    this.colors,
    super.key,
  });

  final ClientItem client;
  final void Function(ClientItem) remove;
  final Map<int, String> groups;
  final Map<String, String> ipToMac;
  final Map<String, String> ipToHostname;
  final Map<String, String> macToIp;
  final AppColors? colors;

  @override
  State<ClientDetailsScreen> createState() => _ClientDetailsScreenState();
}

class _ClientDetailsScreenState extends State<ClientDetailsScreen> {
  late ClientItem _client;
  late ServersProvider serversProvider;
  late ApiGateway? apiGateway;
  late ClientsListProvider clientsListProvider;
  late AppConfigProvider appConfigProvider;

  @override
  void initState() {
    super.initState();
    _client = widget.client.copyWith();
  }

  @override
  void didUpdateWidget(covariant ClientDetailsScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.client != widget.client) {
      setState(() {
        _client = widget.client.copyWith();
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    appConfigProvider = context.watch<AppConfigProvider>();
    serversProvider = context.watch<ServersProvider>();
    clientsListProvider = context.watch<ClientsListProvider>();
    apiGateway = serversProvider.selectedApiGateway;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.clientDetails),
        actions: [
          IconButton(
            onPressed: () => showDialog(
              context: context,
              useRootNavigator: false,
              builder: (context) => DeleteModal(
                title: AppLocalizations.of(context)!.clientDelete,
                message: AppLocalizations.of(context)!.clientDeleteMessage,
                onDelete: () {
                  Navigator.maybePop(context);
                  removeClient(_client);
                },
              ),
            ),
            icon: const Icon(Icons.delete_rounded),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            SectionLabel(label: AppLocalizations.of(context)!.clientSettings),
            CustomListTile(
              leadingIcon: Icons.devices_rounded,
              label: AppLocalizations.of(context)!.macAddress,
              description: getMacAddress() ?? '-',
            ),
            CustomListTile(
              leadingIcon: Icons.location_on_rounded,
              label: AppLocalizations.of(context)!.ipAddress,
              description: getIpAddress() ?? '-',
            ),
            CustomListTile(
              leadingIcon: Icons.computer_rounded,
              label: AppLocalizations.of(context)!.hostname,
              description: getHostname(),
            ),
            CustomListTile(
              leadingIcon: Icons.group_rounded,
              label: AppLocalizations.of(context)!.groups,
              description: getGroupNames().join(', '),
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openGroupsModal,
            ),
            CustomListTile(
              leadingIcon: Icons.comment_rounded,
              label: AppLocalizations.of(context)!.comment,
              description: _client.comment == null || _client.comment!.isEmpty
                  ? AppLocalizations.of(context)!.noComment
                  : _client.comment!,
              trailing: Icon(
                Icons.edit_rounded,
                color: Theme.of(context).colorScheme.onSurfaceVariant,
              ),
              onTap: openCommentModal,
            ),
            SectionLabel(label: AppLocalizations.of(context)!.clientInfo),
            CustomListTile(
              leadingIcon: Icons.label_outline_rounded,
              label: AppLocalizations.of(context)!.id,
              description: _client.id.toString(),
            ),
            CustomListTile(
              leadingIcon: Icons.event_available_rounded,
              label: AppLocalizations.of(context)!.dateAdded,
              description: formatTimestamp(
                _client.dateAdded,
                kUnifiedDateTimeFormat,
              ),
            ),
            CustomListTile(
              leadingIcon: Icons.edit_calendar_rounded,
              label: AppLocalizations.of(context)!.dateModified,
              description: formatTimestamp(
                _client.dateModified,
                kUnifiedDateTimeFormat,
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> getGroupNames() {
    if (_client.groups.isEmpty) {
      return ['-'];
    }
    final names = _client.groups
        .map((id) => widget.groups[id])
        .where((name) => name != null && name.isNotEmpty)
        .cast<String>()
        .toList();
    return names.isEmpty ? ['-'] : names;
  }

  String? getIpAddress() {
    if (_isIpAddress(_client.client)) {
      return _client.client;
    }
    if (_isMacAddress(_client.client)) {
      return widget.macToIp[_client.client];
    }
    for (final entry in widget.ipToHostname.entries) {
      if (entry.value == _client.client) {
        return entry.key;
      }
    }
    return null;
  }

  String? getMacAddress() {
    if (_isMacAddress(_client.client)) {
      return _client.client;
    }
    if (_isIpAddress(_client.client)) {
      return widget.ipToMac[_client.client];
    }
    for (final entry in widget.ipToHostname.entries) {
      if (entry.value == _client.client) {
        return widget.ipToMac[entry.key];
      }
    }
    return null;
  }

  String getHostname() {
    if ((_client.name ?? '').isNotEmpty) {
      return _client.name!;
    }
    if (_isIpAddress(_client.client)) {
      return widget.ipToHostname[_client.client] ?? '-';
    }
    if (_isMacAddress(_client.client)) {
      final ip = widget.macToIp[_client.client];
      if (ip != null) {
        return widget.ipToHostname[ip] ?? '-';
      }
    }
    return _client.client;
  }

  bool _isIpAddress(String value) {
    return InternetAddress.tryParse(value) != null;
  }

  bool _isMacAddress(String value) {
    final macRegex = RegExp(r'^([0-9A-Fa-f]{2}:){5}[0-9A-Fa-f]{2}$');
    return macRegex.hasMatch(value);
  }

  Future<void> removeClient(ClientItem client) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.deleting);

    final result = await apiGateway?.removeClient(client: client.client);

    process.close();

    if (!mounted) return;

    if (result?.result == APiResponseType.success) {
      clientsListProvider.removeClientFromList(client);
      widget.remove(client);
      if (!mounted) return;
      if (MediaQuery.of(context).size.width <= ResponsiveConstants.large) {
        await Navigator.maybePop(context);
      }

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.clientRemoved,
      );
    } else if (result?.result == APiResponseType.notFound) {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.clientNotExists,
      );
    } else {
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.clientRemoveFailed,
      );
    }
  }

  Future<void> onEditClient(ClientRequest value) async {
    final process = ProcessModal(context: context);
    process.open(AppLocalizations.of(context)!.clientUpdating);

    final result = await apiGateway?.updateClient(
      client: _client.client,
      body: value,
    );

    process.close();

    if (result?.result == APiResponseType.success) {
      await clientsListProvider.fetchClients();

      final updatedClient = result?.data?.clients.firstWhere(
        (c) => c.client == _client.client,
        orElse: () =>
            _client.copyWith(comment: value.comment, groups: value.groups),
      );

      setState(() {
        _client = updatedClient ?? _client;
      });

      if (!mounted) return;
      showSuccessSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.clientUpdated,
      );
    } else {
      if (!mounted) return;
      showErrorSnackBar(
        context: context,
        appConfigProvider: appConfigProvider,
        label: AppLocalizations.of(context)!.clientUpdateFailed,
      );
    }
  }

  void openCommentModal() {
    final isLarge =
        MediaQuery.of(context).size.width > ResponsiveConstants.medium;
    if (isLarge) {
      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (ctx) => EditClientModal(
          client: _client,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditClient,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditClientModal(
          client: _client,
          keyItem: 'comment',
          title: AppLocalizations.of(context)!.editComment,
          icon: Icons.comment_rounded,
          onConfirm: onEditClient,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }

  void openGroupsModal() {
    if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
      showDialog(
        context: context,
        useRootNavigator: false,
        builder: (ctx) => EditClientModal(
          client: _client,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditClient,
          groups: widget.groups,
          window: true,
        ),
      );
    } else {
      showModalBottomSheet(
        context: context,
        builder: (ctx) => EditClientModal(
          client: _client,
          keyItem: 'groups',
          title: AppLocalizations.of(context)!.editGroups,
          icon: Icons.group_rounded,
          onConfirm: onEditClient,
          groups: widget.groups,
          window: false,
        ),
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
      );
    }
  }
}

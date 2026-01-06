import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pi_hole_client/config/responsive.dart';
import 'package:pi_hole_client/domain/models_old/clients.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/l10n/generated/app_localizations.dart';
import 'package:pi_hole_client/ui/core/ui/components/tab_content_list.dart';
import 'package:pi_hole_client/ui/core/ui/helpers/snackbar.dart';
import 'package:pi_hole_client/ui/core/ui/modals/process_modal.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/clients_list_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/local_dns_provider.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/add_client_modal.dart';
import 'package:pi_hole_client/ui/settings/server_settings/widgets/group_client/client_tile.dart';
import 'package:provider/provider.dart';

class ClientsList extends StatefulWidget {
  const ClientsList({
    required this.scrollController,
    required this.onClientSelected,
    required this.selectedClient,
    required this.groups,
    super.key,
  });

  final ScrollController scrollController;
  final void Function(ClientItem) onClientSelected;
  final ClientItem? selectedClient;
  final Map<int, String> groups;

  @override
  State<ClientsList> createState() => _ClientsListState();
}

class _ClientsListState extends State<ClientsList> {
  late bool isVisible;

  @override
  void initState() {
    super.initState();
    isVisible = true;
    widget.scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      if (mounted && isVisible == true) {
        setState(() => isVisible = false);
      }
    } else if (widget.scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      if (mounted && isVisible == false) {
        setState(() => isVisible = true);
      }
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final serversProvider = Provider.of<ServersProvider>(context);
    final clientsListProvider = Provider.of<ClientsListProvider>(context);
    final localDnsProvider = Provider.of<LocalDnsProvider>(context);
    final appConfigProvider = Provider.of<AppConfigProvider>(context);
    final apiGateway = serversProvider.selectedApiGateway;

    final clients = clientsListProvider.filteredClients;
    final ipToMac = localDnsProvider.ipToMac;
    final ipToHostname = localDnsProvider.ipToHostname;
    final macToIp = localDnsProvider.macToIp;

    Future<void> onAddClient(ClientRequest request) async {
      final process = ProcessModal(context: context);
      process.open(AppLocalizations.of(context)!.clientAdding);

      final result = await apiGateway?.createClient(body: request);

      process.close();

      if (!context.mounted) return;

      if (result?.result == APiResponseType.success) {
        await clientsListProvider.fetchClients();
        if (!context.mounted) return;
        showSuccessSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.clientAdded,
        );
      } else if (result?.result == APiResponseType.alreadyAdded) {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.clientAlreadyAdded,
        );
      } else {
        showErrorSnackBar(
          context: context,
          appConfigProvider: appConfigProvider,
          label: AppLocalizations.of(context)!.clientAddFailed,
        );
      }
    }

    Future<void> openModalAddClient() async {
      final mediaQuery = MediaQuery.of(context);
      final isSmallLandscape =
          mediaQuery.size.width > mediaQuery.size.height &&
          mediaQuery.size.height < ResponsiveConstants.medium;

      if (localDnsProvider.deviceOptions.isEmpty) {
        await localDnsProvider.load();
      }
      if (!context.mounted) return;

      if (MediaQuery.of(context).size.width > ResponsiveConstants.medium) {
        await showDialog(
          context: context,
          useSafeArea: !isSmallLandscape,
          useRootNavigator: false,
          builder: (ctx) => AddClientModal(
            onConfirm: onAddClient,
            window: true,
            groups: widget.groups,
            devices: localDnsProvider.deviceOptions,
            ipToHostname: ipToHostname,
          ),
        );
      } else {
        await showModalBottomSheet(
          context: context,
          builder: (ctx) => AddClientModal(
            onConfirm: onAddClient,
            window: false,
            groups: widget.groups,
            devices: localDnsProvider.deviceOptions,
            ipToHostname: ipToHostname,
          ),
          backgroundColor: Colors.transparent,
          isScrollControlled: true,
        );
      }
    }

    return Stack(
      children: [
        CustomTabContentList(
          loadingGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.loadingList,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          itemsCount: clients.length,
          contentWidget: (index) {
            final thisClient = clients[index];
            return Padding(
              padding:
                  index == 0 &&
                      MediaQuery.of(context).size.width >
                          ResponsiveConstants.large
                  ? const EdgeInsets.only(top: 16)
                  : EdgeInsets.zero,
              child: ClientTile(
                client: thisClient,
                groups: widget.groups,
                ipToMac: ipToMac,
                ipToHostname: ipToHostname,
                macToIp: macToIp,
                isClientSelected: widget.selectedClient == thisClient,
                showClientDetails: (client) => widget.onClientSelected(client),
              ),
            );
          },
          noData: Container(
            height: double.maxFinite,
            padding: const EdgeInsets.all(20),
            child: Center(
              child: Text(
                AppLocalizations.of(context)!.clientsNone,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Theme.of(context).colorScheme.onSurfaceVariant,
                ),
              ),
            ),
          ),
          errorGenerator: () => SizedBox(
            width: double.maxFinite,
            height: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.error, size: 50, color: Colors.red),
                const SizedBox(height: 50),
                Text(
                  AppLocalizations.of(context)!.clientsNotLoaded,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurfaceVariant,
                    fontSize: 22,
                  ),
                ),
              ],
            ),
          ),
          loadStatus: clientsListProvider.loadingStatus,
          onRefresh: () async => clientsListProvider.fetchClients(),
          bottomSpaceHeight: 80,
        ),
        SafeArea(
          child: Stack(
            children: [
              AnimatedPositioned(
                duration: const Duration(milliseconds: 100),
                curve: Curves.easeInOut,
                bottom: isVisible
                    ? appConfigProvider.showingSnackbar
                          ? 70
                          : 20
                    : -70,
                right: 20,
                child: FloatingActionButton(
                  onPressed: openModalAddClient,
                  child: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

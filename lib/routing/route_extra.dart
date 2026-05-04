/// Typed parameter objects for go_router `extra` payloads.
///
/// Using named fields instead of positional tuples makes route builders and
/// call sites self-documenting and less error-prone.
library;

import 'package:pi_hole_client/domain/model/auth/auth.dart';
import 'package:pi_hole_client/domain/model/client/managed_client.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/group/group.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/metrics/queries.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/domains/view_models/domains_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/adlists/view_models/adlists_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/clients_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/group_client/view_models/groups_viewmodel.dart';

/// Extra for `Routes.domainsDetails`.
class DomainDetailsExtra {
  const DomainDetailsExtra({
    required this.domain,
    required this.remove,
    required this.groups,
    required this.viewModel,
    this.colors,
  });

  final Domain domain;
  final void Function(Domain) remove;
  final Map<int, String> groups;
  final DomainsViewModel viewModel;
  final AppColors? colors;
}

/// Extra for `Routes.settingsServerAdlistsDetails`.
class AdlistDetailsExtra {
  const AdlistDetailsExtra({
    required this.adlist,
    required this.remove,
    required this.groups,
    required this.viewModel,
    this.colors,
  });

  final Adlist adlist;
  final void Function(Adlist) remove;
  final Map<int, String> groups;
  final AdlistsViewModel viewModel;
  final AppColors? colors;
}

/// Extra for `Routes.settingsServerGroupDetails`.
class GroupDetailsExtra {
  const GroupDetailsExtra({
    required this.group,
    required this.remove,
    required this.groupsViewModel,
    required this.clientsViewModel,
    required this.domainsViewModel,
    required this.adlistsViewModel,
  });

  final Group group;
  final void Function(Group) remove;
  final GroupsViewModel groupsViewModel;
  final ClientsViewModel clientsViewModel;
  final DomainsViewModel domainsViewModel;
  final AdlistsViewModel adlistsViewModel;
}

/// Extra for `Routes.settingsServerClientDetails`.
class ClientDetailsExtra {
  const ClientDetailsExtra({
    required this.client,
    required this.remove,
    required this.groups,
    required this.ipToMac,
    required this.ipToHostname,
    required this.macToIp,
    required this.viewModel,
    this.colors,
  });

  final ManagedClient client;
  final void Function(ManagedClient) remove;
  final Map<int, String> groups;
  final Map<String, String> ipToMac;
  final Map<String, String> ipToHostname;
  final Map<String, String> macToIp;
  final ClientsViewModel viewModel;
  final AppColors? colors;
}

/// Extra for `Routes.settingsServerAdvancedLocalDnsDetails`.
class LocalDnsDetailsExtra {
  const LocalDnsDetailsExtra({
    required this.localDns,
    required this.onDelete,
    required this.onUpdate,
    this.devices,
  });

  final LocalDns localDns;
  final Future<bool> Function(LocalDns) onDelete;
  final Future<bool> Function(LocalDns, String) onUpdate;
  final List<DeviceOption>? devices;
}

/// Extra for `Routes.settingsServerAdvancedFindDomainsInListsDomainDetails`.
class FindDomainDetailsExtra {
  const FindDomainDetailsExtra({
    required this.domain,
    required this.groups,
    required this.colors,
    required this.remove,
    this.onUpdated,
  });

  final Domain domain;
  final Map<int, String> groups;
  final AppColors colors;
  final void Function(Domain) remove;
  final void Function(Domain)? onUpdated;
}

/// Extra for `Routes.settingsServerAdvancedFindDomainsInListsAdlistDetails`.
class FindAdlistDetailsExtra {
  const FindAdlistDetailsExtra({
    required this.adlist,
    required this.groups,
    required this.colors,
    required this.remove,
    this.onUpdated,
  });

  final Adlist adlist;
  final Map<int, String> groups;
  final AppColors colors;
  final void Function(Adlist) remove;
  final void Function(Adlist)? onUpdated;
}

/// Extra for `Routes.logsDetails`.
class LogDetailsExtra {
  const LogDetailsExtra({required this.log, required this.whiteBlackList});

  final Log log;
  final void Function(String, Log) whiteBlackList;
}

/// Extra for `Routes.settingsServerAdvancedSessionsDetails`.
class SessionDetailsExtra {
  const SessionDetailsExtra({required this.session, required this.onDelete});

  final AuthSession session;
  final void Function(AuthSession) onDelete;
}

/// Extra for `Routes.settingsServerAdvancedDhcpDetails`.
class DhcpDetailsExtra {
  const DhcpDetailsExtra({required this.lease, required this.onDelete});

  final DhcpLease lease;
  final void Function(DhcpLease) onDelete;
}

/// Extra for `Routes.settingsServerAdvancedInterfaceAddress`.
class InterfaceAddressExtra {
  const InterfaceAddressExtra({required this.address, required this.title});

  final InterfaceAddress address;
  final String title;
}

/// Extra for `Routes.settingsServerAdvancedNetworkDetails`.
class NetworkDetailsExtra {
  const NetworkDetailsExtra({required this.device, required this.onDelete});

  final Device device;
  final void Function(Device) onDelete;
}

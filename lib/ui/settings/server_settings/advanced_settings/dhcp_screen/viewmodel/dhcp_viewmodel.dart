import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';

class DhcpData {
  const DhcpData({required this.leases, required this.currentClientIp});

  final List<DhcpLease> leases;
  final String currentClientIp;
}

class DhcpViewModel extends ChangeNotifier {
  DhcpViewModel({
    required DhcpRepository dhcpRepository,
    required FtlRepository ftlRepository,
  }) : _dhcpRepository = dhcpRepository,
       _ftlRepository = ftlRepository {
    loadLeases = Command.createAsyncNoParam<DhcpData>(
      _loadLeases,
      initialValue: const DhcpData(leases: [], currentClientIp: ''),
    );
    deleteLease = Command.createAsyncNoResult<String>(_deleteLease);

    loadLeases.addListener(notifyListeners);
    deleteLease.addListener(notifyListeners);
  }

  final DhcpRepository _dhcpRepository;
  final FtlRepository _ftlRepository;

  late final Command<void, DhcpData> loadLeases;
  late final Command<String, void> deleteLease;

  Future<DhcpData> _loadLeases() async {
    final (leasesResult, clientResult) = await (
      _dhcpRepository.fetchDhcpLeases(),
      _ftlRepository.fetchInfoClient(),
    ).wait;
    final leases = leasesResult.getOrThrow();
    final client = clientResult.getOrThrow();
    return DhcpData(leases: leases, currentClientIp: client.addr);
  }

  Future<void> _deleteLease(String ip) async {
    final result = await _dhcpRepository.deleteDhcpLeaseByIp(ip);
    result.getOrThrow();
    await loadLeases.runAsync();
  }

  @override
  void dispose() {
    loadLeases.removeListener(notifyListeners);
    deleteLease.removeListener(notifyListeners);
    loadLeases.dispose();
    deleteLease.dispose();
    super.dispose();
  }
}

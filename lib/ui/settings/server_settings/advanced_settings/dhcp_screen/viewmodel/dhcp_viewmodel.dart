import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/dhcp_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/domain/model/dhcp/dhcp.dart';
import 'package:pi_hole_client/domain/model/ftl/client.dart';
import 'package:result_dart/result_dart.dart';

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
    final results = await Future.wait([
      _dhcpRepository.fetchDhcpLeases(),
      _ftlRepository.fetchInfoClient(),
    ]);
    final leases = (results[0] as Result<List<DhcpLease>>).getOrThrow();
    final client = (results[1] as Result<FtlClient>).getOrThrow();
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

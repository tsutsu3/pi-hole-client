import 'dart:io';

import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';

class LocalDnsData {
  const LocalDnsData({required this.records, required this.deviceOptions});

  final List<LocalDns> records;
  final List<DeviceOption> deviceOptions;
}

class LocalDnsViewModel extends ChangeNotifier {
  LocalDnsViewModel({
    required LocalDnsRepository localDnsRepository,
    required NetworkRepository networkRepository,
  }) : _localDnsRepository = localDnsRepository,
       _networkRepository = networkRepository {
    loadRecords = Command.createAsyncNoParam<LocalDnsData>(
      _loadRecords,
      initialValue: const LocalDnsData(records: [], deviceOptions: []),
    );
    addRecord = Command.createAsyncNoResult<LocalDns>(_addRecord);
    updateRecord =
        Command.createAsyncNoResult<({LocalDns record, String oldIp})>(
          _updateRecord,
        );
    deleteRecord = Command.createAsyncNoResult<LocalDns>(_deleteRecord);

    loadRecords.addListener(notifyListeners);
    addRecord.addListener(notifyListeners);
    updateRecord.addListener(notifyListeners);
    deleteRecord.addListener(notifyListeners);
  }

  final LocalDnsRepository _localDnsRepository;
  final NetworkRepository _networkRepository;

  late final Command<void, LocalDnsData> loadRecords;
  late final Command<LocalDns, void> addRecord;
  late final Command<({LocalDns record, String oldIp}), void> updateRecord;
  late final Command<LocalDns, void> deleteRecord;

  Future<LocalDnsData> _loadRecords() async {
    final (dnsResult, devicesResult) = await (
      _localDnsRepository.fetchRecords(),
      _networkRepository.fetchDevices(),
    ).wait;
    return LocalDnsData(
      records: dnsResult.getOrThrow(),
      deviceOptions: _devicesToOptions(devicesResult.getOrThrow()),
    );
  }

  Future<void> _addRecord(LocalDns record) async {
    final result = await _localDnsRepository.addRecord(
      ip: record.ip,
      name: record.name,
    );
    result.getOrThrow();
    await loadRecords.runAsync();
  }

  Future<void> _updateRecord(({LocalDns record, String oldIp}) params) async {
    final result = await _localDnsRepository.updateRecord(
      record: params.record,
      oldIp: params.oldIp,
    );
    result.getOrThrow();
    await loadRecords.runAsync();
  }

  Future<void> _deleteRecord(LocalDns record) async {
    final result = await _localDnsRepository.deleteRecord(
      ip: record.ip,
      name: record.name,
    );
    result.getOrThrow();
    await loadRecords.runAsync();
  }

  List<DeviceOption> _devicesToOptions(List<Device> devices) {
    // Exclude devices with lastQuery as 0 (unused)
    final list = devices
        .where((device) => device.lastQuery.millisecondsSinceEpoch != 0)
        .expand((device) {
          return device.ips
              .where(
                (addr) =>
                    addr.ip != '127.0.0.1' &&
                    addr.ip != '::' &&
                    addr.ip != '::1',
              )
              .map(
                (addr) => DeviceOption(
                  ip: addr.ip,
                  hwaddr: device.hwaddr,
                  macVendor: device.macVendor ?? '',
                ),
              );
        })
        .toList();

    list.sort((a, b) {
      final ipA = InternetAddress.tryParse(a.ip);
      final ipB = InternetAddress.tryParse(b.ip);

      if (ipA == null || ipB == null) return a.ip.compareTo(b.ip);
      if (ipA.type != ipB.type) {
        return ipA.type == InternetAddressType.IPv4 ? -1 : 1;
      }

      final bytesA = ipA.rawAddress;
      final bytesB = ipB.rawAddress;
      for (var i = 0; i < bytesA.length; i++) {
        final diff = bytesA[i].compareTo(bytesB[i]);
        if (diff != 0) return diff;
      }
      return 0;
    });

    return list;
  }

  @override
  void dispose() {
    loadRecords.removeListener(notifyListeners);
    addRecord.removeListener(notifyListeners);
    updateRecord.removeListener(notifyListeners);
    deleteRecord.removeListener(notifyListeners);
    loadRecords.dispose();
    addRecord.dispose();
    updateRecord.dispose();
    deleteRecord.dispose();
    super.dispose();
  }
}

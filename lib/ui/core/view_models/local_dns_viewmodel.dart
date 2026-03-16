import 'dart:io';

import 'package:command_it/command_it.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/utils/logger.dart';

class LocalDnsViewModel with ChangeNotifier {
  LocalDnsViewModel({
    required LocalDnsRepository localDnsRepository,
    required NetworkRepository networkRepository,
  }) : _localDnsRepository = localDnsRepository,
       _networkRepository = networkRepository {
    load = Command.createAsyncNoParam<void>(_load, initialValue: null);
    addLocalDns = Command.createAsyncNoResult<LocalDns>(_addLocalDns);
    updateLocalDns =
        Command.createAsyncNoResult<({String oldIp, LocalDns item})>(
          _updateLocalDns,
        );
    removeLocalDns = Command.createAsyncNoResult<LocalDns>(_removeLocalDns);

    load.addListener(notifyListeners);
    load.errors.addListener(notifyListeners);
    addLocalDns.addListener(notifyListeners);
    addLocalDns.errors.addListener(notifyListeners);
    updateLocalDns.addListener(notifyListeners);
    updateLocalDns.errors.addListener(notifyListeners);
    removeLocalDns.addListener(notifyListeners);
    removeLocalDns.errors.addListener(notifyListeners);
  }

  final LocalDnsRepository _localDnsRepository;
  final NetworkRepository _networkRepository;

  final List<LocalDns> _localDns = [];
  final List<DeviceOption> _deviceOptions = [];
  Map<String, String> _ipToHostname = {};
  Map<String, String> _ipToMac = {};
  Map<String, String> _macToIp = {};
  LoadStatus _loadingStatus = LoadStatus.loading;

  // --- Commands ---
  late final Command<void, void> load;
  late final Command<LocalDns, void> addLocalDns;
  late final Command<({String oldIp, LocalDns item}), void> updateLocalDns;
  late final Command<LocalDns, void> removeLocalDns;

  // --- Getters ---
  List<LocalDns> get localDns => List.unmodifiable(_localDns);
  List<DeviceOption> get deviceOptions => List.unmodifiable(_deviceOptions);
  Map<String, String> get ipToHostname => Map.unmodifiable(_ipToHostname);
  Map<String, String> get ipToMac => Map.unmodifiable(_ipToMac);
  Map<String, String> get macToIp => Map.unmodifiable(_macToIp);

  LoadStatus get loadingStatus => _loadingStatus;

  void setLoadingStatus(LoadStatus status) {
    _loadingStatus = status;
    notifyListeners();
  }

  // --- Command implementations ---

  Future<void> _load() async {
    _loadingStatus = LoadStatus.loading;
    notifyListeners();

    try {
      final results = await Future.wait([
        _localDnsRepository.fetchRecords(),
        _networkRepository.fetchDevices(),
      ]);

      final dnsResult = results[0];
      final devicesResult = results[1];

      if (dnsResult.isSuccess() && devicesResult.isSuccess()) {
        _localDns
          ..clear()
          ..addAll(dnsResult.getOrNull()! as List<LocalDns>);
        final devices = devicesResult.getOrNull()! as List<Device>;
        _deviceOptions
          ..clear()
          ..addAll(devicesToOptions(devices));
        _buildDeviceMaps(devices);
        _loadingStatus = LoadStatus.loaded;
      } else {
        logger.e(
          'Failed to load LocalDns data. '
          'fetchRecords: ${dnsResult.isSuccess() ? 'ok' : dnsResult.exceptionOrNull()}, '
          'fetchDevices: ${devicesResult.isSuccess() ? 'ok' : devicesResult.exceptionOrNull()}',
        );
        _loadingStatus = LoadStatus.error;
      }
    } catch (e) {
      logger.e('Failed to load LocalDns data', error: e);
      _loadingStatus = LoadStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<void> _addLocalDns(LocalDns item) async {
    _localDns.add(item);

    final result = await _localDnsRepository.addRecord(
      ip: item.ip,
      name: item.name,
    );
    if (result.isError()) {
      _localDns.removeWhere((e) => e.ip == item.ip && e.name == item.name);
      notifyListeners();
      throw result.exceptionOrNull()!;
    }

    notifyListeners();
  }

  Future<void> _updateLocalDns(({String oldIp, LocalDns item}) params) async {
    final idx = _localDns.indexWhere((e) => e.ip == params.oldIp);
    if (idx == -1) return;

    final before = _localDns[idx];
    _localDns[idx] = params.item;

    final result = await _localDnsRepository.updateRecord(
      record: params.item,
      oldIp: params.oldIp,
    );
    if (result.isError()) {
      _localDns[idx] = before;
      notifyListeners();
      throw result.exceptionOrNull()!;
    }

    notifyListeners();
  }

  Future<void> _removeLocalDns(LocalDns item) async {
    final idx = _localDns.indexWhere((e) => e.ip == item.ip);
    if (idx == -1) return;

    final removed = _localDns.removeAt(idx);

    final result = await _localDnsRepository.deleteRecord(
      ip: item.ip,
      name: item.name,
    );
    if (result.isError()) {
      _localDns.insert(idx, removed);
      notifyListeners();
      throw result.exceptionOrNull()!;
    }

    notifyListeners();
  }

  List<DeviceOption> devicesToOptions(List<Device> devices) {
    final list = devices
        .where((device) {
          // Exclude devices with lastQuery as 0 (unused)
          return device.lastQuery.millisecondsSinceEpoch != 0;
        })
        .expand((device) {
          return device.ips
              .where((addr) {
                // Exclude loopback addresses
                if (addr.ip == '127.0.0.1' ||
                    addr.ip == '::' ||
                    addr.ip == '::1') {
                  return false;
                }
                return true;
              })
              .map((addr) {
                return DeviceOption(
                  ip: addr.ip,
                  hwaddr: device.hwaddr,
                  macVendor: device.macVendor ?? '',
                );
              })
              .toList();
        })
        .toList();

    list.sort((a, b) {
      final ipA = InternetAddress.tryParse(a.ip);
      final ipB = InternetAddress.tryParse(b.ip);

      if (ipA == null || ipB == null) {
        return a.ip.compareTo(b.ip);
      }

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

  void _buildDeviceMaps(List<Device> devices) {
    final ipToHostname = <String, String>{};
    final ipToMac = <String, String>{};
    final macToIp = <String, String>{};

    for (final device in devices) {
      for (final addr in device.ips) {
        ipToMac[addr.ip] = device.hwaddr;
        if ((addr.name ?? '').isNotEmpty) {
          ipToHostname[addr.ip] = addr.name!;
        }
        macToIp.putIfAbsent(device.hwaddr, () => addr.ip);
      }
    }

    _ipToHostname = ipToHostname;
    _ipToMac = ipToMac;
    _macToIp = macToIp;
  }

  @override
  void dispose() {
    load.removeListener(notifyListeners);
    load.errors.removeListener(notifyListeners);
    addLocalDns.removeListener(notifyListeners);
    addLocalDns.errors.removeListener(notifyListeners);
    updateLocalDns.removeListener(notifyListeners);
    updateLocalDns.errors.removeListener(notifyListeners);
    removeLocalDns.removeListener(notifyListeners);
    removeLocalDns.errors.removeListener(notifyListeners);
    load.dispose();
    addLocalDns.dispose();
    updateLocalDns.dispose();
    removeLocalDns.dispose();
    super.dispose();
  }
}

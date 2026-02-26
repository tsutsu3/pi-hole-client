import 'dart:io';

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
       _networkRepository = networkRepository;

  final LocalDnsRepository _localDnsRepository;
  final NetworkRepository _networkRepository;

  final List<LocalDns> _localDns = [];

  final List<DeviceOption> _deviceOptions = [];
  Map<String, String> _ipToHostname = {};
  Map<String, String> _ipToMac = {};
  Map<String, String> _macToIp = {};

  LoadStatus _loadingStatus = LoadStatus.loading;

  List<LocalDns> get localDns => List.unmodifiable(_localDns);

  List<DeviceOption> get deviceOptions => List.unmodifiable(_deviceOptions);
  Map<String, String> get ipToHostname => Map.unmodifiable(_ipToHostname);
  Map<String, String> get ipToMac => Map.unmodifiable(_ipToMac);
  Map<String, String> get macToIp => Map.unmodifiable(_macToIp);

  LoadStatus get loadingStatus {
    return _loadingStatus;
  }

  void setLoadingStatus(LoadStatus status) {
    _loadingStatus = status;
    notifyListeners();
  }

  Future<void> load() async {
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
          ..addAll(dnsResult.getOrThrow() as List<LocalDns>);
        final devices = devicesResult.getOrThrow() as List<Device>;
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

  Future<bool> addLocalDns(LocalDns item) async {
    _localDns.add(item);

    final result = await _localDnsRepository.addRecord(
      ip: item.ip,
      name: item.name,
    );
    if (result.isError()) {
      _localDns.removeWhere((e) => e.ip == item.ip && e.name == item.name);
      notifyListeners();
      return false;
    }

    notifyListeners();
    return true;
  }

  Future<bool> updateLocalDns({
    required String oldIp,
    required LocalDns item,
  }) async {
    final idx = _localDns.indexWhere((e) => e.ip == oldIp);
    if (idx == -1) return false;

    final before = _localDns[idx];
    _localDns[idx] = item;

    final result = await _localDnsRepository.updateRecord(
      record: item,
      oldIp: oldIp,
    );
    if (result.isError()) {
      _localDns[idx] = before;
      notifyListeners();
      return false;
    }

    notifyListeners();
    return true;
  }

  Future<bool> removeLocalDns(LocalDns item) async {
    final idx = _localDns.indexWhere((e) => e.ip == item.ip);
    if (idx == -1) return false;

    final removed = _localDns.removeAt(idx);

    final result = await _localDnsRepository.deleteRecord(
      ip: item.ip,
      name: item.name,
    );
    if (result.isError()) {
      _localDns.insert(idx, removed);
      notifyListeners();
      return false;
    }

    notifyListeners();
    return true;
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
}

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/domain/models_old/devices.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

class LocalDnsProvider with ChangeNotifier {
  LocalDnsProvider({required this.serversProvider});

  ServersProvider? serversProvider;

  List<LocalDns> _localDns = [];

  List<DeviceOption> _deviceOptions = [];
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

  void update(ServersProvider? provider) {
    serversProvider = provider;
    _localDns = [];
    _deviceOptions = [];
    _ipToHostname = {};
    _ipToMac = {};
    _macToIp = {};
    _loadingStatus = LoadStatus.loading;
  }

  void setLoadingStatus(LoadStatus status) {
    _loadingStatus = status;
    notifyListeners();
  }

  Future<void> load() async {
    final apiGateway = serversProvider?.selectedApiGateway;

    if (apiGateway == null) {
      _localDns = [];
      _deviceOptions = [];
      _loadingStatus = LoadStatus.error;
      notifyListeners();
      return;
    }

    _loadingStatus = LoadStatus.loading;
    notifyListeners();

    try {
      final result = await Future.wait<BaseInfoResponse<dynamic>>([
        apiGateway.getLocalDns(),
        apiGateway.getDevices(),
      ]);

      if (result[0].result == APiResponseType.success &&
          result[1].result == APiResponseType.success) {
        _localDns
          ..clear()
          ..addAll(result[0].data as List<LocalDns>);
        final devicesInfo = result[1].data as DevicesInfo;
        _deviceOptions
          ..clear()
          ..addAll(devicesInfoToOptions(devicesInfo.devices));
        _buildDeviceMaps(devicesInfo.devices);
        _loadingStatus = LoadStatus.loaded;
      } else {
        _loadingStatus = LoadStatus.error;
      }
    } catch (e) {
      _loadingStatus = LoadStatus.error;
    } finally {
      notifyListeners();
    }
  }

  Future<bool> addLocalDns(LocalDns item) async {
    _localDns.add(item);

    final apiGateway = serversProvider?.selectedApiGateway;

    if (apiGateway == null) {
      _localDns = [];
      _deviceOptions = [];
      _loadingStatus = LoadStatus.error;
      notifyListeners();
      return false;
    }

    final resp = await apiGateway.addLocalDns(ip: item.ip, name: item.name);
    if (resp.result != APiResponseType.success) {
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

    final apiGateway = serversProvider?.selectedApiGateway;

    if (apiGateway == null) {
      _localDns = [];
      _deviceOptions = [];
      _loadingStatus = LoadStatus.error;
      notifyListeners();
      return false;
    }

    final resp = await apiGateway.updateLocalDns(
      ip: item.ip,
      name: item.name,
      oldIp: oldIp,
    );
    if (resp.result != APiResponseType.success) {
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

    final apiGateway = serversProvider?.selectedApiGateway;

    if (apiGateway == null) {
      _localDns = [];
      _deviceOptions = [];
      _loadingStatus = LoadStatus.error;
      notifyListeners();
      return false;
    }

    final resp = await apiGateway.deleteLocalDns(ip: item.ip, name: item.name);
    if (resp.result != APiResponseType.success) {
      _localDns.insert(idx, removed);
      notifyListeners();
      return false;
    }

    notifyListeners();
    return true;
  }

  List<DeviceOption> devicesInfoToOptions(List<DeviceInfo> devices) {
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
                // Exclude if name is present
                // if (addr.name != null && addr.name!.isNotEmpty) {
                //   return false;
                // }
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

  void _buildDeviceMaps(List<DeviceInfo> devices) {
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

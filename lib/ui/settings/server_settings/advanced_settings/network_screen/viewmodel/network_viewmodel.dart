import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/ftl/client.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:result_dart/result_dart.dart';

class NetworkData {
  const NetworkData({required this.devices, required this.currentClientIp});

  final List<Device> devices;
  final String currentClientIp;
}

class NetworkViewModel extends ChangeNotifier {
  NetworkViewModel({
    required NetworkRepository networkRepository,
    required FtlRepository ftlRepository,
  }) : _networkRepository = networkRepository,
       _ftlRepository = ftlRepository {
    loadDevices = Command.createAsyncNoParam<NetworkData>(
      _loadDevices,
      initialValue: const NetworkData(devices: [], currentClientIp: ''),
    );
    deleteDevice = Command.createAsyncNoResult<int>(_deleteDevice);

    loadDevices.addListener(notifyListeners);
    deleteDevice.addListener(notifyListeners);
  }

  final NetworkRepository _networkRepository;
  final FtlRepository _ftlRepository;

  late final Command<void, NetworkData> loadDevices;
  late final Command<int, void> deleteDevice;

  Future<NetworkData> _loadDevices() async {
    final results = await Future.wait([
      _networkRepository.fetchDevices(),
      _ftlRepository.fetchInfoClient(),
    ]);
    final devices = (results[0] as Result<List<Device>>).getOrThrow();
    final client = (results[1] as Result<FtlClient>).getOrThrow();
    return NetworkData(devices: devices, currentClientIp: client.addr);
  }

  Future<void> _deleteDevice(int deviceId) async {
    final result = await _networkRepository.deleteDevice(deviceId);
    result.getOrThrow();
    await loadDevices.runAsync();
  }

  @override
  void dispose() {
    loadDevices.removeListener(notifyListeners);
    deleteDevice.removeListener(notifyListeners);
    loadDevices.dispose();
    deleteDevice.dispose();
    super.dispose();
  }
}

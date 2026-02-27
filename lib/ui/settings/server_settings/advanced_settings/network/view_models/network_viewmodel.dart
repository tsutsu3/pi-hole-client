import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
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
    loadDevices = Command.createAsyncNoParam<void>(
      _loadDevices,
      initialValue: null,
    );
    deleteDevice = Command.createAsyncNoResult<int>(_deleteDevice);

    loadDevices.addListener(notifyListeners);
    deleteDevice.addListener(notifyListeners);
  }

  final NetworkRepository _networkRepository;
  final FtlRepository _ftlRepository;

  late final Command<void, void> loadDevices;
  late final Command<int, void> deleteDevice;

  // --- State ---
  NetworkData _data = const NetworkData(devices: [], currentClientIp: '');

  // --- Getters ---
  NetworkData get data => _data;

  Future<void> _loadDevices() async {
    final (devicesResult, clientResult) = await (
      _networkRepository.fetchDevices(),
      _ftlRepository.fetchInfoClient(),
    ).wait;
    if (devicesResult case Failure()) throw devicesResult.exceptionOrNull();
    if (clientResult case Failure()) throw clientResult.exceptionOrNull();

    _data = NetworkData(
      devices: devicesResult.getOrNull()!,
      currentClientIp: clientResult.getOrNull()!.addr,
    );
    notifyListeners();
  }

  Future<void> _deleteDevice(int deviceId) async {
    final result = await _networkRepository.deleteDevice(deviceId);
    switch (result) {
      case Success():
        _data = NetworkData(
          devices: _data.devices.where((d) => d.id != deviceId).toList(),
          currentClientIp: _data.currentClientIp,
        );
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
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

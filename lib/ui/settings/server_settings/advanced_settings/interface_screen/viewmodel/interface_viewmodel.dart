import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';

class InterfaceViewModel extends ChangeNotifier {
  InterfaceViewModel({required NetworkRepository networkRepository})
    : _networkRepository = networkRepository {
    loadInterfaces = Command.createAsyncNoParam<List<NetInterface>>(
      _loadInterfaces,
      initialValue: [],
    );

    loadInterfaces.addListener(notifyListeners);
  }

  final NetworkRepository _networkRepository;

  late final Command<void, List<NetInterface>> loadInterfaces;

  Future<List<NetInterface>> _loadInterfaces() async {
    final result = await _networkRepository.fetchGateways(isDetailed: true);
    final gateways = result.getOrThrow();
    return gateways.interfaces ?? [];
  }

  @override
  void dispose() {
    loadInterfaces.removeListener(notifyListeners);
    loadInterfaces.dispose();
    super.dispose();
  }
}

import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart';

class ServerInfoViewModel extends ChangeNotifier {
  ServerInfoViewModel({required FtlRepository ftlRepository})
    : _ftlRepository = ftlRepository {
    loadServerInfo = Command.createAsyncNoParam<PiholeServer>(
      _loadServerInfo,
      initialValue: const PiholeServer(),
    );

    loadServerInfo.addListener(notifyListeners);
  }

  final FtlRepository _ftlRepository;

  late final Command<void, PiholeServer> loadServerInfo;

  Future<PiholeServer> _loadServerInfo() async {
    final result = await _ftlRepository.fetchAllServerInfo();
    return result.getOrThrow();
  }

  @override
  void dispose() {
    loadServerInfo.removeListener(notifyListeners);
    loadServerInfo.dispose();
    super.dispose();
  }
}

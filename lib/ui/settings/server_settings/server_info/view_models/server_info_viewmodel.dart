import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/ftl_repository.dart';
import 'package:pi_hole_client/domain/model/ftl/pihole_server.dart';
import 'package:result_dart/result_dart.dart';

class ServerInfoViewModel extends ChangeNotifier {
  ServerInfoViewModel({
    required FtlRepository ftlRepository,
    required AuthRepository authRepository,
  }) : _ftlRepository = ftlRepository,
       _authRepository = authRepository {
    loadServerInfo = Command.createAsyncNoParam<PiholeServer>(
      _loadServerInfo,
      initialValue: const PiholeServer(),
    );

    loadServerInfo.addListener(notifyListeners);
  }

  final FtlRepository _ftlRepository;
  final AuthRepository _authRepository;

  late final Command<void, PiholeServer> loadServerInfo;

  bool? _mfaEnabled;

  /// Server 2FA status. `null` when unavailable (e.g. v5)
  bool? get mfaEnabled => _mfaEnabled;

  Future<PiholeServer> _loadServerInfo() async {
    final serverFuture = _ftlRepository.fetchAllServerInfo();
    final authFuture = _authRepository.getAuth(useSid: false);

    final authResult = await authFuture;
    _mfaEnabled = authResult.getOrNull()?.totp;

    final serverResult = await serverFuture;
    switch (serverResult) {
      case Success():
        return serverResult.getOrNull();
      case Failure():
        throw serverResult.exceptionOrNull();
    }
  }

  @override
  void dispose() {
    loadServerInfo.removeListener(notifyListeners);
    loadServerInfo.dispose();
    super.dispose();
  }
}

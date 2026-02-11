import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';

class SessionsViewModel extends ChangeNotifier {
  SessionsViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    loadSessions = Command.createAsyncNoParam<List<AuthSession>>(
      _loadSessions,
      initialValue: [],
    );
    deleteSession = Command.createAsyncNoResult<int>(_deleteSession);

    loadSessions.addListener(notifyListeners);
    deleteSession.addListener(notifyListeners);
  }

  final AuthRepository _authRepository;

  late final Command<void, List<AuthSession>> loadSessions;
  late final Command<int, void> deleteSession;

  Future<List<AuthSession>> _loadSessions() async {
    final result = await _authRepository.getAllSessions();
    return result.getOrThrow();
  }

  Future<void> _deleteSession(int sessionId) async {
    final result = await _authRepository.deleteSessionById(sessionId);
    result.getOrThrow();
    await loadSessions.runAsync();
  }

  @override
  void dispose() {
    loadSessions.removeListener(notifyListeners);
    deleteSession.removeListener(notifyListeners);
    loadSessions.dispose();
    deleteSession.dispose();
    super.dispose();
  }
}

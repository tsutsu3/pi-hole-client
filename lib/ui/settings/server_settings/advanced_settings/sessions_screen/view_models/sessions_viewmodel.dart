import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/auth_repository.dart';
import 'package:pi_hole_client/domain/model/auth/auth.dart';

class SessionsViewModel extends ChangeNotifier {
  SessionsViewModel({required AuthRepository authRepository})
    : _authRepository = authRepository {
    loadSessions = Command.createAsyncNoParam<void>(
      _loadSessions,
      initialValue: null,
    );
    deleteSession = Command.createAsyncNoResult<int>(_deleteSession);

    loadSessions.addListener(notifyListeners);
    deleteSession.addListener(notifyListeners);
  }

  final AuthRepository _authRepository;

  late final Command<void, void> loadSessions;
  late final Command<int, void> deleteSession;

  // --- State ---
  List<AuthSession> _sessions = [];

  // --- Getters ---
  List<AuthSession> get sessions => _sessions;

  Future<void> _loadSessions() async {
    final result = await _authRepository.getAllSessions();
    _sessions = result.getOrThrow();
    notifyListeners();
  }

  Future<void> _deleteSession(int sessionId) async {
    final result = await _authRepository.deleteSessionById(sessionId);
    result.getOrThrow();
    _sessions = _sessions.where((s) => s.id != sessionId).toList();
    notifyListeners();
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

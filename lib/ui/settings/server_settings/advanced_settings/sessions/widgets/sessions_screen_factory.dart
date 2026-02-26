import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions/view_models/sessions_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions/widgets/sessions_screen.dart';

Widget createSessionsScreen(RepositoryBundle bundle) {
  return SessionsScreen(
    viewModel: SessionsViewModel(authRepository: bundle.auth)
      ..loadSessions.run(),
  );
}

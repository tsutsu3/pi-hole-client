import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/sessions_screen/view_models/sessions_viewmodel.dart';

Widget createSessionsScreen(RepositoryBundle bundle) {
  return SessionsScreen(
    viewModel: SessionsViewModel(authRepository: bundle.auth)
      ..loadSessions.run(),
  );
}

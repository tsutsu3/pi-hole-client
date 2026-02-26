import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network/view_models/network_viewmodel.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/network/widgets/network_screen.dart';

Widget createNetworkScreen(RepositoryBundle bundle) {
  return NetworkScreen(
    viewModel: NetworkViewModel(
      networkRepository: bundle.network,
      ftlRepository: bundle.ftl,
    )..loadDevices.run(),
  );
}

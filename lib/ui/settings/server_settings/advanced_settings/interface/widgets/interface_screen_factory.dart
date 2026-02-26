import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface/widgets/interface_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/interface/view_models/interface_viewmodel.dart';

Widget createInterfaceScreen(RepositoryBundle bundle) {
  return InterfaceScreen(
    viewModel: InterfaceViewModel(networkRepository: bundle.network)
      ..loadInterfaces.run(),
  );
}

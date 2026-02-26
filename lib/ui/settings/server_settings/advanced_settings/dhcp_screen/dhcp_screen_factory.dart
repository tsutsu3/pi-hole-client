import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/dhcp_screen/view_models/dhcp_viewmodel.dart';

Widget createDhcpScreen(RepositoryBundle bundle) {
  return DhcpScreen(
    viewModel: DhcpViewModel(
      dhcpRepository: bundle.dhcp,
      ftlRepository: bundle.ftl,
    )..loadLeases.run(),
  );
}

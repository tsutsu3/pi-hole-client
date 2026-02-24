import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen.dart';
import 'package:pi_hole_client/ui/settings/server_settings/advanced_settings/local_dns_screen/viewmodel/local_dns_viewmodel.dart';

Widget createLocalDnsScreen(RepositoryBundle bundle) {
  return LocalDnsScreen(
    viewModel: LocalDnsViewModel(
      localDnsRepository: bundle.localDns,
      networkRepository: bundle.network,
    )..loadRecords.run(),
  );
}

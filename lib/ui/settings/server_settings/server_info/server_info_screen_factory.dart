import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/api/repository_bundle.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info.dart';
import 'package:pi_hole_client/ui/settings/server_settings/server_info/viewmodel/server_info_viewmodel.dart';

Widget createServerInfoScreen({
  required RepositoryBundle bundle,
  required String serverAlias,
  required String serverAddress,
}) {
  return ServerInfoScreen(
    viewModel: ServerInfoViewModel(ftlRepository: bundle.ftl)
      ..loadServerInfo.run(),
    serverAlias: serverAlias,
    serverAddress: serverAddress,
  );
}

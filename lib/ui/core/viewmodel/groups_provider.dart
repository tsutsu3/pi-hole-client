import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models/gateways.dart';
import 'package:pi_hole_client/domain/models/groups.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

class GroupsProvider with ChangeNotifier {
  GroupsProvider({required this.serversProvider});

  ServersProvider? serversProvider;

  List<Group> _groups = [];

  LoadStatus _loadingStatus = LoadStatus.loading;

  List<Group> get groups {
    return _groups;
  }

  Map<int, String> get groupItems {
    return {for (final group in _groups) group.id: group.name};
  }

  LoadStatus get loadingStatus => _loadingStatus;

  void update(ServersProvider? provider) {
    serversProvider = provider;
  }

  void setLoadingStatus(LoadStatus status) {
    _loadingStatus = status;
  }

  Future<void> loadGroups() async {
    final apiGateway = serversProvider?.selectedApiGateway;
    final result = await apiGateway?.getGroups();
    if (result?.result == APiResponseType.success) {
      _groups = result?.data?.groups ?? [];

      _loadingStatus = LoadStatus.loaded;
    } else {
      _loadingStatus = LoadStatus.error;
    }
    notifyListeners();
  }
}

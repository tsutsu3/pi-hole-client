import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/data/repositories/local/interfaces/server_repository.dart';
import 'package:pi_hole_client/domain/model/enum_converters.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/query_status.dart';
import 'package:pi_hole_client/domain/model/query_types.dart';
import 'package:pi_hole_client/domain/model/server/server.dart';
import 'package:pi_hole_client/ui/core/view_models/app_config_viewmodel.dart';
import 'package:pi_hole_client/utils/logger.dart';
import 'package:pi_hole_client/utils/widget_channel.dart';
import 'package:result_dart/result_dart.dart';

class ServersViewModel with ChangeNotifier {
  ServersViewModel(this._repository);

  AppConfigViewModel? _appConfigViewModel;
  final ServerRepository _repository;
  final List<QueryStatus> _queryStatusesV5 = queryStatusesV5;
  final List<QueryStatus> _queryStatusesV6 = queryStatusesV6;

  List<Server> _serversList = [];

  Server? _selectedServer;

  /// Selected server's enabled/disabled status (not part of domain model).
  bool? _selectedServerEnabled;

  Server? _connectingServer;
  bool _unverifiedBannerDismissed = false;

  AppConfigViewModel? get appConfigViewModel => _appConfigViewModel;

  List<Server> get getServersList {
    return _serversList;
  }

  Server? get selectedServer {
    return _selectedServer;
  }

  /// Whether the selected server is enabled (Pi-hole blocking active).
  bool? get selectedServerEnabled => _selectedServerEnabled;

  Server? get connectingServer => _connectingServer;
  bool get unverifiedBannerDismissed => _unverifiedBannerDismissed;

  /// Returns servers that have unverified certificates allowed
  /// (allowSelfSignedCert=true, ignoreCertificateErrors=false, no pinned cert)
  List<Server> get serversWithUnverifiedCertificates {
    return _serversList.where(_hasUnverifiedCertificate).toList();
  }

  /// Checks if a single server has unverified certificate settings
  bool _hasUnverifiedCertificate(Server server) {
    final address = server.address.toLowerCase();
    final isHttps = address.startsWith('https://');
    if (!isHttps) return false;
    if (server.ignoreCertificateErrors) return true;
    return server.allowSelfSignedCert &&
        (server.pinnedCertificateSha256 == null ||
            server.pinnedCertificateSha256!.isEmpty);
  }

  int get numShown {
    switch (_selectedServer?.apiVersion) {
      case 'v5':
        return _queryStatusesV5.where((status) => status.isShown).length;
      case 'v6':
        return _queryStatusesV6.where((status) => status.isShown).length;
      default:
        return 0;
    }
  }

  List<QueryStatus> get queryStatuses {
    switch (_selectedServer?.apiVersion) {
      case 'v5':
        return _queryStatusesV5;
      case 'v6':
        return _queryStatusesV6;
      default:
        return [];
    }
  }

  void update(AppConfigViewModel? provider) {
    _appConfigViewModel = provider;
  }

  void setConnectingServer(Server server) {
    _connectingServer = server;
  }

  void clearConnectingServer() {
    _connectingServer = null;
  }

  void setUnverifiedBannerDismissed(bool dismissed) {
    if (_unverifiedBannerDismissed == dismissed) return;
    _unverifiedBannerDismissed = dismissed;
    notifyListeners();
  }

  /// Returns the query status object for the given key.
  ///
  /// Parameters:
  /// - [key]: Number of the query status. e.g. '1', '2', '3', etc.
  QueryStatus? getQueryStatus(String key) {
    switch (_selectedServer?.apiVersion) {
      case 'v5':
        return _queryStatusesV5.firstWhereOrNull((status) => status.key == key);
      case 'v6':
        return _queryStatusesV6.firstWhereOrNull(
          (status) => status.index.toString() == key,
        );
      default:
        return null;
    }
  }

  /// Returns the [QueryStatus] display info for a [QueryStatusType] enum value.
  QueryStatus? getQueryStatusByType(QueryStatusType? type) {
    if (type == null) return null;
    final statuses = _selectedServer?.apiVersion == 'v6'
        ? _queryStatusesV6
        : _queryStatusesV5;
    return statuses.firstWhereOrNull((s) {
      final mapped = _selectedServer?.apiVersion == 'v6'
          ? convertQueryStatusTypeV6(s.key)
          : convertQueryStatusTypeV5(int.tryParse(s.key));
      return mapped == type;
    });
  }

  /// Returns the query status object for the given key.
  ///
  /// If the key is not found, returns null.
  QueryStatus? findQueryStatus(String key) {
    switch (_selectedServer?.apiVersion) {
      case 'v5':
        return _queryStatusesV5.firstWhereOrNull((status) => status.key == key);
      case 'v6':
        return _queryStatusesV6.firstWhereOrNull((status) => status.key == key);
      default:
        return null;
    }
  }

  Future<bool> addServer(Server server) async {
    final saved = await _repository.insertServer(server);
    if (saved.isSuccess()) {
      if (server.defaultServer == true) {
        final defaultServer = await setDefaultServer(server);
        if (defaultServer == true) {
          // Create new list so context.select() can detect the change
          _serversList = [..._serversList, server];
          await WidgetChannel.sendServersUpdated(_serversList);
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } else {
        // Create new list so context.select() can detect the change
        _serversList = [..._serversList, server];
        await WidgetChannel.sendServersUpdated(_serversList);
        notifyListeners();
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> editServer(Server server) async {
    final result = await _repository.updateServer(server);
    if (result.isSuccess()) {
      final newServers = _serversList.map((s) {
        if (s.address == server.address) {
          return server;
        } else {
          return s;
        }
      }).toList();
      _serversList = newServers;

      if (_selectedServer != null &&
          _selectedServer!.address == server.address) {
        _selectedServer = server;
      }

      // Handle default server update
      if (server.defaultServer == true) {
        final defaultUpdated = await setDefaultServer(server);
        if (!defaultUpdated) {
          return false;
        }
      }

      await WidgetChannel.sendServersUpdated(_serversList);
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  /// Removes a server from the list and clears its related data.
  Future<bool> removeServer(String serverAddress) async {
    try {
      final result = await _repository.deleteServer(serverAddress);

      if (result.isSuccess()) {
        // Create new list so context.select() can detect the change
        _serversList = _serversList
            .where((s) => s.address != serverAddress)
            .toList();

        if (_selectedServer?.address == serverAddress) {
          _selectedServer = null;
          _selectedServerEnabled = null;
        }

        await WidgetChannel.sendServerRemoved(serverAddress);
        await WidgetChannel.sendServersUpdated(_serversList);
        notifyListeners();
        return true;
      }

      return false;
    } catch (e) {
      logger.d('Transaction failed: $e');
      return false;
    }
  }

  Future<bool> setDefaultServer(Server server) async {
    final updated = await _repository.updateDefaultServer(server.address);
    if (updated.isSuccess()) {
      _serversList = _serversList.map((s) {
        if (s.address == server.address) {
          return s.copyWith(defaultServer: true);
        } else {
          return s.copyWith(defaultServer: false);
        }
      }).toList();
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> saveFromDb(List<Server> servers) async {
    Server? defaultServer;
    for (final server in servers) {
      _serversList.add(server);
      if (server.defaultServer == true) {
        defaultServer = server;
      }

      if (defaultServer != null) {
        _selectedServer = defaultServer;
      }

      notifyListeners();
    }
    if (servers.isEmpty) {
      notifyListeners();
    }
  }

  FutureOr<Map<String, dynamic>> checkUrlExists(String url) async {
    final result = await _repository.doesServerExist(url);
    return result.fold(
      (success) {
        if (success) {
          return {'result': 'success', 'exists': true};
        } else {
          return {'result': 'success', 'exists': false};
        }
      },
      (failure) {
        return {'result': 'fail', 'exists': false};
      },
    );
  }

  void setselectedServer({required Server? server, bool? toHomeTab}) {
    _selectedServer = server;
    if (server == null) _selectedServerEnabled = null;
    if (toHomeTab == true) _appConfigViewModel!.setSelectedTab(0);
    notifyListeners();
  }

  void updateselectedServerStatus(bool enabled) {
    if (_selectedServer != null && _selectedServerEnabled != enabled) {
      _selectedServerEnabled = enabled;
      notifyListeners();
    }
  }

  /// Deletes all server data from the database.
  Future<bool> deleteDbData() async {
    try {
      final result = await _repository.deleteAllServers();

      if (result.isSuccess()) {
        _serversList = [];
        _selectedServer = null;
        _selectedServerEnabled = null;
        notifyListeners();
        return true;
      } else {
        logger.d('Failed to delete server data');
        return false;
      }
    } catch (e) {
      logger.d('Transaction failed: $e');
      return false;
    }
  }

  Future<bool> resetSelectedServer() async {
    _selectedServer = null;
    _selectedServerEnabled = null;
    notifyListeners();
    return true;
  }

  Future<Result<String>> fetchPassword(String address) =>
      _repository.fetchPassword(address);

  Future<Result<({String token, String password})>> fetchCredentials(
    String address,
  ) => _repository.fetchCredentials(address);
}

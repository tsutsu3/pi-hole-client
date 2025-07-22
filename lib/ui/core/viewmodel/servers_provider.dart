import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/query_types.dart';
import 'package:pi_hole_client/data/repositories/database_repository.dart';
import 'package:pi_hole_client/data/services/api/api_gateway_factory.dart';
import 'package:pi_hole_client/data/services/api/api_gateway_interface.dart';
import 'package:pi_hole_client/data/services/api/shared/models/query_status.dart';
import 'package:pi_hole_client/domain/models/database.dart';
import 'package:pi_hole_client/domain/models/server.dart';
import 'package:pi_hole_client/ui/core/themes/theme.dart';
import 'package:pi_hole_client/ui/core/viewmodel/app_config_provider.dart';
import 'package:pi_hole_client/utils/conversions.dart';
import 'package:pi_hole_client/utils/logger.dart';

class ServersProvider with ChangeNotifier {
  ServersProvider(this._repository);

  AppConfigProvider? _appConfigProvider;
  final DatabaseRepository _repository;
  final List<QueryStatus> _queryStatusesV5 = queryStatusesV5;
  final List<QueryStatus> _queryStatusesV6 = queryStatusesV6;

  List<Server> _serversList = [];

  Server? _selectedServer;

  Server? _connectingServer;

  final Map<String, ApiGateway> _serverGateways = {};

  AppColors get colors => _appConfigProvider!.selectedTheme == ThemeMode.light
      ? lightAppColors
      : darkAppColors;

  AppConfigProvider? get appConfigProvider => _appConfigProvider;

  List<Server> get getServersList {
    return _serversList;
  }

  Server? get selectedServer {
    return _selectedServer;
  }

  Server? get connectingServer => _connectingServer;

  /// Returns the gateway for the selected server if a server is selected,
  /// otherwise returns null.
  ApiGateway? get selectedApiGateway => _selectedServer != null
      ? _serverGateways[_selectedServer?.address]
      : null;

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

  void update(AppConfigProvider? provider) {
    _appConfigProvider = provider;
  }

  void setConnectingServer(Server server) {
    _connectingServer = server;
  }

  void clearConnectingServer() {
    _connectingServer = null;
  }

  ApiGateway? loadApiGateway(Server server) {
    final gateway = _serverGateways[server.address];
    if (gateway == null) {
      return ApiGatewayFactory.create(server);
    }

    return _serverGateways[server.address];
  }

  ApiGateway? createApiGateway(Server server) {
    return ApiGatewayFactory.create(server);
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
        return _queryStatusesV6
            .firstWhereOrNull((status) => status.index.toString() == key);
      default:
        return null;
    }
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
    final saved = await _repository.saveServerQuery(server);
    if (saved.isSuccess()) {
      _serverGateways[server.address] = ApiGatewayFactory.create(server);
      if (server.defaultServer == true) {
        final defaultServer = await setDefaultServer(server);
        if (defaultServer == true) {
          // Create new list so context.select() can detect the change
          _serversList = [..._serversList, server];
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } else {
        // Create new list so context.select() can detect the change
        _serversList = [..._serversList, server];
        notifyListeners();
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> editServer(Server server) async {
    final result = await _repository.editServerQuery(server);
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

      // Update the API gateway if it exists
      if (_serverGateways.containsKey(server.address)) {
        _serverGateways[server.address]?.close();
        _serverGateways[server.address] = ApiGatewayFactory.create(server);
      }

      // Handle default server update
      if (server.defaultServer == true) {
        final defaultUpdated = await setDefaultServer(server);
        if (!defaultUpdated) {
          return false;
        }
      }

      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  /// Removes a server from the list and clears its related data.
  Future<bool> removeServer(String serverAddress) async {
    try {
      final dbOperationSuccess =
          await _repository.dbInstance.transaction((txn) async {
        final isServerRemoved =
            await _repository.removeServerQuery(serverAddress, txn: txn);
        final isGravityDataCleared =
            await _repository.clearGravityDataQuery(serverAddress, txn: txn);

        if (isServerRemoved.isError() || isGravityDataCleared.isError()) {
          throw Exception(
            'Failed to remove server or clear gravity-related data',
          );
        }

        return true;
      });

      if (dbOperationSuccess) {
        _serverGateways.remove(serverAddress);
        // Create new list so context.select() can detect the change
        _serversList =
            _serversList.where((s) => s.address != serverAddress).toList();

        if (_selectedServer?.address == serverAddress) {
          _selectedServer = null;
        }

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
    final updated = await _repository.setDefaultServerQuery(server.address);
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

  Future<dynamic> saveFromDb(List<ServerDbData>? servers) async {
    if (servers != null) {
      Server? defaultServer;
      for (final server in servers) {
        final serverObj = Server(
          address: server.address,
          alias: server.alias,
          defaultServer: convertFromIntToBool(server.isDefaultServer)!,
          apiVersion: server.apiVersion,
          allowSelfSignedCert: server.allowSelfSignedCert,
        );
        _serversList.add(serverObj);
        _serverGateways[serverObj.address] =
            ApiGatewayFactory.create(serverObj);
        if (convertFromIntToBool(server.isDefaultServer) == true) {
          defaultServer = serverObj;
        }

        if (defaultServer != null) {
          _selectedServer = defaultServer;
        }

        notifyListeners();
      }
    } else {
      notifyListeners();
    }
  }

  FutureOr<Map<String, dynamic>> checkUrlExists(String url) async {
    final result = await _repository.checkUrlExistsQuery(url);
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
    if (toHomeTab == true) _appConfigProvider!.setSelectedTab(0);
    notifyListeners();
  }

  void updateselectedServerStatus(bool enabled) {
    if (_selectedServer != null && _selectedServer!.enabled != enabled) {
      _selectedServer = _selectedServer!.copyWith(enabled: enabled);
      notifyListeners();
    }
  }

  /// Deletes all server data from the database.
  Future<bool> deleteDbData() async {
    try {
      return await _repository.dbInstance.transaction((txn) async {
        final isServerDataDeleted =
            await _repository.deleteServersDataQuery(txn: txn);
        final isGravityDataCleared =
            await _repository.clearAllGravityDataQuery(txn: txn);

        if (isServerDataDeleted.isSuccess() &&
            isGravityDataCleared.isSuccess()) {
          _serversList = [];
          _selectedServer = null;
          notifyListeners();
          return true;
        } else {
          throw Exception('Partial deletion failed');
        }
      });
    } catch (e) {
      logger.d('Transaction failed: $e');
      return false;
    }
  }

  Future<bool> resetSelectedServer() async {
    _selectedServer = null;
    notifyListeners();
    return true;
  }
}

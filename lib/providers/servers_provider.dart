import 'dart:async';

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/theme.dart';
import 'package:pi_hole_client/constants/query_types.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/functions/logger.dart';
import 'package:pi_hole_client/gateways/api_gateway_factory.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/query_status.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/models/server.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/repository/database.dart';

class ServersProvider with ChangeNotifier {
  ServersProvider(this._repository);

  AppConfigProvider? _appConfigProvider;
  final DatabaseRepository _repository;
  final List<QueryStatus> _queryStatusesV5 = queryStatusesV5;
  final List<QueryStatus> _queryStatusesV6 = queryStatusesV6;

  List<Server> _serversList = [];

  Server? _selectedServer;

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

  ApiGateway? loadApiGateway(Server server) {
    final gateway = _serverGateways[server.address];
    if (gateway == null) {
      return ApiGatewayFactory.create(server);
    }

    return _serverGateways[server.address];
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
    if (saved == true) {
      _serverGateways[server.address] = ApiGatewayFactory.create(server);
      if (server.defaultServer == true) {
        final defaultServer = await setDefaultServer(server);
        if (defaultServer == true) {
          _serversList.add(server);
          notifyListeners();
          return true;
        } else {
          return false;
        }
      } else {
        _serversList.add(server);
        notifyListeners();
        return true;
      }
    } else {
      return false;
    }
  }

  Future<bool> editServer(Server server) async {
    final result = await _repository.editServerQuery(server);
    if (result == true) {
      final newServers = _serversList.map((s) {
        if (s.address == server.address) {
          return server;
        } else {
          return s;
        }
      }).toList();
      _serversList = newServers;
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

        if (!isServerRemoved || !isGravityDataCleared) {
          throw Exception(
            'Failed to remove server or clear gravity-related data',
          );
        }

        return true;
      });

      if (dbOperationSuccess) {
        _serverGateways.removeWhere((address, _) => address == serverAddress);
        _selectedServer = null;
        _serversList = _serversList
            .where((server) => server.address != serverAddress)
            .toList();

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
    if (updated == true) {
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
    return await _repository.checkUrlExistsQuery(url);
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

        if (isServerDataDeleted && isGravityDataCleared) {
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

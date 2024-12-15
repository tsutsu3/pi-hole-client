import 'dart:async';
import 'package:flutter/material.dart';
import 'package:collection/collection.dart';
import 'package:pi_hole_client/constants/query_types.dart';
import 'package:pi_hole_client/gateways/api_gateway_factory.dart';
import 'package:pi_hole_client/gateways/api_gateway_interface.dart';
import 'package:pi_hole_client/models/query_status.dart';
import 'package:pi_hole_client/models/repository/database.dart';
import 'package:pi_hole_client/repository/database.dart';
import 'package:pi_hole_client/providers/app_config_provider.dart';
import 'package:pi_hole_client/functions/conversions.dart';
import 'package:pi_hole_client/models/server.dart';

class ServersProvider with ChangeNotifier {
  AppConfigProvider? _appConfigProvider;
  final DatabaseRepository _repository;
  final List<QueryStatus> _queryStatusesV5 = queryStatusesV5;
  final List<QueryStatus> _queryStatusesV6 = queryStatusesV6;

  ServersProvider(this._repository);

  update(AppConfigProvider? provider) {
    _appConfigProvider = provider;
  }

  List<Server> _serversList = [];

  Server? _selectedServer;

  final Map<String, ApiGateway> _serverGateways = {};

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

  ApiGateway? loadApiGateway(Server server) {
    final gateway = _serverGateways[server.address];
    if (gateway == null) {
      return ApiGatewayFactory.create(server);
    }

    return _serverGateways[server.address];
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
      List<Server> newServers = _serversList.map((s) {
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

  Future<bool> removeServer(String serverAddress) async {
    final result = await _repository.removeServerQuery(serverAddress);
    if (result == true) {
      _serverGateways.removeWhere((key, _) => key == serverAddress);
      _selectedServer = null;
      List<Server> newServers = _serversList
          .where((server) => server.address != serverAddress)
          .toList();
      _serversList = newServers;
      notifyListeners();
      return true;
    } else {
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

  // Future<bool> setToken(Server server) async {
  //   final result =
  //       await _repository.setServerTokenQuery(server.token, server.address);
  //   if (result == true) {
  //     _serversList = _serversList.map((s) {
  //       if (s.address == server.address) {
  //         return server;
  //       } else {
  //         return s;
  //       }
  //     }).toList();
  //     notifyListeners();
  //     return true;
  //   } else {
  //     return false;
  //   }
  // }

  Future saveFromDb(List<ServerDbData>? servers, bool connect) async {
    if (servers != null) {
      Server? defaultServer;
      for (var server in servers) {
        final Server serverObj = Server(
          address: server.address,
          alias: server.alias,
          token: server.token,
          defaultServer: convertFromIntToBool(server.isDefaultServer)!,
          apiVersion: server.apiVersion,
          basicAuthUser: server.basicAuthUser,
          basicAuthPassword: server.basicAuthPassword,
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

  Future<bool> deleteDbData() async {
    final result = await _repository.deleteServersDataQuery();
    if (result == true) {
      _serversList = [];
      _selectedServer = null;
      notifyListeners();
      return true;
    } else {
      return false;
    }
  }

  Future<bool> resetSelectedServer() async {
    _selectedServer = null;
    notifyListeners();
    return true;
  }
}

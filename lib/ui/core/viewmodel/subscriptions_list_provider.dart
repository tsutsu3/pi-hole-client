import 'package:flutter/material.dart';
import 'package:pi_hole_client/config/enums.dart';
import 'package:pi_hole_client/domain/models_old/gateways.dart';
import 'package:pi_hole_client/domain/models_old/subscriptions.dart';
import 'package:pi_hole_client/ui/core/viewmodel/servers_provider.dart';

class SubscriptionsListProvider with ChangeNotifier {
  SubscriptionsListProvider({required this.serversProvider});

  ServersProvider? serversProvider;

  LoadStatus _loadingStatus = LoadStatus.loading;
  List<Subscription> _whitelistSubscriptions = [];
  List<Subscription> _blacklistSubscriptions = [];

  List<Subscription> _filteredWhitelistSubscriptions = [];
  List<Subscription> _filteredBlacklistSubscriptions = [];

  int? _selectedTab;

  String _searchTerm = '';

  bool _searchMode = false;

  int? _groupFilter;

  LoadStatus get loadingStatus {
    return _loadingStatus;
  }

  List<Subscription> get whitelistSubscriptions {
    return _whitelistSubscriptions;
  }

  List<Subscription> get blacklistSubscriptions {
    return _blacklistSubscriptions;
  }

  List<Subscription> get filteredWhitelistSubscriptions {
    return _filteredWhitelistSubscriptions;
  }

  List<Subscription> get filteredBlacklistSubscriptions {
    return _filteredBlacklistSubscriptions;
  }

  int? get selectedTab {
    return _selectedTab;
  }

  String get searchTerm {
    return _searchTerm;
  }

  bool get searchMode {
    return _searchMode;
  }

  int? get groupFilter {
    return _groupFilter;
  }

  void update(ServersProvider? provider) {
    serversProvider = provider;
  }

  void setLoadingStatus(LoadStatus status) {
    _loadingStatus = status;
    notifyListeners();
  }

  void setWhitelistSubscriptions(List<Subscription> subscriptions) {
    _whitelistSubscriptions = subscriptions;
    notifyListeners();
  }

  void setBlacklistSubscriptions(List<Subscription> subscriptions) {
    _blacklistSubscriptions = subscriptions;
    notifyListeners();
  }

  void setSelectedTab(int? tab) {
    _selectedTab = tab;
  }

  void setSearchMode(bool value) {
    _searchMode = value;
    notifyListeners();
  }

  void setGroupFilter(int? groupId) {
    _groupFilter = groupId;
    _applyFilters();
    notifyListeners();
  }

  void clearGroupFilter() {
    _groupFilter = null;
    _applyFilters();
    notifyListeners();
  }

  void _applyFilters() {
    _filteredWhitelistSubscriptions = _whitelistSubscriptions.where((sub) {
      final matchesSearch =
          _searchTerm.isEmpty || sub.address.contains(_searchTerm);
      final matchesGroup =
          _groupFilter == null || sub.groups.contains(_groupFilter);
      return matchesSearch && matchesGroup;
    }).toList();

    _filteredBlacklistSubscriptions = _blacklistSubscriptions.where((sub) {
      final matchesSearch =
          _searchTerm.isEmpty || sub.address.contains(_searchTerm);
      final matchesGroup =
          _groupFilter == null || sub.groups.contains(_groupFilter);
      return matchesSearch && matchesGroup;
    }).toList();
  }

  /// Updates the search term and filters the blacklist and whitelist subscriptions
  /// based on the provided search value. If the search value is not empty, it filters
  /// the subscriptions whose addresses contain the search value. If the search value
  /// is empty, it resets the filtered subscriptions to the original lists.
  ///
  /// Notifies listeners about the changes.
  void onSearch(String value) {
    _searchTerm = value;
    _applyFilters();
    notifyListeners();
  }

  /// Fetches the list of subscriptions from the server.
  ///
  /// This method retrieves the subscriptions list from the selected API gateway
  /// and categorizes them into whitelist and blacklist based on their type.
  /// It also filters the subscriptions based on the search term and group filter.
  ///
  /// The method updates the loading status to `LoadStatus.loaded` if the fetch
  /// is successful, otherwise it sets the status to `LoadStatus.error`.
  ///
  /// Finally, it notifies listeners about the changes.
  ///
  /// Returns a [Future] that completes with the fetched subscriptions list.
  Future<dynamic> fetchSubscriptionsList() async {
    final apiGateway = serversProvider?.selectedApiGateway;
    final result = await apiGateway?.getSubscriptions();
    if (result?.result == APiResponseType.success) {
      _whitelistSubscriptions = <Subscription>[
        ...result!.data!.subscriptions.where((i) => i.type == 'allow'),
      ];

      _blacklistSubscriptions = <Subscription>[
        ...result.data!.subscriptions.where((i) => i.type == 'block'),
      ];

      _applyFilters();
      _loadingStatus = LoadStatus.loaded;
    } else {
      _loadingStatus = LoadStatus.error;
    }
    notifyListeners();
  }

  /// Removes a subscription from the appropriate list based on its type.
  ///
  /// This method checks the type of the given [subscription] and removes it
  /// from the corresponding list (whitelist or blacklist) and their filtered
  /// counterparts.
  ///
  /// - If the subscription type is `allow`, it will be removed from
  ///   `_whitelistSubscriptions` and `_filteredWhitelistSubscriptions`.
  /// - If the subscription type is `block`, it will be removed from
  ///   `_blacklistSubscriptions` and `_filteredBlacklistSubscriptions`.
  ///
  /// After removing the subscription, this method calls `notifyListeners()`
  /// to update any listeners about the change.
  ///
  /// Parameters:
  /// - [subscription]: The subscription to be removed from the list.
  void removeSubscriptionFromList(Subscription subscription) {
    if (subscription.type == 'allow') {
      _whitelistSubscriptions = _whitelistSubscriptions
          .where((item) => item.id != subscription.id)
          .toList();
      _filteredWhitelistSubscriptions = _filteredWhitelistSubscriptions
          .where((item) => item.id != subscription.id)
          .toList();
    } else if (subscription.type == 'block') {
      _blacklistSubscriptions = _blacklistSubscriptions
          .where((item) => item.id != subscription.id)
          .toList();
      _filteredBlacklistSubscriptions = _filteredBlacklistSubscriptions
          .where((item) => item.id != subscription.id)
          .toList();
    }
    notifyListeners();
  }
}

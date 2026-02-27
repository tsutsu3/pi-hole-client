import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/adlist_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/domain_repository.dart';
import 'package:pi_hole_client/domain/model/domain/domain.dart';
import 'package:pi_hole_client/domain/model/list/adlist.dart';
import 'package:pi_hole_client/domain/model/list/list_search_result.dart';
import 'package:result_dart/result_dart.dart';

class FindDomainsInListsViewModel extends ChangeNotifier {
  FindDomainsInListsViewModel({
    required AdListRepository adListRepository,
    required DomainRepository domainRepository,
  }) : _adListRepository = adListRepository,
       _domainRepository = domainRepository;

  final AdListRepository _adListRepository;
  final DomainRepository _domainRepository;

  // --- Commands ---
  late final Command<({String domain, bool partial, int limit}), void>
  searchLists = Command.createAsyncNoResult(_searchLists);
  late final Command<Domain, void> deleteDomain =
      Command.createAsyncNoResult<Domain>(_deleteDomain);
  late final Command<Adlist, void> deleteAdlist =
      Command.createAsyncNoResult<Adlist>(_deleteAdlist);

  // --- State ---
  ListSearchResult? _searchResult;
  List<Domain> _domainResults = [];
  List<GravityMatch> _gravityMatches = [];
  bool _hasSearched = false;
  String? _errorMessage;

  // --- Getters ---
  ListSearchResult? get searchResult => _searchResult;
  List<Domain> get domainResults => _domainResults;
  List<GravityMatch> get gravityMatches => _gravityMatches;
  bool get hasSearched => _hasSearched;
  String? get errorMessage => _errorMessage;

  bool get isSearching => searchLists.isRunning.value;

  // --- Command implementations ---
  Future<void> _searchLists(
    ({String domain, bool partial, int limit}) params,
  ) async {
    _errorMessage = null;
    _hasSearched = true;
    notifyListeners();

    final result = await _adListRepository.searchLists(
      domain: params.domain,
      partial: params.partial,
      limit: params.limit,
    );
    switch (result) {
      case Success():
        final data = result.getOrNull();
        _searchResult = data;
        _domainResults = data.domains;
        _gravityMatches = data.gravityMatches;
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  void setSearchError(String message) {
    _errorMessage = message;
    _searchResult = null;
    _domainResults = [];
    _gravityMatches = [];
    notifyListeners();
  }

  Future<void> _deleteDomain(Domain domain) async {
    final result = await _domainRepository.deleteDomain(
      domain.type,
      domain.kind,
      domain.punyCode,
    );
    switch (result) {
      case Success():
        _domainResults = _domainResults
            .where((d) => d.id != domain.id)
            .toList();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _deleteAdlist(Adlist adlist) async {
    final result = await _adListRepository.deleteAdlist(
      adlist.address,
      adlist.type,
    );
    switch (result) {
      case Success():
        _gravityMatches = _gravityMatches
            .where((m) => m.adlist.id != adlist.id)
            .toList();
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  // --- State mutation (details screen update callbacks) ---
  void updateDomainInResults(Domain updated) {
    _domainResults = _domainResults
        .map((d) => d.id == updated.id ? updated : d)
        .toList();
    notifyListeners();
  }

  void updateAdlistInResults(Adlist updated) {
    final addr = updated.address.trim().toLowerCase();
    _gravityMatches = _gravityMatches.map((m) {
      if (m.adlist.id == updated.id ||
          m.adlist.address.trim().toLowerCase() == addr) {
        return GravityMatch(adlist: updated, matchedDomain: m.matchedDomain);
      }
      return m;
    }).toList();
    notifyListeners();
  }

  @override
  void dispose() {
    searchLists.dispose();
    deleteDomain.dispose();
    deleteAdlist.dispose();
    super.dispose();
  }
}

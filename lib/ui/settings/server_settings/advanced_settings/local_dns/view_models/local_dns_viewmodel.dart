import 'package:command_it/command_it.dart';
import 'package:flutter/foundation.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/local_dns_repository.dart';
import 'package:pi_hole_client/data/repositories/api/interfaces/network_repository.dart';
import 'package:pi_hole_client/domain/model/local_dns/local_dns.dart';
import 'package:pi_hole_client/domain/model/network/device_lookups.dart';
import 'package:pi_hole_client/domain/model/network/network.dart';
import 'package:pi_hole_client/utils/exceptions.dart';
import 'package:pi_hole_client/utils/validators.dart';
import 'package:result_dart/result_dart.dart';

class LocalDnsData {
  const LocalDnsData({required this.records, required this.deviceOptions});

  final List<LocalDns> records;
  final List<DeviceOption> deviceOptions;
}

class LocalDnsViewModel extends ChangeNotifier {
  LocalDnsViewModel({
    required LocalDnsRepository localDnsRepository,
    required NetworkRepository networkRepository,
  }) : _localDnsRepository = localDnsRepository,
       _networkRepository = networkRepository {
    loadRecords = Command.createAsyncNoParam<void>(
      _loadRecords,
      initialValue: null,
    );
    addRecord = Command.createAsyncNoResult<LocalDns>(_addRecord);
    updateRecord =
        Command.createAsyncNoResult<({LocalDns oldRecord, LocalDns newRecord})>(
          _updateRecord,
        );
    deleteRecord = Command.createAsyncNoResult<LocalDns>(_deleteRecord);

    loadRecords.addListener(notifyListeners);
    loadRecords.isRunning.addListener(notifyListeners);
    loadRecords.errors.addListener(notifyListeners);
    addRecord.addListener(notifyListeners);
    addRecord.errors.addListener(notifyListeners);
    updateRecord.addListener(notifyListeners);
    updateRecord.errors.addListener(notifyListeners);
    deleteRecord.addListener(notifyListeners);
    deleteRecord.errors.addListener(notifyListeners);
  }

  final LocalDnsRepository _localDnsRepository;
  final NetworkRepository _networkRepository;

  late final Command<void, void> loadRecords;
  late final Command<LocalDns, void> addRecord;
  late final Command<({LocalDns oldRecord, LocalDns newRecord}), void>
  updateRecord;
  late final Command<LocalDns, void> deleteRecord;

  // --- State ---
  LocalDnsData _data = const LocalDnsData(records: [], deviceOptions: []);

  // --- Getters ---
  LocalDnsData get data => _data;

  Future<void> _loadRecords() async {
    final (dnsResult, devicesResult) = await (
      _localDnsRepository.fetchRecords(),
      _networkRepository.fetchDevices(),
    ).wait;
    if (dnsResult case Failure()) throw dnsResult.exceptionOrNull();
    if (devicesResult case Failure()) throw devicesResult.exceptionOrNull();

    _data = LocalDnsData(
      records: dnsResult.getOrNull()!,
      deviceOptions: devicesResult.getOrNull()!.toDeviceOptions(),
    );
    notifyListeners();
  }

  Future<void> _addRecord(LocalDns record) async {
    if (_data.records.any((r) => _isSameRecord(r, record))) {
      throw AlreadyExistsException();
    }

    final result = await _localDnsRepository.addRecord(
      ip: record.ip,
      name: record.name,
    );
    switch (result) {
      case Success():
        _data = LocalDnsData(
          records: [..._data.records, record],
          deviceOptions: _data.deviceOptions,
        );
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _updateRecord(
    ({LocalDns oldRecord, LocalDns newRecord}) params,
  ) async {
    final index = _data.records.indexOf(params.oldRecord);
    final others = [..._data.records];
    if (index != -1) others.removeAt(index);
    if (others.any((r) => _isSameRecord(r, params.newRecord))) {
      throw AlreadyExistsException();
    }

    final result = await _localDnsRepository.updateRecord(
      oldRecord: params.oldRecord,
      newRecord: params.newRecord,
    );
    switch (result) {
      case Success():
        // The repository updates only the first match, so do the same here.
        final records = [..._data.records];
        if (index != -1) records[index] = params.newRecord;
        _data = LocalDnsData(
          records: records,
          deviceOptions: _data.deviceOptions,
        );
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  Future<void> _deleteRecord(LocalDns record) async {
    final result = await _localDnsRepository.deleteRecord(
      ip: record.ip,
      name: record.name,
    );
    switch (result) {
      case Success():
        final records = [..._data.records]..remove(record);
        _data = LocalDnsData(
          records: records,
          deviceOptions: _data.deviceOptions,
        );
        notifyListeners();
      case Failure():
        throw result.exceptionOrNull();
    }
  }

  /// Whether both records point the same names to the same IP,
  /// ignoring extra spaces.
  bool _isSameRecord(LocalDns a, LocalDns b) {
    return a.ip.trim() == b.ip.trim() &&
        normalizeLocalDnsNames(a.name) == normalizeLocalDnsNames(b.name);
  }

  @override
  void dispose() {
    loadRecords.removeListener(notifyListeners);
    loadRecords.isRunning.removeListener(notifyListeners);
    loadRecords.errors.removeListener(notifyListeners);
    addRecord.removeListener(notifyListeners);
    addRecord.errors.removeListener(notifyListeners);
    updateRecord.removeListener(notifyListeners);
    updateRecord.errors.removeListener(notifyListeners);
    deleteRecord.removeListener(notifyListeners);
    deleteRecord.errors.removeListener(notifyListeners);
    loadRecords.dispose();
    addRecord.dispose();
    updateRecord.dispose();
    deleteRecord.dispose();
    super.dispose();
  }
}

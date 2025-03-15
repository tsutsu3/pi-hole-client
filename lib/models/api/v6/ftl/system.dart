import 'package:freezed_annotation/freezed_annotation.dart';

part 'system.freezed.dart';
part 'system.g.dart';

@freezed
sealed class System with _$System {
  const factory System({
    required int uptime,
    required Memory memory,
    required int procs,
    required CPU cpu,
    required double took,
  }) = _System;

  factory System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);
}

@freezed
sealed class Memory with _$Memory {
  const factory Memory({
    required RAM ram,
    required Swap swap,
  }) = _Memory;

  factory Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);
}

@freezed
sealed class RAM with _$RAM {
  const factory RAM({
    required int total,
    required int free,
    required int used,
    required int available,
    @JsonKey(name: '%used') required double percentUsed,
  }) = _RAM;

  factory RAM.fromJson(Map<String, dynamic> json) => _$RAMFromJson(json);
}

@freezed
sealed class Swap with _$Swap {
  const factory Swap({
    required int total,
    required int used,
    required int free,
    @JsonKey(name: '%used') required double percentUsed,
  }) = _Swap;

  factory Swap.fromJson(Map<String, dynamic> json) => _$SwapFromJson(json);
}

@freezed
sealed class CPU with _$CPU {
  const factory CPU({
    required int nprocs,
    required Load load,
  }) = _CPU;

  factory CPU.fromJson(Map<String, dynamic> json) => _$CPUFromJson(json);
}

@freezed
sealed class Load with _$Load {
  const factory Load({
    required List<double> raw,
    required List<double> percent,
  }) = _Load;

  factory Load.fromJson(Map<String, dynamic> json) => _$LoadFromJson(json);
}

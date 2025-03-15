// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'system.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$System {
  int get uptime;
  Memory get memory;
  int get procs;
  CPU get cpu;
  double get took;

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SystemCopyWith<System> get copyWith =>
      _$SystemCopyWithImpl<System>(this as System, _$identity);

  /// Serializes this System to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is System &&
            (identical(other.uptime, uptime) || other.uptime == uptime) &&
            (identical(other.memory, memory) || other.memory == memory) &&
            (identical(other.procs, procs) || other.procs == procs) &&
            (identical(other.cpu, cpu) || other.cpu == cpu) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uptime, memory, procs, cpu, took);

  @override
  String toString() {
    return 'System(uptime: $uptime, memory: $memory, procs: $procs, cpu: $cpu, took: $took)';
  }
}

/// @nodoc
abstract mixin class $SystemCopyWith<$Res> {
  factory $SystemCopyWith(System value, $Res Function(System) _then) =
      _$SystemCopyWithImpl;
  @useResult
  $Res call({int uptime, Memory memory, int procs, CPU cpu, double took});

  $MemoryCopyWith<$Res> get memory;
  $CPUCopyWith<$Res> get cpu;
}

/// @nodoc
class _$SystemCopyWithImpl<$Res> implements $SystemCopyWith<$Res> {
  _$SystemCopyWithImpl(this._self, this._then);

  final System _self;
  final $Res Function(System) _then;

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uptime = null,
    Object? memory = null,
    Object? procs = null,
    Object? cpu = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      uptime: null == uptime
          ? _self.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      memory: null == memory
          ? _self.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as Memory,
      procs: null == procs
          ? _self.procs
          : procs // ignore: cast_nullable_to_non_nullable
              as int,
      cpu: null == cpu
          ? _self.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as CPU,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemoryCopyWith<$Res> get memory {
    return $MemoryCopyWith<$Res>(_self.memory, (value) {
      return _then(_self.copyWith(memory: value));
    });
  }

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CPUCopyWith<$Res> get cpu {
    return $CPUCopyWith<$Res>(_self.cpu, (value) {
      return _then(_self.copyWith(cpu: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _System implements System {
  const _System(
      {required this.uptime,
      required this.memory,
      required this.procs,
      required this.cpu,
      required this.took});
  factory _System.fromJson(Map<String, dynamic> json) => _$SystemFromJson(json);

  @override
  final int uptime;
  @override
  final Memory memory;
  @override
  final int procs;
  @override
  final CPU cpu;
  @override
  final double took;

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SystemCopyWith<_System> get copyWith =>
      __$SystemCopyWithImpl<_System>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SystemToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _System &&
            (identical(other.uptime, uptime) || other.uptime == uptime) &&
            (identical(other.memory, memory) || other.memory == memory) &&
            (identical(other.procs, procs) || other.procs == procs) &&
            (identical(other.cpu, cpu) || other.cpu == cpu) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, uptime, memory, procs, cpu, took);

  @override
  String toString() {
    return 'System(uptime: $uptime, memory: $memory, procs: $procs, cpu: $cpu, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$SystemCopyWith<$Res> implements $SystemCopyWith<$Res> {
  factory _$SystemCopyWith(_System value, $Res Function(_System) _then) =
      __$SystemCopyWithImpl;
  @override
  @useResult
  $Res call({int uptime, Memory memory, int procs, CPU cpu, double took});

  @override
  $MemoryCopyWith<$Res> get memory;
  @override
  $CPUCopyWith<$Res> get cpu;
}

/// @nodoc
class __$SystemCopyWithImpl<$Res> implements _$SystemCopyWith<$Res> {
  __$SystemCopyWithImpl(this._self, this._then);

  final _System _self;
  final $Res Function(_System) _then;

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? uptime = null,
    Object? memory = null,
    Object? procs = null,
    Object? cpu = null,
    Object? took = null,
  }) {
    return _then(_System(
      uptime: null == uptime
          ? _self.uptime
          : uptime // ignore: cast_nullable_to_non_nullable
              as int,
      memory: null == memory
          ? _self.memory
          : memory // ignore: cast_nullable_to_non_nullable
              as Memory,
      procs: null == procs
          ? _self.procs
          : procs // ignore: cast_nullable_to_non_nullable
              as int,
      cpu: null == cpu
          ? _self.cpu
          : cpu // ignore: cast_nullable_to_non_nullable
              as CPU,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MemoryCopyWith<$Res> get memory {
    return $MemoryCopyWith<$Res>(_self.memory, (value) {
      return _then(_self.copyWith(memory: value));
    });
  }

  /// Create a copy of System
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $CPUCopyWith<$Res> get cpu {
    return $CPUCopyWith<$Res>(_self.cpu, (value) {
      return _then(_self.copyWith(cpu: value));
    });
  }
}

/// @nodoc
mixin _$Memory {
  RAM get ram;
  Swap get swap;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MemoryCopyWith<Memory> get copyWith =>
      _$MemoryCopyWithImpl<Memory>(this as Memory, _$identity);

  /// Serializes this Memory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Memory &&
            (identical(other.ram, ram) || other.ram == ram) &&
            (identical(other.swap, swap) || other.swap == swap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ram, swap);

  @override
  String toString() {
    return 'Memory(ram: $ram, swap: $swap)';
  }
}

/// @nodoc
abstract mixin class $MemoryCopyWith<$Res> {
  factory $MemoryCopyWith(Memory value, $Res Function(Memory) _then) =
      _$MemoryCopyWithImpl;
  @useResult
  $Res call({RAM ram, Swap swap});

  $RAMCopyWith<$Res> get ram;
  $SwapCopyWith<$Res> get swap;
}

/// @nodoc
class _$MemoryCopyWithImpl<$Res> implements $MemoryCopyWith<$Res> {
  _$MemoryCopyWithImpl(this._self, this._then);

  final Memory _self;
  final $Res Function(Memory) _then;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ram = null,
    Object? swap = null,
  }) {
    return _then(_self.copyWith(
      ram: null == ram
          ? _self.ram
          : ram // ignore: cast_nullable_to_non_nullable
              as RAM,
      swap: null == swap
          ? _self.swap
          : swap // ignore: cast_nullable_to_non_nullable
              as Swap,
    ));
  }

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RAMCopyWith<$Res> get ram {
    return $RAMCopyWith<$Res>(_self.ram, (value) {
      return _then(_self.copyWith(ram: value));
    });
  }

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SwapCopyWith<$Res> get swap {
    return $SwapCopyWith<$Res>(_self.swap, (value) {
      return _then(_self.copyWith(swap: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Memory implements Memory {
  const _Memory({required this.ram, required this.swap});
  factory _Memory.fromJson(Map<String, dynamic> json) => _$MemoryFromJson(json);

  @override
  final RAM ram;
  @override
  final Swap swap;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MemoryCopyWith<_Memory> get copyWith =>
      __$MemoryCopyWithImpl<_Memory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MemoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Memory &&
            (identical(other.ram, ram) || other.ram == ram) &&
            (identical(other.swap, swap) || other.swap == swap));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, ram, swap);

  @override
  String toString() {
    return 'Memory(ram: $ram, swap: $swap)';
  }
}

/// @nodoc
abstract mixin class _$MemoryCopyWith<$Res> implements $MemoryCopyWith<$Res> {
  factory _$MemoryCopyWith(_Memory value, $Res Function(_Memory) _then) =
      __$MemoryCopyWithImpl;
  @override
  @useResult
  $Res call({RAM ram, Swap swap});

  @override
  $RAMCopyWith<$Res> get ram;
  @override
  $SwapCopyWith<$Res> get swap;
}

/// @nodoc
class __$MemoryCopyWithImpl<$Res> implements _$MemoryCopyWith<$Res> {
  __$MemoryCopyWithImpl(this._self, this._then);

  final _Memory _self;
  final $Res Function(_Memory) _then;

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ram = null,
    Object? swap = null,
  }) {
    return _then(_Memory(
      ram: null == ram
          ? _self.ram
          : ram // ignore: cast_nullable_to_non_nullable
              as RAM,
      swap: null == swap
          ? _self.swap
          : swap // ignore: cast_nullable_to_non_nullable
              as Swap,
    ));
  }

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $RAMCopyWith<$Res> get ram {
    return $RAMCopyWith<$Res>(_self.ram, (value) {
      return _then(_self.copyWith(ram: value));
    });
  }

  /// Create a copy of Memory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SwapCopyWith<$Res> get swap {
    return $SwapCopyWith<$Res>(_self.swap, (value) {
      return _then(_self.copyWith(swap: value));
    });
  }
}

/// @nodoc
mixin _$RAM {
  int get total;
  int get free;
  int get used;
  int get available;
  @JsonKey(name: '%used')
  double get percentUsed;

  /// Create a copy of RAM
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RAMCopyWith<RAM> get copyWith =>
      _$RAMCopyWithImpl<RAM>(this as RAM, _$identity);

  /// Serializes this RAM to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is RAM &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.percentUsed, percentUsed) ||
                other.percentUsed == percentUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, free, used, available, percentUsed);

  @override
  String toString() {
    return 'RAM(total: $total, free: $free, used: $used, available: $available, percentUsed: $percentUsed)';
  }
}

/// @nodoc
abstract mixin class $RAMCopyWith<$Res> {
  factory $RAMCopyWith(RAM value, $Res Function(RAM) _then) = _$RAMCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int free,
      int used,
      int available,
      @JsonKey(name: '%used') double percentUsed});
}

/// @nodoc
class _$RAMCopyWithImpl<$Res> implements $RAMCopyWith<$Res> {
  _$RAMCopyWithImpl(this._self, this._then);

  final RAM _self;
  final $Res Function(RAM) _then;

  /// Create a copy of RAM
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? free = null,
    Object? used = null,
    Object? available = null,
    Object? percentUsed = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      free: null == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _self.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      percentUsed: null == percentUsed
          ? _self.percentUsed
          : percentUsed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _RAM implements RAM {
  const _RAM(
      {required this.total,
      required this.free,
      required this.used,
      required this.available,
      @JsonKey(name: '%used') required this.percentUsed});
  factory _RAM.fromJson(Map<String, dynamic> json) => _$RAMFromJson(json);

  @override
  final int total;
  @override
  final int free;
  @override
  final int used;
  @override
  final int available;
  @override
  @JsonKey(name: '%used')
  final double percentUsed;

  /// Create a copy of RAM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RAMCopyWith<_RAM> get copyWith =>
      __$RAMCopyWithImpl<_RAM>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RAMToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RAM &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.available, available) ||
                other.available == available) &&
            (identical(other.percentUsed, percentUsed) ||
                other.percentUsed == percentUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, total, free, used, available, percentUsed);

  @override
  String toString() {
    return 'RAM(total: $total, free: $free, used: $used, available: $available, percentUsed: $percentUsed)';
  }
}

/// @nodoc
abstract mixin class _$RAMCopyWith<$Res> implements $RAMCopyWith<$Res> {
  factory _$RAMCopyWith(_RAM value, $Res Function(_RAM) _then) =
      __$RAMCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int free,
      int used,
      int available,
      @JsonKey(name: '%used') double percentUsed});
}

/// @nodoc
class __$RAMCopyWithImpl<$Res> implements _$RAMCopyWith<$Res> {
  __$RAMCopyWithImpl(this._self, this._then);

  final _RAM _self;
  final $Res Function(_RAM) _then;

  /// Create a copy of RAM
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? free = null,
    Object? used = null,
    Object? available = null,
    Object? percentUsed = null,
  }) {
    return _then(_RAM(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      free: null == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _self.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      available: null == available
          ? _self.available
          : available // ignore: cast_nullable_to_non_nullable
              as int,
      percentUsed: null == percentUsed
          ? _self.percentUsed
          : percentUsed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$Swap {
  int get total;
  int get used;
  int get free;
  @JsonKey(name: '%used')
  double get percentUsed;

  /// Create a copy of Swap
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SwapCopyWith<Swap> get copyWith =>
      _$SwapCopyWithImpl<Swap>(this as Swap, _$identity);

  /// Serializes this Swap to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Swap &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.percentUsed, percentUsed) ||
                other.percentUsed == percentUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, used, free, percentUsed);

  @override
  String toString() {
    return 'Swap(total: $total, used: $used, free: $free, percentUsed: $percentUsed)';
  }
}

/// @nodoc
abstract mixin class $SwapCopyWith<$Res> {
  factory $SwapCopyWith(Swap value, $Res Function(Swap) _then) =
      _$SwapCopyWithImpl;
  @useResult
  $Res call(
      {int total,
      int used,
      int free,
      @JsonKey(name: '%used') double percentUsed});
}

/// @nodoc
class _$SwapCopyWithImpl<$Res> implements $SwapCopyWith<$Res> {
  _$SwapCopyWithImpl(this._self, this._then);

  final Swap _self;
  final $Res Function(Swap) _then;

  /// Create a copy of Swap
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? total = null,
    Object? used = null,
    Object? free = null,
    Object? percentUsed = null,
  }) {
    return _then(_self.copyWith(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _self.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      free: null == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      percentUsed: null == percentUsed
          ? _self.percentUsed
          : percentUsed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Swap implements Swap {
  const _Swap(
      {required this.total,
      required this.used,
      required this.free,
      @JsonKey(name: '%used') required this.percentUsed});
  factory _Swap.fromJson(Map<String, dynamic> json) => _$SwapFromJson(json);

  @override
  final int total;
  @override
  final int used;
  @override
  final int free;
  @override
  @JsonKey(name: '%used')
  final double percentUsed;

  /// Create a copy of Swap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SwapCopyWith<_Swap> get copyWith =>
      __$SwapCopyWithImpl<_Swap>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SwapToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Swap &&
            (identical(other.total, total) || other.total == total) &&
            (identical(other.used, used) || other.used == used) &&
            (identical(other.free, free) || other.free == free) &&
            (identical(other.percentUsed, percentUsed) ||
                other.percentUsed == percentUsed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, total, used, free, percentUsed);

  @override
  String toString() {
    return 'Swap(total: $total, used: $used, free: $free, percentUsed: $percentUsed)';
  }
}

/// @nodoc
abstract mixin class _$SwapCopyWith<$Res> implements $SwapCopyWith<$Res> {
  factory _$SwapCopyWith(_Swap value, $Res Function(_Swap) _then) =
      __$SwapCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int total,
      int used,
      int free,
      @JsonKey(name: '%used') double percentUsed});
}

/// @nodoc
class __$SwapCopyWithImpl<$Res> implements _$SwapCopyWith<$Res> {
  __$SwapCopyWithImpl(this._self, this._then);

  final _Swap _self;
  final $Res Function(_Swap) _then;

  /// Create a copy of Swap
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? total = null,
    Object? used = null,
    Object? free = null,
    Object? percentUsed = null,
  }) {
    return _then(_Swap(
      total: null == total
          ? _self.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      used: null == used
          ? _self.used
          : used // ignore: cast_nullable_to_non_nullable
              as int,
      free: null == free
          ? _self.free
          : free // ignore: cast_nullable_to_non_nullable
              as int,
      percentUsed: null == percentUsed
          ? _self.percentUsed
          : percentUsed // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$CPU {
  int get nprocs;
  Load get load;

  /// Create a copy of CPU
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $CPUCopyWith<CPU> get copyWith =>
      _$CPUCopyWithImpl<CPU>(this as CPU, _$identity);

  /// Serializes this CPU to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is CPU &&
            (identical(other.nprocs, nprocs) || other.nprocs == nprocs) &&
            (identical(other.load, load) || other.load == load));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nprocs, load);

  @override
  String toString() {
    return 'CPU(nprocs: $nprocs, load: $load)';
  }
}

/// @nodoc
abstract mixin class $CPUCopyWith<$Res> {
  factory $CPUCopyWith(CPU value, $Res Function(CPU) _then) = _$CPUCopyWithImpl;
  @useResult
  $Res call({int nprocs, Load load});

  $LoadCopyWith<$Res> get load;
}

/// @nodoc
class _$CPUCopyWithImpl<$Res> implements $CPUCopyWith<$Res> {
  _$CPUCopyWithImpl(this._self, this._then);

  final CPU _self;
  final $Res Function(CPU) _then;

  /// Create a copy of CPU
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nprocs = null,
    Object? load = null,
  }) {
    return _then(_self.copyWith(
      nprocs: null == nprocs
          ? _self.nprocs
          : nprocs // ignore: cast_nullable_to_non_nullable
              as int,
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as Load,
    ));
  }

  /// Create a copy of CPU
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadCopyWith<$Res> get load {
    return $LoadCopyWith<$Res>(_self.load, (value) {
      return _then(_self.copyWith(load: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _CPU implements CPU {
  const _CPU({required this.nprocs, required this.load});
  factory _CPU.fromJson(Map<String, dynamic> json) => _$CPUFromJson(json);

  @override
  final int nprocs;
  @override
  final Load load;

  /// Create a copy of CPU
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$CPUCopyWith<_CPU> get copyWith =>
      __$CPUCopyWithImpl<_CPU>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$CPUToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _CPU &&
            (identical(other.nprocs, nprocs) || other.nprocs == nprocs) &&
            (identical(other.load, load) || other.load == load));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, nprocs, load);

  @override
  String toString() {
    return 'CPU(nprocs: $nprocs, load: $load)';
  }
}

/// @nodoc
abstract mixin class _$CPUCopyWith<$Res> implements $CPUCopyWith<$Res> {
  factory _$CPUCopyWith(_CPU value, $Res Function(_CPU) _then) =
      __$CPUCopyWithImpl;
  @override
  @useResult
  $Res call({int nprocs, Load load});

  @override
  $LoadCopyWith<$Res> get load;
}

/// @nodoc
class __$CPUCopyWithImpl<$Res> implements _$CPUCopyWith<$Res> {
  __$CPUCopyWithImpl(this._self, this._then);

  final _CPU _self;
  final $Res Function(_CPU) _then;

  /// Create a copy of CPU
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? nprocs = null,
    Object? load = null,
  }) {
    return _then(_CPU(
      nprocs: null == nprocs
          ? _self.nprocs
          : nprocs // ignore: cast_nullable_to_non_nullable
              as int,
      load: null == load
          ? _self.load
          : load // ignore: cast_nullable_to_non_nullable
              as Load,
    ));
  }

  /// Create a copy of CPU
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LoadCopyWith<$Res> get load {
    return $LoadCopyWith<$Res>(_self.load, (value) {
      return _then(_self.copyWith(load: value));
    });
  }
}

/// @nodoc
mixin _$Load {
  List<double> get raw;
  List<double> get percent;

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoadCopyWith<Load> get copyWith =>
      _$LoadCopyWithImpl<Load>(this as Load, _$identity);

  /// Serializes this Load to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Load &&
            const DeepCollectionEquality().equals(other.raw, raw) &&
            const DeepCollectionEquality().equals(other.percent, percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(raw),
      const DeepCollectionEquality().hash(percent));

  @override
  String toString() {
    return 'Load(raw: $raw, percent: $percent)';
  }
}

/// @nodoc
abstract mixin class $LoadCopyWith<$Res> {
  factory $LoadCopyWith(Load value, $Res Function(Load) _then) =
      _$LoadCopyWithImpl;
  @useResult
  $Res call({List<double> raw, List<double> percent});
}

/// @nodoc
class _$LoadCopyWithImpl<$Res> implements $LoadCopyWith<$Res> {
  _$LoadCopyWithImpl(this._self, this._then);

  final Load _self;
  final $Res Function(Load) _then;

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? raw = null,
    Object? percent = null,
  }) {
    return _then(_self.copyWith(
      raw: null == raw
          ? _self.raw
          : raw // ignore: cast_nullable_to_non_nullable
              as List<double>,
      percent: null == percent
          ? _self.percent
          : percent // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Load implements Load {
  const _Load(
      {required final List<double> raw, required final List<double> percent})
      : _raw = raw,
        _percent = percent;
  factory _Load.fromJson(Map<String, dynamic> json) => _$LoadFromJson(json);

  final List<double> _raw;
  @override
  List<double> get raw {
    if (_raw is EqualUnmodifiableListView) return _raw;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_raw);
  }

  final List<double> _percent;
  @override
  List<double> get percent {
    if (_percent is EqualUnmodifiableListView) return _percent;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_percent);
  }

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LoadToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Load &&
            const DeepCollectionEquality().equals(other._raw, _raw) &&
            const DeepCollectionEquality().equals(other._percent, _percent));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_raw),
      const DeepCollectionEquality().hash(_percent));

  @override
  String toString() {
    return 'Load(raw: $raw, percent: $percent)';
  }
}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res> implements $LoadCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) =
      __$LoadCopyWithImpl;
  @override
  @useResult
  $Res call({List<double> raw, List<double> percent});
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

  /// Create a copy of Load
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? raw = null,
    Object? percent = null,
  }) {
    return _then(_Load(
      raw: null == raw
          ? _self._raw
          : raw // ignore: cast_nullable_to_non_nullable
              as List<double>,
      percent: null == percent
          ? _self._percent
          : percent // ignore: cast_nullable_to_non_nullable
              as List<double>,
    ));
  }
}

// dart format on

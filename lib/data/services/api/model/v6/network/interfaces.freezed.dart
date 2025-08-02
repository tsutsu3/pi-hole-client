// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'interfaces.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Interfaces {
  List<InterfaceData> get interfaces;
  double get took;

  /// Create a copy of Interfaces
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterfacesCopyWith<Interfaces> get copyWith =>
      _$InterfacesCopyWithImpl<Interfaces>(this as Interfaces, _$identity);

  /// Serializes this Interfaces to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Interfaces &&
            const DeepCollectionEquality()
                .equals(other.interfaces, interfaces) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(interfaces), took);

  @override
  String toString() {
    return 'Interfaces(interfaces: $interfaces, took: $took)';
  }
}

/// @nodoc
abstract mixin class $InterfacesCopyWith<$Res> {
  factory $InterfacesCopyWith(
          Interfaces value, $Res Function(Interfaces) _then) =
      _$InterfacesCopyWithImpl;
  @useResult
  $Res call({List<InterfaceData> interfaces, double took});
}

/// @nodoc
class _$InterfacesCopyWithImpl<$Res> implements $InterfacesCopyWith<$Res> {
  _$InterfacesCopyWithImpl(this._self, this._then);

  final Interfaces _self;
  final $Res Function(Interfaces) _then;

  /// Create a copy of Interfaces
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? interfaces = null,
    Object? took = null,
  }) {
    return _then(_self.copyWith(
      interfaces: null == interfaces
          ? _self.interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<InterfaceData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// Adds pattern-matching-related methods to [Interfaces].
extension InterfacesPatterns on Interfaces {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Interfaces value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Interfaces() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Interfaces value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Interfaces():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Interfaces value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Interfaces() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<InterfaceData> interfaces, double took)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Interfaces() when $default != null:
        return $default(_that.interfaces, _that.took);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<InterfaceData> interfaces, double took) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Interfaces():
        return $default(_that.interfaces, _that.took);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<InterfaceData> interfaces, double took)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Interfaces() when $default != null:
        return $default(_that.interfaces, _that.took);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Interfaces implements Interfaces {
  const _Interfaces(
      {required final List<InterfaceData> interfaces, required this.took})
      : _interfaces = interfaces;
  factory _Interfaces.fromJson(Map<String, dynamic> json) =>
      _$InterfacesFromJson(json);

  final List<InterfaceData> _interfaces;
  @override
  List<InterfaceData> get interfaces {
    if (_interfaces is EqualUnmodifiableListView) return _interfaces;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_interfaces);
  }

  @override
  final double took;

  /// Create a copy of Interfaces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterfacesCopyWith<_Interfaces> get copyWith =>
      __$InterfacesCopyWithImpl<_Interfaces>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterfacesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Interfaces &&
            const DeepCollectionEquality()
                .equals(other._interfaces, _interfaces) &&
            (identical(other.took, took) || other.took == took));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_interfaces), took);

  @override
  String toString() {
    return 'Interfaces(interfaces: $interfaces, took: $took)';
  }
}

/// @nodoc
abstract mixin class _$InterfacesCopyWith<$Res>
    implements $InterfacesCopyWith<$Res> {
  factory _$InterfacesCopyWith(
          _Interfaces value, $Res Function(_Interfaces) _then) =
      __$InterfacesCopyWithImpl;
  @override
  @useResult
  $Res call({List<InterfaceData> interfaces, double took});
}

/// @nodoc
class __$InterfacesCopyWithImpl<$Res> implements _$InterfacesCopyWith<$Res> {
  __$InterfacesCopyWithImpl(this._self, this._then);

  final _Interfaces _self;
  final $Res Function(_Interfaces) _then;

  /// Create a copy of Interfaces
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? interfaces = null,
    Object? took = null,
  }) {
    return _then(_Interfaces(
      interfaces: null == interfaces
          ? _self._interfaces
          : interfaces // ignore: cast_nullable_to_non_nullable
              as List<InterfaceData>,
      took: null == took
          ? _self.took
          : took // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
mixin _$InterfaceData {
  String get name;
  String get type;
  List<String> get flags;
  String get state;
  @JsonKey(name: 'proto_down')
  bool get protoDown;
  String get address;
  String get broadcast;
  bool get carrier;
  InterfaceStats get stats;
  List<InterfaceAddress> get addresses;
  int? get index;
  String? get family;
  int? get speed;
  @JsonKey(name: 'perm_address')
  String? get permAddress;
  String? get ifname;
  int? get txqlen;
  int? get linkmode;
  int? get mtu;
  @JsonKey(name: 'min_mtu')
  int? get minMtu;
  @JsonKey(name: 'max_mtu')
  int? get maxMtu;
  int? get group;
  int? get promiscuity;
  List<int>? get unknown;
  @JsonKey(name: 'num_tx_queues')
  int? get numTxQueues;
  @JsonKey(name: 'num_rx_queues')
  int? get numRxQueues;
  @JsonKey(name: 'gso_max_segs')
  int? get gsoMaxSegs;
  @JsonKey(name: 'gso_max_size')
  int? get gsoMaxSize;
  int? get map;
  @JsonKey(name: 'carrier_changes')
  int? get carrierChanges;
  @JsonKey(name: 'carrier_up_count')
  int? get carrierUpCount;
  @JsonKey(name: 'carrier_down_count')
  int? get carrierDownCount;
  @JsonKey(name: 'link_kind')
  String? get linkKind;
  String? get qdisc;
  @JsonKey(name: 'parent_dev_name')
  String? get parentDevName;
  @JsonKey(name: 'parent_dev_bus_name')
  String? get parentDevBusName;

  /// Create a copy of InterfaceData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterfaceDataCopyWith<InterfaceData> get copyWith =>
      _$InterfaceDataCopyWithImpl<InterfaceData>(
          this as InterfaceData, _$identity);

  /// Serializes this InterfaceData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InterfaceData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.protoDown, protoDown) ||
                other.protoDown == protoDown) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.broadcast, broadcast) ||
                other.broadcast == broadcast) &&
            (identical(other.carrier, carrier) || other.carrier == carrier) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality().equals(other.addresses, addresses) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.permAddress, permAddress) ||
                other.permAddress == permAddress) &&
            (identical(other.ifname, ifname) || other.ifname == ifname) &&
            (identical(other.txqlen, txqlen) || other.txqlen == txqlen) &&
            (identical(other.linkmode, linkmode) ||
                other.linkmode == linkmode) &&
            (identical(other.mtu, mtu) || other.mtu == mtu) &&
            (identical(other.minMtu, minMtu) || other.minMtu == minMtu) &&
            (identical(other.maxMtu, maxMtu) || other.maxMtu == maxMtu) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.promiscuity, promiscuity) ||
                other.promiscuity == promiscuity) &&
            const DeepCollectionEquality().equals(other.unknown, unknown) &&
            (identical(other.numTxQueues, numTxQueues) ||
                other.numTxQueues == numTxQueues) &&
            (identical(other.numRxQueues, numRxQueues) ||
                other.numRxQueues == numRxQueues) &&
            (identical(other.gsoMaxSegs, gsoMaxSegs) ||
                other.gsoMaxSegs == gsoMaxSegs) &&
            (identical(other.gsoMaxSize, gsoMaxSize) ||
                other.gsoMaxSize == gsoMaxSize) &&
            (identical(other.map, map) || other.map == map) &&
            (identical(other.carrierChanges, carrierChanges) ||
                other.carrierChanges == carrierChanges) &&
            (identical(other.carrierUpCount, carrierUpCount) ||
                other.carrierUpCount == carrierUpCount) &&
            (identical(other.carrierDownCount, carrierDownCount) ||
                other.carrierDownCount == carrierDownCount) &&
            (identical(other.linkKind, linkKind) ||
                other.linkKind == linkKind) &&
            (identical(other.qdisc, qdisc) || other.qdisc == qdisc) &&
            (identical(other.parentDevName, parentDevName) ||
                other.parentDevName == parentDevName) &&
            (identical(other.parentDevBusName, parentDevBusName) ||
                other.parentDevBusName == parentDevBusName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        type,
        const DeepCollectionEquality().hash(flags),
        state,
        protoDown,
        address,
        broadcast,
        carrier,
        stats,
        const DeepCollectionEquality().hash(addresses),
        index,
        family,
        speed,
        permAddress,
        ifname,
        txqlen,
        linkmode,
        mtu,
        minMtu,
        maxMtu,
        group,
        promiscuity,
        const DeepCollectionEquality().hash(unknown),
        numTxQueues,
        numRxQueues,
        gsoMaxSegs,
        gsoMaxSize,
        map,
        carrierChanges,
        carrierUpCount,
        carrierDownCount,
        linkKind,
        qdisc,
        parentDevName,
        parentDevBusName
      ]);

  @override
  String toString() {
    return 'InterfaceData(name: $name, type: $type, flags: $flags, state: $state, protoDown: $protoDown, address: $address, broadcast: $broadcast, carrier: $carrier, stats: $stats, addresses: $addresses, index: $index, family: $family, speed: $speed, permAddress: $permAddress, ifname: $ifname, txqlen: $txqlen, linkmode: $linkmode, mtu: $mtu, minMtu: $minMtu, maxMtu: $maxMtu, group: $group, promiscuity: $promiscuity, unknown: $unknown, numTxQueues: $numTxQueues, numRxQueues: $numRxQueues, gsoMaxSegs: $gsoMaxSegs, gsoMaxSize: $gsoMaxSize, map: $map, carrierChanges: $carrierChanges, carrierUpCount: $carrierUpCount, carrierDownCount: $carrierDownCount, linkKind: $linkKind, qdisc: $qdisc, parentDevName: $parentDevName, parentDevBusName: $parentDevBusName)';
  }
}

/// @nodoc
abstract mixin class $InterfaceDataCopyWith<$Res> {
  factory $InterfaceDataCopyWith(
          InterfaceData value, $Res Function(InterfaceData) _then) =
      _$InterfaceDataCopyWithImpl;
  @useResult
  $Res call(
      {String name,
      String type,
      List<String> flags,
      String state,
      @JsonKey(name: 'proto_down') bool protoDown,
      String address,
      String broadcast,
      bool carrier,
      InterfaceStats stats,
      List<InterfaceAddress> addresses,
      int? index,
      String? family,
      int? speed,
      @JsonKey(name: 'perm_address') String? permAddress,
      String? ifname,
      int? txqlen,
      int? linkmode,
      int? mtu,
      @JsonKey(name: 'min_mtu') int? minMtu,
      @JsonKey(name: 'max_mtu') int? maxMtu,
      int? group,
      int? promiscuity,
      List<int>? unknown,
      @JsonKey(name: 'num_tx_queues') int? numTxQueues,
      @JsonKey(name: 'num_rx_queues') int? numRxQueues,
      @JsonKey(name: 'gso_max_segs') int? gsoMaxSegs,
      @JsonKey(name: 'gso_max_size') int? gsoMaxSize,
      int? map,
      @JsonKey(name: 'carrier_changes') int? carrierChanges,
      @JsonKey(name: 'carrier_up_count') int? carrierUpCount,
      @JsonKey(name: 'carrier_down_count') int? carrierDownCount,
      @JsonKey(name: 'link_kind') String? linkKind,
      String? qdisc,
      @JsonKey(name: 'parent_dev_name') String? parentDevName,
      @JsonKey(name: 'parent_dev_bus_name') String? parentDevBusName});

  $InterfaceStatsCopyWith<$Res> get stats;
}

/// @nodoc
class _$InterfaceDataCopyWithImpl<$Res>
    implements $InterfaceDataCopyWith<$Res> {
  _$InterfaceDataCopyWithImpl(this._self, this._then);

  final InterfaceData _self;
  final $Res Function(InterfaceData) _then;

  /// Create a copy of InterfaceData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? flags = null,
    Object? state = null,
    Object? protoDown = null,
    Object? address = null,
    Object? broadcast = null,
    Object? carrier = null,
    Object? stats = null,
    Object? addresses = null,
    Object? index = freezed,
    Object? family = freezed,
    Object? speed = freezed,
    Object? permAddress = freezed,
    Object? ifname = freezed,
    Object? txqlen = freezed,
    Object? linkmode = freezed,
    Object? mtu = freezed,
    Object? minMtu = freezed,
    Object? maxMtu = freezed,
    Object? group = freezed,
    Object? promiscuity = freezed,
    Object? unknown = freezed,
    Object? numTxQueues = freezed,
    Object? numRxQueues = freezed,
    Object? gsoMaxSegs = freezed,
    Object? gsoMaxSize = freezed,
    Object? map = freezed,
    Object? carrierChanges = freezed,
    Object? carrierUpCount = freezed,
    Object? carrierDownCount = freezed,
    Object? linkKind = freezed,
    Object? qdisc = freezed,
    Object? parentDevName = freezed,
    Object? parentDevBusName = freezed,
  }) {
    return _then(_self.copyWith(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      flags: null == flags
          ? _self.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      protoDown: null == protoDown
          ? _self.protoDown
          : protoDown // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      broadcast: null == broadcast
          ? _self.broadcast
          : broadcast // ignore: cast_nullable_to_non_nullable
              as String,
      carrier: null == carrier
          ? _self.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as bool,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as InterfaceStats,
      addresses: null == addresses
          ? _self.addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<InterfaceAddress>,
      index: freezed == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      family: freezed == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int?,
      permAddress: freezed == permAddress
          ? _self.permAddress
          : permAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      ifname: freezed == ifname
          ? _self.ifname
          : ifname // ignore: cast_nullable_to_non_nullable
              as String?,
      txqlen: freezed == txqlen
          ? _self.txqlen
          : txqlen // ignore: cast_nullable_to_non_nullable
              as int?,
      linkmode: freezed == linkmode
          ? _self.linkmode
          : linkmode // ignore: cast_nullable_to_non_nullable
              as int?,
      mtu: freezed == mtu
          ? _self.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int?,
      minMtu: freezed == minMtu
          ? _self.minMtu
          : minMtu // ignore: cast_nullable_to_non_nullable
              as int?,
      maxMtu: freezed == maxMtu
          ? _self.maxMtu
          : maxMtu // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      promiscuity: freezed == promiscuity
          ? _self.promiscuity
          : promiscuity // ignore: cast_nullable_to_non_nullable
              as int?,
      unknown: freezed == unknown
          ? _self.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      numTxQueues: freezed == numTxQueues
          ? _self.numTxQueues
          : numTxQueues // ignore: cast_nullable_to_non_nullable
              as int?,
      numRxQueues: freezed == numRxQueues
          ? _self.numRxQueues
          : numRxQueues // ignore: cast_nullable_to_non_nullable
              as int?,
      gsoMaxSegs: freezed == gsoMaxSegs
          ? _self.gsoMaxSegs
          : gsoMaxSegs // ignore: cast_nullable_to_non_nullable
              as int?,
      gsoMaxSize: freezed == gsoMaxSize
          ? _self.gsoMaxSize
          : gsoMaxSize // ignore: cast_nullable_to_non_nullable
              as int?,
      map: freezed == map
          ? _self.map
          : map // ignore: cast_nullable_to_non_nullable
              as int?,
      carrierChanges: freezed == carrierChanges
          ? _self.carrierChanges
          : carrierChanges // ignore: cast_nullable_to_non_nullable
              as int?,
      carrierUpCount: freezed == carrierUpCount
          ? _self.carrierUpCount
          : carrierUpCount // ignore: cast_nullable_to_non_nullable
              as int?,
      carrierDownCount: freezed == carrierDownCount
          ? _self.carrierDownCount
          : carrierDownCount // ignore: cast_nullable_to_non_nullable
              as int?,
      linkKind: freezed == linkKind
          ? _self.linkKind
          : linkKind // ignore: cast_nullable_to_non_nullable
              as String?,
      qdisc: freezed == qdisc
          ? _self.qdisc
          : qdisc // ignore: cast_nullable_to_non_nullable
              as String?,
      parentDevName: freezed == parentDevName
          ? _self.parentDevName
          : parentDevName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentDevBusName: freezed == parentDevBusName
          ? _self.parentDevBusName
          : parentDevBusName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of InterfaceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InterfaceStatsCopyWith<$Res> get stats {
    return $InterfaceStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InterfaceData].
extension InterfaceDataPatterns on InterfaceData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InterfaceData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InterfaceData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InterfaceData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceData():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InterfaceData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String name,
            String type,
            List<String> flags,
            String state,
            @JsonKey(name: 'proto_down') bool protoDown,
            String address,
            String broadcast,
            bool carrier,
            InterfaceStats stats,
            List<InterfaceAddress> addresses,
            int? index,
            String? family,
            int? speed,
            @JsonKey(name: 'perm_address') String? permAddress,
            String? ifname,
            int? txqlen,
            int? linkmode,
            int? mtu,
            @JsonKey(name: 'min_mtu') int? minMtu,
            @JsonKey(name: 'max_mtu') int? maxMtu,
            int? group,
            int? promiscuity,
            List<int>? unknown,
            @JsonKey(name: 'num_tx_queues') int? numTxQueues,
            @JsonKey(name: 'num_rx_queues') int? numRxQueues,
            @JsonKey(name: 'gso_max_segs') int? gsoMaxSegs,
            @JsonKey(name: 'gso_max_size') int? gsoMaxSize,
            int? map,
            @JsonKey(name: 'carrier_changes') int? carrierChanges,
            @JsonKey(name: 'carrier_up_count') int? carrierUpCount,
            @JsonKey(name: 'carrier_down_count') int? carrierDownCount,
            @JsonKey(name: 'link_kind') String? linkKind,
            String? qdisc,
            @JsonKey(name: 'parent_dev_name') String? parentDevName,
            @JsonKey(name: 'parent_dev_bus_name') String? parentDevBusName)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InterfaceData() when $default != null:
        return $default(
            _that.name,
            _that.type,
            _that.flags,
            _that.state,
            _that.protoDown,
            _that.address,
            _that.broadcast,
            _that.carrier,
            _that.stats,
            _that.addresses,
            _that.index,
            _that.family,
            _that.speed,
            _that.permAddress,
            _that.ifname,
            _that.txqlen,
            _that.linkmode,
            _that.mtu,
            _that.minMtu,
            _that.maxMtu,
            _that.group,
            _that.promiscuity,
            _that.unknown,
            _that.numTxQueues,
            _that.numRxQueues,
            _that.gsoMaxSegs,
            _that.gsoMaxSize,
            _that.map,
            _that.carrierChanges,
            _that.carrierUpCount,
            _that.carrierDownCount,
            _that.linkKind,
            _that.qdisc,
            _that.parentDevName,
            _that.parentDevBusName);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String name,
            String type,
            List<String> flags,
            String state,
            @JsonKey(name: 'proto_down') bool protoDown,
            String address,
            String broadcast,
            bool carrier,
            InterfaceStats stats,
            List<InterfaceAddress> addresses,
            int? index,
            String? family,
            int? speed,
            @JsonKey(name: 'perm_address') String? permAddress,
            String? ifname,
            int? txqlen,
            int? linkmode,
            int? mtu,
            @JsonKey(name: 'min_mtu') int? minMtu,
            @JsonKey(name: 'max_mtu') int? maxMtu,
            int? group,
            int? promiscuity,
            List<int>? unknown,
            @JsonKey(name: 'num_tx_queues') int? numTxQueues,
            @JsonKey(name: 'num_rx_queues') int? numRxQueues,
            @JsonKey(name: 'gso_max_segs') int? gsoMaxSegs,
            @JsonKey(name: 'gso_max_size') int? gsoMaxSize,
            int? map,
            @JsonKey(name: 'carrier_changes') int? carrierChanges,
            @JsonKey(name: 'carrier_up_count') int? carrierUpCount,
            @JsonKey(name: 'carrier_down_count') int? carrierDownCount,
            @JsonKey(name: 'link_kind') String? linkKind,
            String? qdisc,
            @JsonKey(name: 'parent_dev_name') String? parentDevName,
            @JsonKey(name: 'parent_dev_bus_name') String? parentDevBusName)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceData():
        return $default(
            _that.name,
            _that.type,
            _that.flags,
            _that.state,
            _that.protoDown,
            _that.address,
            _that.broadcast,
            _that.carrier,
            _that.stats,
            _that.addresses,
            _that.index,
            _that.family,
            _that.speed,
            _that.permAddress,
            _that.ifname,
            _that.txqlen,
            _that.linkmode,
            _that.mtu,
            _that.minMtu,
            _that.maxMtu,
            _that.group,
            _that.promiscuity,
            _that.unknown,
            _that.numTxQueues,
            _that.numRxQueues,
            _that.gsoMaxSegs,
            _that.gsoMaxSize,
            _that.map,
            _that.carrierChanges,
            _that.carrierUpCount,
            _that.carrierDownCount,
            _that.linkKind,
            _that.qdisc,
            _that.parentDevName,
            _that.parentDevBusName);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String name,
            String type,
            List<String> flags,
            String state,
            @JsonKey(name: 'proto_down') bool protoDown,
            String address,
            String broadcast,
            bool carrier,
            InterfaceStats stats,
            List<InterfaceAddress> addresses,
            int? index,
            String? family,
            int? speed,
            @JsonKey(name: 'perm_address') String? permAddress,
            String? ifname,
            int? txqlen,
            int? linkmode,
            int? mtu,
            @JsonKey(name: 'min_mtu') int? minMtu,
            @JsonKey(name: 'max_mtu') int? maxMtu,
            int? group,
            int? promiscuity,
            List<int>? unknown,
            @JsonKey(name: 'num_tx_queues') int? numTxQueues,
            @JsonKey(name: 'num_rx_queues') int? numRxQueues,
            @JsonKey(name: 'gso_max_segs') int? gsoMaxSegs,
            @JsonKey(name: 'gso_max_size') int? gsoMaxSize,
            int? map,
            @JsonKey(name: 'carrier_changes') int? carrierChanges,
            @JsonKey(name: 'carrier_up_count') int? carrierUpCount,
            @JsonKey(name: 'carrier_down_count') int? carrierDownCount,
            @JsonKey(name: 'link_kind') String? linkKind,
            String? qdisc,
            @JsonKey(name: 'parent_dev_name') String? parentDevName,
            @JsonKey(name: 'parent_dev_bus_name') String? parentDevBusName)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceData() when $default != null:
        return $default(
            _that.name,
            _that.type,
            _that.flags,
            _that.state,
            _that.protoDown,
            _that.address,
            _that.broadcast,
            _that.carrier,
            _that.stats,
            _that.addresses,
            _that.index,
            _that.family,
            _that.speed,
            _that.permAddress,
            _that.ifname,
            _that.txqlen,
            _that.linkmode,
            _that.mtu,
            _that.minMtu,
            _that.maxMtu,
            _that.group,
            _that.promiscuity,
            _that.unknown,
            _that.numTxQueues,
            _that.numRxQueues,
            _that.gsoMaxSegs,
            _that.gsoMaxSize,
            _that.map,
            _that.carrierChanges,
            _that.carrierUpCount,
            _that.carrierDownCount,
            _that.linkKind,
            _that.qdisc,
            _that.parentDevName,
            _that.parentDevBusName);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InterfaceData implements InterfaceData {
  const _InterfaceData(
      {required this.name,
      required this.type,
      required final List<String> flags,
      required this.state,
      @JsonKey(name: 'proto_down') required this.protoDown,
      required this.address,
      required this.broadcast,
      required this.carrier,
      required this.stats,
      required final List<InterfaceAddress> addresses,
      this.index,
      this.family,
      this.speed,
      @JsonKey(name: 'perm_address') this.permAddress,
      this.ifname,
      this.txqlen,
      this.linkmode,
      this.mtu,
      @JsonKey(name: 'min_mtu') this.minMtu,
      @JsonKey(name: 'max_mtu') this.maxMtu,
      this.group,
      this.promiscuity,
      final List<int>? unknown,
      @JsonKey(name: 'num_tx_queues') this.numTxQueues,
      @JsonKey(name: 'num_rx_queues') this.numRxQueues,
      @JsonKey(name: 'gso_max_segs') this.gsoMaxSegs,
      @JsonKey(name: 'gso_max_size') this.gsoMaxSize,
      this.map,
      @JsonKey(name: 'carrier_changes') this.carrierChanges,
      @JsonKey(name: 'carrier_up_count') this.carrierUpCount,
      @JsonKey(name: 'carrier_down_count') this.carrierDownCount,
      @JsonKey(name: 'link_kind') this.linkKind,
      this.qdisc,
      @JsonKey(name: 'parent_dev_name') this.parentDevName,
      @JsonKey(name: 'parent_dev_bus_name') this.parentDevBusName})
      : _flags = flags,
        _addresses = addresses,
        _unknown = unknown;
  factory _InterfaceData.fromJson(Map<String, dynamic> json) =>
      _$InterfaceDataFromJson(json);

  @override
  final String name;
  @override
  final String type;
  final List<String> _flags;
  @override
  List<String> get flags {
    if (_flags is EqualUnmodifiableListView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flags);
  }

  @override
  final String state;
  @override
  @JsonKey(name: 'proto_down')
  final bool protoDown;
  @override
  final String address;
  @override
  final String broadcast;
  @override
  final bool carrier;
  @override
  final InterfaceStats stats;
  final List<InterfaceAddress> _addresses;
  @override
  List<InterfaceAddress> get addresses {
    if (_addresses is EqualUnmodifiableListView) return _addresses;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_addresses);
  }

  @override
  final int? index;
  @override
  final String? family;
  @override
  final int? speed;
  @override
  @JsonKey(name: 'perm_address')
  final String? permAddress;
  @override
  final String? ifname;
  @override
  final int? txqlen;
  @override
  final int? linkmode;
  @override
  final int? mtu;
  @override
  @JsonKey(name: 'min_mtu')
  final int? minMtu;
  @override
  @JsonKey(name: 'max_mtu')
  final int? maxMtu;
  @override
  final int? group;
  @override
  final int? promiscuity;
  final List<int>? _unknown;
  @override
  List<int>? get unknown {
    final value = _unknown;
    if (value == null) return null;
    if (_unknown is EqualUnmodifiableListView) return _unknown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  @JsonKey(name: 'num_tx_queues')
  final int? numTxQueues;
  @override
  @JsonKey(name: 'num_rx_queues')
  final int? numRxQueues;
  @override
  @JsonKey(name: 'gso_max_segs')
  final int? gsoMaxSegs;
  @override
  @JsonKey(name: 'gso_max_size')
  final int? gsoMaxSize;
  @override
  final int? map;
  @override
  @JsonKey(name: 'carrier_changes')
  final int? carrierChanges;
  @override
  @JsonKey(name: 'carrier_up_count')
  final int? carrierUpCount;
  @override
  @JsonKey(name: 'carrier_down_count')
  final int? carrierDownCount;
  @override
  @JsonKey(name: 'link_kind')
  final String? linkKind;
  @override
  final String? qdisc;
  @override
  @JsonKey(name: 'parent_dev_name')
  final String? parentDevName;
  @override
  @JsonKey(name: 'parent_dev_bus_name')
  final String? parentDevBusName;

  /// Create a copy of InterfaceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterfaceDataCopyWith<_InterfaceData> get copyWith =>
      __$InterfaceDataCopyWithImpl<_InterfaceData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterfaceDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InterfaceData &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.protoDown, protoDown) ||
                other.protoDown == protoDown) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.broadcast, broadcast) ||
                other.broadcast == broadcast) &&
            (identical(other.carrier, carrier) || other.carrier == carrier) &&
            (identical(other.stats, stats) || other.stats == stats) &&
            const DeepCollectionEquality()
                .equals(other._addresses, _addresses) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.speed, speed) || other.speed == speed) &&
            (identical(other.permAddress, permAddress) ||
                other.permAddress == permAddress) &&
            (identical(other.ifname, ifname) || other.ifname == ifname) &&
            (identical(other.txqlen, txqlen) || other.txqlen == txqlen) &&
            (identical(other.linkmode, linkmode) ||
                other.linkmode == linkmode) &&
            (identical(other.mtu, mtu) || other.mtu == mtu) &&
            (identical(other.minMtu, minMtu) || other.minMtu == minMtu) &&
            (identical(other.maxMtu, maxMtu) || other.maxMtu == maxMtu) &&
            (identical(other.group, group) || other.group == group) &&
            (identical(other.promiscuity, promiscuity) ||
                other.promiscuity == promiscuity) &&
            const DeepCollectionEquality().equals(other._unknown, _unknown) &&
            (identical(other.numTxQueues, numTxQueues) ||
                other.numTxQueues == numTxQueues) &&
            (identical(other.numRxQueues, numRxQueues) ||
                other.numRxQueues == numRxQueues) &&
            (identical(other.gsoMaxSegs, gsoMaxSegs) ||
                other.gsoMaxSegs == gsoMaxSegs) &&
            (identical(other.gsoMaxSize, gsoMaxSize) ||
                other.gsoMaxSize == gsoMaxSize) &&
            (identical(other.map, map) || other.map == map) &&
            (identical(other.carrierChanges, carrierChanges) ||
                other.carrierChanges == carrierChanges) &&
            (identical(other.carrierUpCount, carrierUpCount) ||
                other.carrierUpCount == carrierUpCount) &&
            (identical(other.carrierDownCount, carrierDownCount) ||
                other.carrierDownCount == carrierDownCount) &&
            (identical(other.linkKind, linkKind) ||
                other.linkKind == linkKind) &&
            (identical(other.qdisc, qdisc) || other.qdisc == qdisc) &&
            (identical(other.parentDevName, parentDevName) ||
                other.parentDevName == parentDevName) &&
            (identical(other.parentDevBusName, parentDevBusName) ||
                other.parentDevBusName == parentDevBusName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        name,
        type,
        const DeepCollectionEquality().hash(_flags),
        state,
        protoDown,
        address,
        broadcast,
        carrier,
        stats,
        const DeepCollectionEquality().hash(_addresses),
        index,
        family,
        speed,
        permAddress,
        ifname,
        txqlen,
        linkmode,
        mtu,
        minMtu,
        maxMtu,
        group,
        promiscuity,
        const DeepCollectionEquality().hash(_unknown),
        numTxQueues,
        numRxQueues,
        gsoMaxSegs,
        gsoMaxSize,
        map,
        carrierChanges,
        carrierUpCount,
        carrierDownCount,
        linkKind,
        qdisc,
        parentDevName,
        parentDevBusName
      ]);

  @override
  String toString() {
    return 'InterfaceData(name: $name, type: $type, flags: $flags, state: $state, protoDown: $protoDown, address: $address, broadcast: $broadcast, carrier: $carrier, stats: $stats, addresses: $addresses, index: $index, family: $family, speed: $speed, permAddress: $permAddress, ifname: $ifname, txqlen: $txqlen, linkmode: $linkmode, mtu: $mtu, minMtu: $minMtu, maxMtu: $maxMtu, group: $group, promiscuity: $promiscuity, unknown: $unknown, numTxQueues: $numTxQueues, numRxQueues: $numRxQueues, gsoMaxSegs: $gsoMaxSegs, gsoMaxSize: $gsoMaxSize, map: $map, carrierChanges: $carrierChanges, carrierUpCount: $carrierUpCount, carrierDownCount: $carrierDownCount, linkKind: $linkKind, qdisc: $qdisc, parentDevName: $parentDevName, parentDevBusName: $parentDevBusName)';
  }
}

/// @nodoc
abstract mixin class _$InterfaceDataCopyWith<$Res>
    implements $InterfaceDataCopyWith<$Res> {
  factory _$InterfaceDataCopyWith(
          _InterfaceData value, $Res Function(_InterfaceData) _then) =
      __$InterfaceDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String name,
      String type,
      List<String> flags,
      String state,
      @JsonKey(name: 'proto_down') bool protoDown,
      String address,
      String broadcast,
      bool carrier,
      InterfaceStats stats,
      List<InterfaceAddress> addresses,
      int? index,
      String? family,
      int? speed,
      @JsonKey(name: 'perm_address') String? permAddress,
      String? ifname,
      int? txqlen,
      int? linkmode,
      int? mtu,
      @JsonKey(name: 'min_mtu') int? minMtu,
      @JsonKey(name: 'max_mtu') int? maxMtu,
      int? group,
      int? promiscuity,
      List<int>? unknown,
      @JsonKey(name: 'num_tx_queues') int? numTxQueues,
      @JsonKey(name: 'num_rx_queues') int? numRxQueues,
      @JsonKey(name: 'gso_max_segs') int? gsoMaxSegs,
      @JsonKey(name: 'gso_max_size') int? gsoMaxSize,
      int? map,
      @JsonKey(name: 'carrier_changes') int? carrierChanges,
      @JsonKey(name: 'carrier_up_count') int? carrierUpCount,
      @JsonKey(name: 'carrier_down_count') int? carrierDownCount,
      @JsonKey(name: 'link_kind') String? linkKind,
      String? qdisc,
      @JsonKey(name: 'parent_dev_name') String? parentDevName,
      @JsonKey(name: 'parent_dev_bus_name') String? parentDevBusName});

  @override
  $InterfaceStatsCopyWith<$Res> get stats;
}

/// @nodoc
class __$InterfaceDataCopyWithImpl<$Res>
    implements _$InterfaceDataCopyWith<$Res> {
  __$InterfaceDataCopyWithImpl(this._self, this._then);

  final _InterfaceData _self;
  final $Res Function(_InterfaceData) _then;

  /// Create a copy of InterfaceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? name = null,
    Object? type = null,
    Object? flags = null,
    Object? state = null,
    Object? protoDown = null,
    Object? address = null,
    Object? broadcast = null,
    Object? carrier = null,
    Object? stats = null,
    Object? addresses = null,
    Object? index = freezed,
    Object? family = freezed,
    Object? speed = freezed,
    Object? permAddress = freezed,
    Object? ifname = freezed,
    Object? txqlen = freezed,
    Object? linkmode = freezed,
    Object? mtu = freezed,
    Object? minMtu = freezed,
    Object? maxMtu = freezed,
    Object? group = freezed,
    Object? promiscuity = freezed,
    Object? unknown = freezed,
    Object? numTxQueues = freezed,
    Object? numRxQueues = freezed,
    Object? gsoMaxSegs = freezed,
    Object? gsoMaxSize = freezed,
    Object? map = freezed,
    Object? carrierChanges = freezed,
    Object? carrierUpCount = freezed,
    Object? carrierDownCount = freezed,
    Object? linkKind = freezed,
    Object? qdisc = freezed,
    Object? parentDevName = freezed,
    Object? parentDevBusName = freezed,
  }) {
    return _then(_InterfaceData(
      name: null == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _self.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      flags: null == flags
          ? _self._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      state: null == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      protoDown: null == protoDown
          ? _self.protoDown
          : protoDown // ignore: cast_nullable_to_non_nullable
              as bool,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      broadcast: null == broadcast
          ? _self.broadcast
          : broadcast // ignore: cast_nullable_to_non_nullable
              as String,
      carrier: null == carrier
          ? _self.carrier
          : carrier // ignore: cast_nullable_to_non_nullable
              as bool,
      stats: null == stats
          ? _self.stats
          : stats // ignore: cast_nullable_to_non_nullable
              as InterfaceStats,
      addresses: null == addresses
          ? _self._addresses
          : addresses // ignore: cast_nullable_to_non_nullable
              as List<InterfaceAddress>,
      index: freezed == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      family: freezed == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as String?,
      speed: freezed == speed
          ? _self.speed
          : speed // ignore: cast_nullable_to_non_nullable
              as int?,
      permAddress: freezed == permAddress
          ? _self.permAddress
          : permAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      ifname: freezed == ifname
          ? _self.ifname
          : ifname // ignore: cast_nullable_to_non_nullable
              as String?,
      txqlen: freezed == txqlen
          ? _self.txqlen
          : txqlen // ignore: cast_nullable_to_non_nullable
              as int?,
      linkmode: freezed == linkmode
          ? _self.linkmode
          : linkmode // ignore: cast_nullable_to_non_nullable
              as int?,
      mtu: freezed == mtu
          ? _self.mtu
          : mtu // ignore: cast_nullable_to_non_nullable
              as int?,
      minMtu: freezed == minMtu
          ? _self.minMtu
          : minMtu // ignore: cast_nullable_to_non_nullable
              as int?,
      maxMtu: freezed == maxMtu
          ? _self.maxMtu
          : maxMtu // ignore: cast_nullable_to_non_nullable
              as int?,
      group: freezed == group
          ? _self.group
          : group // ignore: cast_nullable_to_non_nullable
              as int?,
      promiscuity: freezed == promiscuity
          ? _self.promiscuity
          : promiscuity // ignore: cast_nullable_to_non_nullable
              as int?,
      unknown: freezed == unknown
          ? _self._unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      numTxQueues: freezed == numTxQueues
          ? _self.numTxQueues
          : numTxQueues // ignore: cast_nullable_to_non_nullable
              as int?,
      numRxQueues: freezed == numRxQueues
          ? _self.numRxQueues
          : numRxQueues // ignore: cast_nullable_to_non_nullable
              as int?,
      gsoMaxSegs: freezed == gsoMaxSegs
          ? _self.gsoMaxSegs
          : gsoMaxSegs // ignore: cast_nullable_to_non_nullable
              as int?,
      gsoMaxSize: freezed == gsoMaxSize
          ? _self.gsoMaxSize
          : gsoMaxSize // ignore: cast_nullable_to_non_nullable
              as int?,
      map: freezed == map
          ? _self.map
          : map // ignore: cast_nullable_to_non_nullable
              as int?,
      carrierChanges: freezed == carrierChanges
          ? _self.carrierChanges
          : carrierChanges // ignore: cast_nullable_to_non_nullable
              as int?,
      carrierUpCount: freezed == carrierUpCount
          ? _self.carrierUpCount
          : carrierUpCount // ignore: cast_nullable_to_non_nullable
              as int?,
      carrierDownCount: freezed == carrierDownCount
          ? _self.carrierDownCount
          : carrierDownCount // ignore: cast_nullable_to_non_nullable
              as int?,
      linkKind: freezed == linkKind
          ? _self.linkKind
          : linkKind // ignore: cast_nullable_to_non_nullable
              as String?,
      qdisc: freezed == qdisc
          ? _self.qdisc
          : qdisc // ignore: cast_nullable_to_non_nullable
              as String?,
      parentDevName: freezed == parentDevName
          ? _self.parentDevName
          : parentDevName // ignore: cast_nullable_to_non_nullable
              as String?,
      parentDevBusName: freezed == parentDevBusName
          ? _self.parentDevBusName
          : parentDevBusName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  /// Create a copy of InterfaceData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $InterfaceStatsCopyWith<$Res> get stats {
    return $InterfaceStatsCopyWith<$Res>(_self.stats, (value) {
      return _then(_self.copyWith(stats: value));
    });
  }
}

/// @nodoc
mixin _$InterfaceStats {
  @JsonKey(name: 'rx_bytes')
  ByteValue get rxBytes;
  @JsonKey(name: 'tx_bytes')
  ByteValue get txBytes;
  int get bits;
  @JsonKey(name: 'rx_packets')
  int get rxPackets;
  @JsonKey(name: 'tx_packets')
  int get txPackets;
  @JsonKey(name: 'rx_errors')
  int get rxErrors;
  @JsonKey(name: 'tx_errors')
  int get txErrors;
  @JsonKey(name: 'rx_dropped')
  int get rxDropped;
  @JsonKey(name: 'tx_dropped')
  int get txDropped;
  int get multicast;
  int get collisions;
  @JsonKey(name: 'rx_length_errors')
  int get rxLengthErrors;
  @JsonKey(name: 'rx_over_errors')
  int get rxOverErrors;
  @JsonKey(name: 'rx_crc_errors')
  int get rxCrcErrors;
  @JsonKey(name: 'rx_frame_errors')
  int get rxFrameErrors;
  @JsonKey(name: 'rx_fifo_errors')
  int get rxFifoErrors;
  @JsonKey(name: 'rx_missed_errors')
  int get rxMissedErrors;
  @JsonKey(name: 'tx_aborted_errors')
  int get txAbortedErrors;
  @JsonKey(name: 'tx_carrier_errors')
  int get txCarrierErrors;
  @JsonKey(name: 'tx_fifo_errors')
  int get txFifoErrors;
  @JsonKey(name: 'tx_heartbeat_errors')
  int get txHeartbeatErrors;
  @JsonKey(name: 'tx_window_errors')
  int get txWindowErrors;
  @JsonKey(name: 'rx_compressed')
  int get rxCompressed;
  @JsonKey(name: 'tx_compressed')
  int get txCompressed;
  @JsonKey(name: 'rx_nohandler')
  int get rxNohandler;

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterfaceStatsCopyWith<InterfaceStats> get copyWith =>
      _$InterfaceStatsCopyWithImpl<InterfaceStats>(
          this as InterfaceStats, _$identity);

  /// Serializes this InterfaceStats to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InterfaceStats &&
            (identical(other.rxBytes, rxBytes) || other.rxBytes == rxBytes) &&
            (identical(other.txBytes, txBytes) || other.txBytes == txBytes) &&
            (identical(other.bits, bits) || other.bits == bits) &&
            (identical(other.rxPackets, rxPackets) ||
                other.rxPackets == rxPackets) &&
            (identical(other.txPackets, txPackets) ||
                other.txPackets == txPackets) &&
            (identical(other.rxErrors, rxErrors) ||
                other.rxErrors == rxErrors) &&
            (identical(other.txErrors, txErrors) ||
                other.txErrors == txErrors) &&
            (identical(other.rxDropped, rxDropped) ||
                other.rxDropped == rxDropped) &&
            (identical(other.txDropped, txDropped) ||
                other.txDropped == txDropped) &&
            (identical(other.multicast, multicast) ||
                other.multicast == multicast) &&
            (identical(other.collisions, collisions) ||
                other.collisions == collisions) &&
            (identical(other.rxLengthErrors, rxLengthErrors) ||
                other.rxLengthErrors == rxLengthErrors) &&
            (identical(other.rxOverErrors, rxOverErrors) ||
                other.rxOverErrors == rxOverErrors) &&
            (identical(other.rxCrcErrors, rxCrcErrors) ||
                other.rxCrcErrors == rxCrcErrors) &&
            (identical(other.rxFrameErrors, rxFrameErrors) ||
                other.rxFrameErrors == rxFrameErrors) &&
            (identical(other.rxFifoErrors, rxFifoErrors) ||
                other.rxFifoErrors == rxFifoErrors) &&
            (identical(other.rxMissedErrors, rxMissedErrors) ||
                other.rxMissedErrors == rxMissedErrors) &&
            (identical(other.txAbortedErrors, txAbortedErrors) ||
                other.txAbortedErrors == txAbortedErrors) &&
            (identical(other.txCarrierErrors, txCarrierErrors) ||
                other.txCarrierErrors == txCarrierErrors) &&
            (identical(other.txFifoErrors, txFifoErrors) ||
                other.txFifoErrors == txFifoErrors) &&
            (identical(other.txHeartbeatErrors, txHeartbeatErrors) ||
                other.txHeartbeatErrors == txHeartbeatErrors) &&
            (identical(other.txWindowErrors, txWindowErrors) ||
                other.txWindowErrors == txWindowErrors) &&
            (identical(other.rxCompressed, rxCompressed) ||
                other.rxCompressed == rxCompressed) &&
            (identical(other.txCompressed, txCompressed) ||
                other.txCompressed == txCompressed) &&
            (identical(other.rxNohandler, rxNohandler) ||
                other.rxNohandler == rxNohandler));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        rxBytes,
        txBytes,
        bits,
        rxPackets,
        txPackets,
        rxErrors,
        txErrors,
        rxDropped,
        txDropped,
        multicast,
        collisions,
        rxLengthErrors,
        rxOverErrors,
        rxCrcErrors,
        rxFrameErrors,
        rxFifoErrors,
        rxMissedErrors,
        txAbortedErrors,
        txCarrierErrors,
        txFifoErrors,
        txHeartbeatErrors,
        txWindowErrors,
        rxCompressed,
        txCompressed,
        rxNohandler
      ]);

  @override
  String toString() {
    return 'InterfaceStats(rxBytes: $rxBytes, txBytes: $txBytes, bits: $bits, rxPackets: $rxPackets, txPackets: $txPackets, rxErrors: $rxErrors, txErrors: $txErrors, rxDropped: $rxDropped, txDropped: $txDropped, multicast: $multicast, collisions: $collisions, rxLengthErrors: $rxLengthErrors, rxOverErrors: $rxOverErrors, rxCrcErrors: $rxCrcErrors, rxFrameErrors: $rxFrameErrors, rxFifoErrors: $rxFifoErrors, rxMissedErrors: $rxMissedErrors, txAbortedErrors: $txAbortedErrors, txCarrierErrors: $txCarrierErrors, txFifoErrors: $txFifoErrors, txHeartbeatErrors: $txHeartbeatErrors, txWindowErrors: $txWindowErrors, rxCompressed: $rxCompressed, txCompressed: $txCompressed, rxNohandler: $rxNohandler)';
  }
}

/// @nodoc
abstract mixin class $InterfaceStatsCopyWith<$Res> {
  factory $InterfaceStatsCopyWith(
          InterfaceStats value, $Res Function(InterfaceStats) _then) =
      _$InterfaceStatsCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'rx_bytes') ByteValue rxBytes,
      @JsonKey(name: 'tx_bytes') ByteValue txBytes,
      int bits,
      @JsonKey(name: 'rx_packets') int rxPackets,
      @JsonKey(name: 'tx_packets') int txPackets,
      @JsonKey(name: 'rx_errors') int rxErrors,
      @JsonKey(name: 'tx_errors') int txErrors,
      @JsonKey(name: 'rx_dropped') int rxDropped,
      @JsonKey(name: 'tx_dropped') int txDropped,
      int multicast,
      int collisions,
      @JsonKey(name: 'rx_length_errors') int rxLengthErrors,
      @JsonKey(name: 'rx_over_errors') int rxOverErrors,
      @JsonKey(name: 'rx_crc_errors') int rxCrcErrors,
      @JsonKey(name: 'rx_frame_errors') int rxFrameErrors,
      @JsonKey(name: 'rx_fifo_errors') int rxFifoErrors,
      @JsonKey(name: 'rx_missed_errors') int rxMissedErrors,
      @JsonKey(name: 'tx_aborted_errors') int txAbortedErrors,
      @JsonKey(name: 'tx_carrier_errors') int txCarrierErrors,
      @JsonKey(name: 'tx_fifo_errors') int txFifoErrors,
      @JsonKey(name: 'tx_heartbeat_errors') int txHeartbeatErrors,
      @JsonKey(name: 'tx_window_errors') int txWindowErrors,
      @JsonKey(name: 'rx_compressed') int rxCompressed,
      @JsonKey(name: 'tx_compressed') int txCompressed,
      @JsonKey(name: 'rx_nohandler') int rxNohandler});

  $ByteValueCopyWith<$Res> get rxBytes;
  $ByteValueCopyWith<$Res> get txBytes;
}

/// @nodoc
class _$InterfaceStatsCopyWithImpl<$Res>
    implements $InterfaceStatsCopyWith<$Res> {
  _$InterfaceStatsCopyWithImpl(this._self, this._then);

  final InterfaceStats _self;
  final $Res Function(InterfaceStats) _then;

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? rxBytes = null,
    Object? txBytes = null,
    Object? bits = null,
    Object? rxPackets = null,
    Object? txPackets = null,
    Object? rxErrors = null,
    Object? txErrors = null,
    Object? rxDropped = null,
    Object? txDropped = null,
    Object? multicast = null,
    Object? collisions = null,
    Object? rxLengthErrors = null,
    Object? rxOverErrors = null,
    Object? rxCrcErrors = null,
    Object? rxFrameErrors = null,
    Object? rxFifoErrors = null,
    Object? rxMissedErrors = null,
    Object? txAbortedErrors = null,
    Object? txCarrierErrors = null,
    Object? txFifoErrors = null,
    Object? txHeartbeatErrors = null,
    Object? txWindowErrors = null,
    Object? rxCompressed = null,
    Object? txCompressed = null,
    Object? rxNohandler = null,
  }) {
    return _then(_self.copyWith(
      rxBytes: null == rxBytes
          ? _self.rxBytes
          : rxBytes // ignore: cast_nullable_to_non_nullable
              as ByteValue,
      txBytes: null == txBytes
          ? _self.txBytes
          : txBytes // ignore: cast_nullable_to_non_nullable
              as ByteValue,
      bits: null == bits
          ? _self.bits
          : bits // ignore: cast_nullable_to_non_nullable
              as int,
      rxPackets: null == rxPackets
          ? _self.rxPackets
          : rxPackets // ignore: cast_nullable_to_non_nullable
              as int,
      txPackets: null == txPackets
          ? _self.txPackets
          : txPackets // ignore: cast_nullable_to_non_nullable
              as int,
      rxErrors: null == rxErrors
          ? _self.rxErrors
          : rxErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txErrors: null == txErrors
          ? _self.txErrors
          : txErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxDropped: null == rxDropped
          ? _self.rxDropped
          : rxDropped // ignore: cast_nullable_to_non_nullable
              as int,
      txDropped: null == txDropped
          ? _self.txDropped
          : txDropped // ignore: cast_nullable_to_non_nullable
              as int,
      multicast: null == multicast
          ? _self.multicast
          : multicast // ignore: cast_nullable_to_non_nullable
              as int,
      collisions: null == collisions
          ? _self.collisions
          : collisions // ignore: cast_nullable_to_non_nullable
              as int,
      rxLengthErrors: null == rxLengthErrors
          ? _self.rxLengthErrors
          : rxLengthErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxOverErrors: null == rxOverErrors
          ? _self.rxOverErrors
          : rxOverErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxCrcErrors: null == rxCrcErrors
          ? _self.rxCrcErrors
          : rxCrcErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxFrameErrors: null == rxFrameErrors
          ? _self.rxFrameErrors
          : rxFrameErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxFifoErrors: null == rxFifoErrors
          ? _self.rxFifoErrors
          : rxFifoErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxMissedErrors: null == rxMissedErrors
          ? _self.rxMissedErrors
          : rxMissedErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txAbortedErrors: null == txAbortedErrors
          ? _self.txAbortedErrors
          : txAbortedErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txCarrierErrors: null == txCarrierErrors
          ? _self.txCarrierErrors
          : txCarrierErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txFifoErrors: null == txFifoErrors
          ? _self.txFifoErrors
          : txFifoErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txHeartbeatErrors: null == txHeartbeatErrors
          ? _self.txHeartbeatErrors
          : txHeartbeatErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txWindowErrors: null == txWindowErrors
          ? _self.txWindowErrors
          : txWindowErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxCompressed: null == rxCompressed
          ? _self.rxCompressed
          : rxCompressed // ignore: cast_nullable_to_non_nullable
              as int,
      txCompressed: null == txCompressed
          ? _self.txCompressed
          : txCompressed // ignore: cast_nullable_to_non_nullable
              as int,
      rxNohandler: null == rxNohandler
          ? _self.rxNohandler
          : rxNohandler // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ByteValueCopyWith<$Res> get rxBytes {
    return $ByteValueCopyWith<$Res>(_self.rxBytes, (value) {
      return _then(_self.copyWith(rxBytes: value));
    });
  }

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ByteValueCopyWith<$Res> get txBytes {
    return $ByteValueCopyWith<$Res>(_self.txBytes, (value) {
      return _then(_self.copyWith(txBytes: value));
    });
  }
}

/// Adds pattern-matching-related methods to [InterfaceStats].
extension InterfaceStatsPatterns on InterfaceStats {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InterfaceStats value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InterfaceStats() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InterfaceStats value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceStats():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InterfaceStats value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceStats() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'rx_bytes') ByteValue rxBytes,
            @JsonKey(name: 'tx_bytes') ByteValue txBytes,
            int bits,
            @JsonKey(name: 'rx_packets') int rxPackets,
            @JsonKey(name: 'tx_packets') int txPackets,
            @JsonKey(name: 'rx_errors') int rxErrors,
            @JsonKey(name: 'tx_errors') int txErrors,
            @JsonKey(name: 'rx_dropped') int rxDropped,
            @JsonKey(name: 'tx_dropped') int txDropped,
            int multicast,
            int collisions,
            @JsonKey(name: 'rx_length_errors') int rxLengthErrors,
            @JsonKey(name: 'rx_over_errors') int rxOverErrors,
            @JsonKey(name: 'rx_crc_errors') int rxCrcErrors,
            @JsonKey(name: 'rx_frame_errors') int rxFrameErrors,
            @JsonKey(name: 'rx_fifo_errors') int rxFifoErrors,
            @JsonKey(name: 'rx_missed_errors') int rxMissedErrors,
            @JsonKey(name: 'tx_aborted_errors') int txAbortedErrors,
            @JsonKey(name: 'tx_carrier_errors') int txCarrierErrors,
            @JsonKey(name: 'tx_fifo_errors') int txFifoErrors,
            @JsonKey(name: 'tx_heartbeat_errors') int txHeartbeatErrors,
            @JsonKey(name: 'tx_window_errors') int txWindowErrors,
            @JsonKey(name: 'rx_compressed') int rxCompressed,
            @JsonKey(name: 'tx_compressed') int txCompressed,
            @JsonKey(name: 'rx_nohandler') int rxNohandler)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InterfaceStats() when $default != null:
        return $default(
            _that.rxBytes,
            _that.txBytes,
            _that.bits,
            _that.rxPackets,
            _that.txPackets,
            _that.rxErrors,
            _that.txErrors,
            _that.rxDropped,
            _that.txDropped,
            _that.multicast,
            _that.collisions,
            _that.rxLengthErrors,
            _that.rxOverErrors,
            _that.rxCrcErrors,
            _that.rxFrameErrors,
            _that.rxFifoErrors,
            _that.rxMissedErrors,
            _that.txAbortedErrors,
            _that.txCarrierErrors,
            _that.txFifoErrors,
            _that.txHeartbeatErrors,
            _that.txWindowErrors,
            _that.rxCompressed,
            _that.txCompressed,
            _that.rxNohandler);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'rx_bytes') ByteValue rxBytes,
            @JsonKey(name: 'tx_bytes') ByteValue txBytes,
            int bits,
            @JsonKey(name: 'rx_packets') int rxPackets,
            @JsonKey(name: 'tx_packets') int txPackets,
            @JsonKey(name: 'rx_errors') int rxErrors,
            @JsonKey(name: 'tx_errors') int txErrors,
            @JsonKey(name: 'rx_dropped') int rxDropped,
            @JsonKey(name: 'tx_dropped') int txDropped,
            int multicast,
            int collisions,
            @JsonKey(name: 'rx_length_errors') int rxLengthErrors,
            @JsonKey(name: 'rx_over_errors') int rxOverErrors,
            @JsonKey(name: 'rx_crc_errors') int rxCrcErrors,
            @JsonKey(name: 'rx_frame_errors') int rxFrameErrors,
            @JsonKey(name: 'rx_fifo_errors') int rxFifoErrors,
            @JsonKey(name: 'rx_missed_errors') int rxMissedErrors,
            @JsonKey(name: 'tx_aborted_errors') int txAbortedErrors,
            @JsonKey(name: 'tx_carrier_errors') int txCarrierErrors,
            @JsonKey(name: 'tx_fifo_errors') int txFifoErrors,
            @JsonKey(name: 'tx_heartbeat_errors') int txHeartbeatErrors,
            @JsonKey(name: 'tx_window_errors') int txWindowErrors,
            @JsonKey(name: 'rx_compressed') int rxCompressed,
            @JsonKey(name: 'tx_compressed') int txCompressed,
            @JsonKey(name: 'rx_nohandler') int rxNohandler)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceStats():
        return $default(
            _that.rxBytes,
            _that.txBytes,
            _that.bits,
            _that.rxPackets,
            _that.txPackets,
            _that.rxErrors,
            _that.txErrors,
            _that.rxDropped,
            _that.txDropped,
            _that.multicast,
            _that.collisions,
            _that.rxLengthErrors,
            _that.rxOverErrors,
            _that.rxCrcErrors,
            _that.rxFrameErrors,
            _that.rxFifoErrors,
            _that.rxMissedErrors,
            _that.txAbortedErrors,
            _that.txCarrierErrors,
            _that.txFifoErrors,
            _that.txHeartbeatErrors,
            _that.txWindowErrors,
            _that.rxCompressed,
            _that.txCompressed,
            _that.rxNohandler);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'rx_bytes') ByteValue rxBytes,
            @JsonKey(name: 'tx_bytes') ByteValue txBytes,
            int bits,
            @JsonKey(name: 'rx_packets') int rxPackets,
            @JsonKey(name: 'tx_packets') int txPackets,
            @JsonKey(name: 'rx_errors') int rxErrors,
            @JsonKey(name: 'tx_errors') int txErrors,
            @JsonKey(name: 'rx_dropped') int rxDropped,
            @JsonKey(name: 'tx_dropped') int txDropped,
            int multicast,
            int collisions,
            @JsonKey(name: 'rx_length_errors') int rxLengthErrors,
            @JsonKey(name: 'rx_over_errors') int rxOverErrors,
            @JsonKey(name: 'rx_crc_errors') int rxCrcErrors,
            @JsonKey(name: 'rx_frame_errors') int rxFrameErrors,
            @JsonKey(name: 'rx_fifo_errors') int rxFifoErrors,
            @JsonKey(name: 'rx_missed_errors') int rxMissedErrors,
            @JsonKey(name: 'tx_aborted_errors') int txAbortedErrors,
            @JsonKey(name: 'tx_carrier_errors') int txCarrierErrors,
            @JsonKey(name: 'tx_fifo_errors') int txFifoErrors,
            @JsonKey(name: 'tx_heartbeat_errors') int txHeartbeatErrors,
            @JsonKey(name: 'tx_window_errors') int txWindowErrors,
            @JsonKey(name: 'rx_compressed') int rxCompressed,
            @JsonKey(name: 'tx_compressed') int txCompressed,
            @JsonKey(name: 'rx_nohandler') int rxNohandler)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceStats() when $default != null:
        return $default(
            _that.rxBytes,
            _that.txBytes,
            _that.bits,
            _that.rxPackets,
            _that.txPackets,
            _that.rxErrors,
            _that.txErrors,
            _that.rxDropped,
            _that.txDropped,
            _that.multicast,
            _that.collisions,
            _that.rxLengthErrors,
            _that.rxOverErrors,
            _that.rxCrcErrors,
            _that.rxFrameErrors,
            _that.rxFifoErrors,
            _that.rxMissedErrors,
            _that.txAbortedErrors,
            _that.txCarrierErrors,
            _that.txFifoErrors,
            _that.txHeartbeatErrors,
            _that.txWindowErrors,
            _that.rxCompressed,
            _that.txCompressed,
            _that.rxNohandler);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InterfaceStats implements InterfaceStats {
  const _InterfaceStats(
      {@JsonKey(name: 'rx_bytes') required this.rxBytes,
      @JsonKey(name: 'tx_bytes') required this.txBytes,
      required this.bits,
      @JsonKey(name: 'rx_packets') required this.rxPackets,
      @JsonKey(name: 'tx_packets') required this.txPackets,
      @JsonKey(name: 'rx_errors') required this.rxErrors,
      @JsonKey(name: 'tx_errors') required this.txErrors,
      @JsonKey(name: 'rx_dropped') required this.rxDropped,
      @JsonKey(name: 'tx_dropped') required this.txDropped,
      required this.multicast,
      required this.collisions,
      @JsonKey(name: 'rx_length_errors') required this.rxLengthErrors,
      @JsonKey(name: 'rx_over_errors') required this.rxOverErrors,
      @JsonKey(name: 'rx_crc_errors') required this.rxCrcErrors,
      @JsonKey(name: 'rx_frame_errors') required this.rxFrameErrors,
      @JsonKey(name: 'rx_fifo_errors') required this.rxFifoErrors,
      @JsonKey(name: 'rx_missed_errors') required this.rxMissedErrors,
      @JsonKey(name: 'tx_aborted_errors') required this.txAbortedErrors,
      @JsonKey(name: 'tx_carrier_errors') required this.txCarrierErrors,
      @JsonKey(name: 'tx_fifo_errors') required this.txFifoErrors,
      @JsonKey(name: 'tx_heartbeat_errors') required this.txHeartbeatErrors,
      @JsonKey(name: 'tx_window_errors') required this.txWindowErrors,
      @JsonKey(name: 'rx_compressed') required this.rxCompressed,
      @JsonKey(name: 'tx_compressed') required this.txCompressed,
      @JsonKey(name: 'rx_nohandler') required this.rxNohandler});
  factory _InterfaceStats.fromJson(Map<String, dynamic> json) =>
      _$InterfaceStatsFromJson(json);

  @override
  @JsonKey(name: 'rx_bytes')
  final ByteValue rxBytes;
  @override
  @JsonKey(name: 'tx_bytes')
  final ByteValue txBytes;
  @override
  final int bits;
  @override
  @JsonKey(name: 'rx_packets')
  final int rxPackets;
  @override
  @JsonKey(name: 'tx_packets')
  final int txPackets;
  @override
  @JsonKey(name: 'rx_errors')
  final int rxErrors;
  @override
  @JsonKey(name: 'tx_errors')
  final int txErrors;
  @override
  @JsonKey(name: 'rx_dropped')
  final int rxDropped;
  @override
  @JsonKey(name: 'tx_dropped')
  final int txDropped;
  @override
  final int multicast;
  @override
  final int collisions;
  @override
  @JsonKey(name: 'rx_length_errors')
  final int rxLengthErrors;
  @override
  @JsonKey(name: 'rx_over_errors')
  final int rxOverErrors;
  @override
  @JsonKey(name: 'rx_crc_errors')
  final int rxCrcErrors;
  @override
  @JsonKey(name: 'rx_frame_errors')
  final int rxFrameErrors;
  @override
  @JsonKey(name: 'rx_fifo_errors')
  final int rxFifoErrors;
  @override
  @JsonKey(name: 'rx_missed_errors')
  final int rxMissedErrors;
  @override
  @JsonKey(name: 'tx_aborted_errors')
  final int txAbortedErrors;
  @override
  @JsonKey(name: 'tx_carrier_errors')
  final int txCarrierErrors;
  @override
  @JsonKey(name: 'tx_fifo_errors')
  final int txFifoErrors;
  @override
  @JsonKey(name: 'tx_heartbeat_errors')
  final int txHeartbeatErrors;
  @override
  @JsonKey(name: 'tx_window_errors')
  final int txWindowErrors;
  @override
  @JsonKey(name: 'rx_compressed')
  final int rxCompressed;
  @override
  @JsonKey(name: 'tx_compressed')
  final int txCompressed;
  @override
  @JsonKey(name: 'rx_nohandler')
  final int rxNohandler;

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterfaceStatsCopyWith<_InterfaceStats> get copyWith =>
      __$InterfaceStatsCopyWithImpl<_InterfaceStats>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterfaceStatsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InterfaceStats &&
            (identical(other.rxBytes, rxBytes) || other.rxBytes == rxBytes) &&
            (identical(other.txBytes, txBytes) || other.txBytes == txBytes) &&
            (identical(other.bits, bits) || other.bits == bits) &&
            (identical(other.rxPackets, rxPackets) ||
                other.rxPackets == rxPackets) &&
            (identical(other.txPackets, txPackets) ||
                other.txPackets == txPackets) &&
            (identical(other.rxErrors, rxErrors) ||
                other.rxErrors == rxErrors) &&
            (identical(other.txErrors, txErrors) ||
                other.txErrors == txErrors) &&
            (identical(other.rxDropped, rxDropped) ||
                other.rxDropped == rxDropped) &&
            (identical(other.txDropped, txDropped) ||
                other.txDropped == txDropped) &&
            (identical(other.multicast, multicast) ||
                other.multicast == multicast) &&
            (identical(other.collisions, collisions) ||
                other.collisions == collisions) &&
            (identical(other.rxLengthErrors, rxLengthErrors) ||
                other.rxLengthErrors == rxLengthErrors) &&
            (identical(other.rxOverErrors, rxOverErrors) ||
                other.rxOverErrors == rxOverErrors) &&
            (identical(other.rxCrcErrors, rxCrcErrors) ||
                other.rxCrcErrors == rxCrcErrors) &&
            (identical(other.rxFrameErrors, rxFrameErrors) ||
                other.rxFrameErrors == rxFrameErrors) &&
            (identical(other.rxFifoErrors, rxFifoErrors) ||
                other.rxFifoErrors == rxFifoErrors) &&
            (identical(other.rxMissedErrors, rxMissedErrors) ||
                other.rxMissedErrors == rxMissedErrors) &&
            (identical(other.txAbortedErrors, txAbortedErrors) ||
                other.txAbortedErrors == txAbortedErrors) &&
            (identical(other.txCarrierErrors, txCarrierErrors) ||
                other.txCarrierErrors == txCarrierErrors) &&
            (identical(other.txFifoErrors, txFifoErrors) ||
                other.txFifoErrors == txFifoErrors) &&
            (identical(other.txHeartbeatErrors, txHeartbeatErrors) ||
                other.txHeartbeatErrors == txHeartbeatErrors) &&
            (identical(other.txWindowErrors, txWindowErrors) ||
                other.txWindowErrors == txWindowErrors) &&
            (identical(other.rxCompressed, rxCompressed) ||
                other.rxCompressed == rxCompressed) &&
            (identical(other.txCompressed, txCompressed) ||
                other.txCompressed == txCompressed) &&
            (identical(other.rxNohandler, rxNohandler) ||
                other.rxNohandler == rxNohandler));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        rxBytes,
        txBytes,
        bits,
        rxPackets,
        txPackets,
        rxErrors,
        txErrors,
        rxDropped,
        txDropped,
        multicast,
        collisions,
        rxLengthErrors,
        rxOverErrors,
        rxCrcErrors,
        rxFrameErrors,
        rxFifoErrors,
        rxMissedErrors,
        txAbortedErrors,
        txCarrierErrors,
        txFifoErrors,
        txHeartbeatErrors,
        txWindowErrors,
        rxCompressed,
        txCompressed,
        rxNohandler
      ]);

  @override
  String toString() {
    return 'InterfaceStats(rxBytes: $rxBytes, txBytes: $txBytes, bits: $bits, rxPackets: $rxPackets, txPackets: $txPackets, rxErrors: $rxErrors, txErrors: $txErrors, rxDropped: $rxDropped, txDropped: $txDropped, multicast: $multicast, collisions: $collisions, rxLengthErrors: $rxLengthErrors, rxOverErrors: $rxOverErrors, rxCrcErrors: $rxCrcErrors, rxFrameErrors: $rxFrameErrors, rxFifoErrors: $rxFifoErrors, rxMissedErrors: $rxMissedErrors, txAbortedErrors: $txAbortedErrors, txCarrierErrors: $txCarrierErrors, txFifoErrors: $txFifoErrors, txHeartbeatErrors: $txHeartbeatErrors, txWindowErrors: $txWindowErrors, rxCompressed: $rxCompressed, txCompressed: $txCompressed, rxNohandler: $rxNohandler)';
  }
}

/// @nodoc
abstract mixin class _$InterfaceStatsCopyWith<$Res>
    implements $InterfaceStatsCopyWith<$Res> {
  factory _$InterfaceStatsCopyWith(
          _InterfaceStats value, $Res Function(_InterfaceStats) _then) =
      __$InterfaceStatsCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'rx_bytes') ByteValue rxBytes,
      @JsonKey(name: 'tx_bytes') ByteValue txBytes,
      int bits,
      @JsonKey(name: 'rx_packets') int rxPackets,
      @JsonKey(name: 'tx_packets') int txPackets,
      @JsonKey(name: 'rx_errors') int rxErrors,
      @JsonKey(name: 'tx_errors') int txErrors,
      @JsonKey(name: 'rx_dropped') int rxDropped,
      @JsonKey(name: 'tx_dropped') int txDropped,
      int multicast,
      int collisions,
      @JsonKey(name: 'rx_length_errors') int rxLengthErrors,
      @JsonKey(name: 'rx_over_errors') int rxOverErrors,
      @JsonKey(name: 'rx_crc_errors') int rxCrcErrors,
      @JsonKey(name: 'rx_frame_errors') int rxFrameErrors,
      @JsonKey(name: 'rx_fifo_errors') int rxFifoErrors,
      @JsonKey(name: 'rx_missed_errors') int rxMissedErrors,
      @JsonKey(name: 'tx_aborted_errors') int txAbortedErrors,
      @JsonKey(name: 'tx_carrier_errors') int txCarrierErrors,
      @JsonKey(name: 'tx_fifo_errors') int txFifoErrors,
      @JsonKey(name: 'tx_heartbeat_errors') int txHeartbeatErrors,
      @JsonKey(name: 'tx_window_errors') int txWindowErrors,
      @JsonKey(name: 'rx_compressed') int rxCompressed,
      @JsonKey(name: 'tx_compressed') int txCompressed,
      @JsonKey(name: 'rx_nohandler') int rxNohandler});

  @override
  $ByteValueCopyWith<$Res> get rxBytes;
  @override
  $ByteValueCopyWith<$Res> get txBytes;
}

/// @nodoc
class __$InterfaceStatsCopyWithImpl<$Res>
    implements _$InterfaceStatsCopyWith<$Res> {
  __$InterfaceStatsCopyWithImpl(this._self, this._then);

  final _InterfaceStats _self;
  final $Res Function(_InterfaceStats) _then;

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? rxBytes = null,
    Object? txBytes = null,
    Object? bits = null,
    Object? rxPackets = null,
    Object? txPackets = null,
    Object? rxErrors = null,
    Object? txErrors = null,
    Object? rxDropped = null,
    Object? txDropped = null,
    Object? multicast = null,
    Object? collisions = null,
    Object? rxLengthErrors = null,
    Object? rxOverErrors = null,
    Object? rxCrcErrors = null,
    Object? rxFrameErrors = null,
    Object? rxFifoErrors = null,
    Object? rxMissedErrors = null,
    Object? txAbortedErrors = null,
    Object? txCarrierErrors = null,
    Object? txFifoErrors = null,
    Object? txHeartbeatErrors = null,
    Object? txWindowErrors = null,
    Object? rxCompressed = null,
    Object? txCompressed = null,
    Object? rxNohandler = null,
  }) {
    return _then(_InterfaceStats(
      rxBytes: null == rxBytes
          ? _self.rxBytes
          : rxBytes // ignore: cast_nullable_to_non_nullable
              as ByteValue,
      txBytes: null == txBytes
          ? _self.txBytes
          : txBytes // ignore: cast_nullable_to_non_nullable
              as ByteValue,
      bits: null == bits
          ? _self.bits
          : bits // ignore: cast_nullable_to_non_nullable
              as int,
      rxPackets: null == rxPackets
          ? _self.rxPackets
          : rxPackets // ignore: cast_nullable_to_non_nullable
              as int,
      txPackets: null == txPackets
          ? _self.txPackets
          : txPackets // ignore: cast_nullable_to_non_nullable
              as int,
      rxErrors: null == rxErrors
          ? _self.rxErrors
          : rxErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txErrors: null == txErrors
          ? _self.txErrors
          : txErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxDropped: null == rxDropped
          ? _self.rxDropped
          : rxDropped // ignore: cast_nullable_to_non_nullable
              as int,
      txDropped: null == txDropped
          ? _self.txDropped
          : txDropped // ignore: cast_nullable_to_non_nullable
              as int,
      multicast: null == multicast
          ? _self.multicast
          : multicast // ignore: cast_nullable_to_non_nullable
              as int,
      collisions: null == collisions
          ? _self.collisions
          : collisions // ignore: cast_nullable_to_non_nullable
              as int,
      rxLengthErrors: null == rxLengthErrors
          ? _self.rxLengthErrors
          : rxLengthErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxOverErrors: null == rxOverErrors
          ? _self.rxOverErrors
          : rxOverErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxCrcErrors: null == rxCrcErrors
          ? _self.rxCrcErrors
          : rxCrcErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxFrameErrors: null == rxFrameErrors
          ? _self.rxFrameErrors
          : rxFrameErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxFifoErrors: null == rxFifoErrors
          ? _self.rxFifoErrors
          : rxFifoErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxMissedErrors: null == rxMissedErrors
          ? _self.rxMissedErrors
          : rxMissedErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txAbortedErrors: null == txAbortedErrors
          ? _self.txAbortedErrors
          : txAbortedErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txCarrierErrors: null == txCarrierErrors
          ? _self.txCarrierErrors
          : txCarrierErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txFifoErrors: null == txFifoErrors
          ? _self.txFifoErrors
          : txFifoErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txHeartbeatErrors: null == txHeartbeatErrors
          ? _self.txHeartbeatErrors
          : txHeartbeatErrors // ignore: cast_nullable_to_non_nullable
              as int,
      txWindowErrors: null == txWindowErrors
          ? _self.txWindowErrors
          : txWindowErrors // ignore: cast_nullable_to_non_nullable
              as int,
      rxCompressed: null == rxCompressed
          ? _self.rxCompressed
          : rxCompressed // ignore: cast_nullable_to_non_nullable
              as int,
      txCompressed: null == txCompressed
          ? _self.txCompressed
          : txCompressed // ignore: cast_nullable_to_non_nullable
              as int,
      rxNohandler: null == rxNohandler
          ? _self.rxNohandler
          : rxNohandler // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ByteValueCopyWith<$Res> get rxBytes {
    return $ByteValueCopyWith<$Res>(_self.rxBytes, (value) {
      return _then(_self.copyWith(rxBytes: value));
    });
  }

  /// Create a copy of InterfaceStats
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ByteValueCopyWith<$Res> get txBytes {
    return $ByteValueCopyWith<$Res>(_self.txBytes, (value) {
      return _then(_self.copyWith(txBytes: value));
    });
  }
}

/// @nodoc
mixin _$ByteValue {
  double get value;
  String get unit;

  /// Create a copy of ByteValue
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ByteValueCopyWith<ByteValue> get copyWith =>
      _$ByteValueCopyWithImpl<ByteValue>(this as ByteValue, _$identity);

  /// Serializes this ByteValue to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ByteValue &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  @override
  String toString() {
    return 'ByteValue(value: $value, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class $ByteValueCopyWith<$Res> {
  factory $ByteValueCopyWith(ByteValue value, $Res Function(ByteValue) _then) =
      _$ByteValueCopyWithImpl;
  @useResult
  $Res call({double value, String unit});
}

/// @nodoc
class _$ByteValueCopyWithImpl<$Res> implements $ByteValueCopyWith<$Res> {
  _$ByteValueCopyWithImpl(this._self, this._then);

  final ByteValue _self;
  final $Res Function(ByteValue) _then;

  /// Create a copy of ByteValue
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
    Object? unit = null,
  }) {
    return _then(_self.copyWith(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [ByteValue].
extension ByteValuePatterns on ByteValue {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_ByteValue value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ByteValue() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_ByteValue value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ByteValue():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_ByteValue value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ByteValue() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(double value, String unit)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ByteValue() when $default != null:
        return $default(_that.value, _that.unit);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(double value, String unit) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ByteValue():
        return $default(_that.value, _that.unit);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(double value, String unit)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _ByteValue() when $default != null:
        return $default(_that.value, _that.unit);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _ByteValue implements ByteValue {
  const _ByteValue({required this.value, required this.unit});
  factory _ByteValue.fromJson(Map<String, dynamic> json) =>
      _$ByteValueFromJson(json);

  @override
  final double value;
  @override
  final String unit;

  /// Create a copy of ByteValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ByteValueCopyWith<_ByteValue> get copyWith =>
      __$ByteValueCopyWithImpl<_ByteValue>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ByteValueToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ByteValue &&
            (identical(other.value, value) || other.value == value) &&
            (identical(other.unit, unit) || other.unit == unit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, value, unit);

  @override
  String toString() {
    return 'ByteValue(value: $value, unit: $unit)';
  }
}

/// @nodoc
abstract mixin class _$ByteValueCopyWith<$Res>
    implements $ByteValueCopyWith<$Res> {
  factory _$ByteValueCopyWith(
          _ByteValue value, $Res Function(_ByteValue) _then) =
      __$ByteValueCopyWithImpl;
  @override
  @useResult
  $Res call({double value, String unit});
}

/// @nodoc
class __$ByteValueCopyWithImpl<$Res> implements _$ByteValueCopyWith<$Res> {
  __$ByteValueCopyWithImpl(this._self, this._then);

  final _ByteValue _self;
  final $Res Function(_ByteValue) _then;

  /// Create a copy of ByteValue
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? value = null,
    Object? unit = null,
  }) {
    return _then(_ByteValue(
      value: null == value
          ? _self.value
          : value // ignore: cast_nullable_to_non_nullable
              as double,
      unit: null == unit
          ? _self.unit
          : unit // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$InterfaceAddress {
  String get address;
  @JsonKey(name: 'address_type')
  String get addressType;
  int get index;
  RouteFamily get family; // TODO: string, no conversion
  String get scope;
  List<String> get flags;
  int get prefixlen;
  int get prefered;
  int get valid;
  double get cstamp;
  double get tstamp;
  String? get label;
  String? get local;
  @JsonKey(name: 'local_type')
  String? get localType;
  String? get broadcast;
  @JsonKey(name: 'broadcast_type')
  String? get broadcastType;
  List<int>? get unknown;

  /// Create a copy of InterfaceAddress
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterfaceAddressCopyWith<InterfaceAddress> get copyWith =>
      _$InterfaceAddressCopyWithImpl<InterfaceAddress>(
          this as InterfaceAddress, _$identity);

  /// Serializes this InterfaceAddress to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InterfaceAddress &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            (identical(other.prefixlen, prefixlen) ||
                other.prefixlen == prefixlen) &&
            (identical(other.prefered, prefered) ||
                other.prefered == prefered) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.cstamp, cstamp) || other.cstamp == cstamp) &&
            (identical(other.tstamp, tstamp) || other.tstamp == tstamp) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.localType, localType) ||
                other.localType == localType) &&
            (identical(other.broadcast, broadcast) ||
                other.broadcast == broadcast) &&
            (identical(other.broadcastType, broadcastType) ||
                other.broadcastType == broadcastType) &&
            const DeepCollectionEquality().equals(other.unknown, unknown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      addressType,
      index,
      family,
      scope,
      const DeepCollectionEquality().hash(flags),
      prefixlen,
      prefered,
      valid,
      cstamp,
      tstamp,
      label,
      local,
      localType,
      broadcast,
      broadcastType,
      const DeepCollectionEquality().hash(unknown));

  @override
  String toString() {
    return 'InterfaceAddress(address: $address, addressType: $addressType, index: $index, family: $family, scope: $scope, flags: $flags, prefixlen: $prefixlen, prefered: $prefered, valid: $valid, cstamp: $cstamp, tstamp: $tstamp, label: $label, local: $local, localType: $localType, broadcast: $broadcast, broadcastType: $broadcastType, unknown: $unknown)';
  }
}

/// @nodoc
abstract mixin class $InterfaceAddressCopyWith<$Res> {
  factory $InterfaceAddressCopyWith(
          InterfaceAddress value, $Res Function(InterfaceAddress) _then) =
      _$InterfaceAddressCopyWithImpl;
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'address_type') String addressType,
      int index,
      RouteFamily family,
      String scope,
      List<String> flags,
      int prefixlen,
      int prefered,
      int valid,
      double cstamp,
      double tstamp,
      String? label,
      String? local,
      @JsonKey(name: 'local_type') String? localType,
      String? broadcast,
      @JsonKey(name: 'broadcast_type') String? broadcastType,
      List<int>? unknown});
}

/// @nodoc
class _$InterfaceAddressCopyWithImpl<$Res>
    implements $InterfaceAddressCopyWith<$Res> {
  _$InterfaceAddressCopyWithImpl(this._self, this._then);

  final InterfaceAddress _self;
  final $Res Function(InterfaceAddress) _then;

  /// Create a copy of InterfaceAddress
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
    Object? addressType = null,
    Object? index = null,
    Object? family = null,
    Object? scope = null,
    Object? flags = null,
    Object? prefixlen = null,
    Object? prefered = null,
    Object? valid = null,
    Object? cstamp = null,
    Object? tstamp = null,
    Object? label = freezed,
    Object? local = freezed,
    Object? localType = freezed,
    Object? broadcast = freezed,
    Object? broadcastType = freezed,
    Object? unknown = freezed,
  }) {
    return _then(_self.copyWith(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressType: null == addressType
          ? _self.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      family: null == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as RouteFamily,
      scope: null == scope
          ? _self.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      flags: null == flags
          ? _self.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prefixlen: null == prefixlen
          ? _self.prefixlen
          : prefixlen // ignore: cast_nullable_to_non_nullable
              as int,
      prefered: null == prefered
          ? _self.prefered
          : prefered // ignore: cast_nullable_to_non_nullable
              as int,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as int,
      cstamp: null == cstamp
          ? _self.cstamp
          : cstamp // ignore: cast_nullable_to_non_nullable
              as double,
      tstamp: null == tstamp
          ? _self.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      local: freezed == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as String?,
      localType: freezed == localType
          ? _self.localType
          : localType // ignore: cast_nullable_to_non_nullable
              as String?,
      broadcast: freezed == broadcast
          ? _self.broadcast
          : broadcast // ignore: cast_nullable_to_non_nullable
              as String?,
      broadcastType: freezed == broadcastType
          ? _self.broadcastType
          : broadcastType // ignore: cast_nullable_to_non_nullable
              as String?,
      unknown: freezed == unknown
          ? _self.unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

/// Adds pattern-matching-related methods to [InterfaceAddress].
extension InterfaceAddressPatterns on InterfaceAddress {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_InterfaceAddress value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InterfaceAddress() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_InterfaceAddress value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceAddress():
        return $default(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_InterfaceAddress value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceAddress() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            String address,
            @JsonKey(name: 'address_type') String addressType,
            int index,
            RouteFamily family,
            String scope,
            List<String> flags,
            int prefixlen,
            int prefered,
            int valid,
            double cstamp,
            double tstamp,
            String? label,
            String? local,
            @JsonKey(name: 'local_type') String? localType,
            String? broadcast,
            @JsonKey(name: 'broadcast_type') String? broadcastType,
            List<int>? unknown)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _InterfaceAddress() when $default != null:
        return $default(
            _that.address,
            _that.addressType,
            _that.index,
            _that.family,
            _that.scope,
            _that.flags,
            _that.prefixlen,
            _that.prefered,
            _that.valid,
            _that.cstamp,
            _that.tstamp,
            _that.label,
            _that.local,
            _that.localType,
            _that.broadcast,
            _that.broadcastType,
            _that.unknown);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            String address,
            @JsonKey(name: 'address_type') String addressType,
            int index,
            RouteFamily family,
            String scope,
            List<String> flags,
            int prefixlen,
            int prefered,
            int valid,
            double cstamp,
            double tstamp,
            String? label,
            String? local,
            @JsonKey(name: 'local_type') String? localType,
            String? broadcast,
            @JsonKey(name: 'broadcast_type') String? broadcastType,
            List<int>? unknown)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceAddress():
        return $default(
            _that.address,
            _that.addressType,
            _that.index,
            _that.family,
            _that.scope,
            _that.flags,
            _that.prefixlen,
            _that.prefered,
            _that.valid,
            _that.cstamp,
            _that.tstamp,
            _that.label,
            _that.local,
            _that.localType,
            _that.broadcast,
            _that.broadcastType,
            _that.unknown);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            String address,
            @JsonKey(name: 'address_type') String addressType,
            int index,
            RouteFamily family,
            String scope,
            List<String> flags,
            int prefixlen,
            int prefered,
            int valid,
            double cstamp,
            double tstamp,
            String? label,
            String? local,
            @JsonKey(name: 'local_type') String? localType,
            String? broadcast,
            @JsonKey(name: 'broadcast_type') String? broadcastType,
            List<int>? unknown)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _InterfaceAddress() when $default != null:
        return $default(
            _that.address,
            _that.addressType,
            _that.index,
            _that.family,
            _that.scope,
            _that.flags,
            _that.prefixlen,
            _that.prefered,
            _that.valid,
            _that.cstamp,
            _that.tstamp,
            _that.label,
            _that.local,
            _that.localType,
            _that.broadcast,
            _that.broadcastType,
            _that.unknown);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _InterfaceAddress implements InterfaceAddress {
  const _InterfaceAddress(
      {required this.address,
      @JsonKey(name: 'address_type') required this.addressType,
      required this.index,
      required this.family,
      required this.scope,
      required final List<String> flags,
      required this.prefixlen,
      required this.prefered,
      required this.valid,
      required this.cstamp,
      required this.tstamp,
      this.label,
      this.local,
      @JsonKey(name: 'local_type') this.localType,
      this.broadcast,
      @JsonKey(name: 'broadcast_type') this.broadcastType,
      final List<int>? unknown})
      : _flags = flags,
        _unknown = unknown;
  factory _InterfaceAddress.fromJson(Map<String, dynamic> json) =>
      _$InterfaceAddressFromJson(json);

  @override
  final String address;
  @override
  @JsonKey(name: 'address_type')
  final String addressType;
  @override
  final int index;
  @override
  final RouteFamily family;
// TODO: string, no conversion
  @override
  final String scope;
  final List<String> _flags;
  @override
  List<String> get flags {
    if (_flags is EqualUnmodifiableListView) return _flags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_flags);
  }

  @override
  final int prefixlen;
  @override
  final int prefered;
  @override
  final int valid;
  @override
  final double cstamp;
  @override
  final double tstamp;
  @override
  final String? label;
  @override
  final String? local;
  @override
  @JsonKey(name: 'local_type')
  final String? localType;
  @override
  final String? broadcast;
  @override
  @JsonKey(name: 'broadcast_type')
  final String? broadcastType;
  final List<int>? _unknown;
  @override
  List<int>? get unknown {
    final value = _unknown;
    if (value == null) return null;
    if (_unknown is EqualUnmodifiableListView) return _unknown;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of InterfaceAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterfaceAddressCopyWith<_InterfaceAddress> get copyWith =>
      __$InterfaceAddressCopyWithImpl<_InterfaceAddress>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterfaceAddressToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InterfaceAddress &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.addressType, addressType) ||
                other.addressType == addressType) &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.family, family) || other.family == family) &&
            (identical(other.scope, scope) || other.scope == scope) &&
            const DeepCollectionEquality().equals(other._flags, _flags) &&
            (identical(other.prefixlen, prefixlen) ||
                other.prefixlen == prefixlen) &&
            (identical(other.prefered, prefered) ||
                other.prefered == prefered) &&
            (identical(other.valid, valid) || other.valid == valid) &&
            (identical(other.cstamp, cstamp) || other.cstamp == cstamp) &&
            (identical(other.tstamp, tstamp) || other.tstamp == tstamp) &&
            (identical(other.label, label) || other.label == label) &&
            (identical(other.local, local) || other.local == local) &&
            (identical(other.localType, localType) ||
                other.localType == localType) &&
            (identical(other.broadcast, broadcast) ||
                other.broadcast == broadcast) &&
            (identical(other.broadcastType, broadcastType) ||
                other.broadcastType == broadcastType) &&
            const DeepCollectionEquality().equals(other._unknown, _unknown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      address,
      addressType,
      index,
      family,
      scope,
      const DeepCollectionEquality().hash(_flags),
      prefixlen,
      prefered,
      valid,
      cstamp,
      tstamp,
      label,
      local,
      localType,
      broadcast,
      broadcastType,
      const DeepCollectionEquality().hash(_unknown));

  @override
  String toString() {
    return 'InterfaceAddress(address: $address, addressType: $addressType, index: $index, family: $family, scope: $scope, flags: $flags, prefixlen: $prefixlen, prefered: $prefered, valid: $valid, cstamp: $cstamp, tstamp: $tstamp, label: $label, local: $local, localType: $localType, broadcast: $broadcast, broadcastType: $broadcastType, unknown: $unknown)';
  }
}

/// @nodoc
abstract mixin class _$InterfaceAddressCopyWith<$Res>
    implements $InterfaceAddressCopyWith<$Res> {
  factory _$InterfaceAddressCopyWith(
          _InterfaceAddress value, $Res Function(_InterfaceAddress) _then) =
      __$InterfaceAddressCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String address,
      @JsonKey(name: 'address_type') String addressType,
      int index,
      RouteFamily family,
      String scope,
      List<String> flags,
      int prefixlen,
      int prefered,
      int valid,
      double cstamp,
      double tstamp,
      String? label,
      String? local,
      @JsonKey(name: 'local_type') String? localType,
      String? broadcast,
      @JsonKey(name: 'broadcast_type') String? broadcastType,
      List<int>? unknown});
}

/// @nodoc
class __$InterfaceAddressCopyWithImpl<$Res>
    implements _$InterfaceAddressCopyWith<$Res> {
  __$InterfaceAddressCopyWithImpl(this._self, this._then);

  final _InterfaceAddress _self;
  final $Res Function(_InterfaceAddress) _then;

  /// Create a copy of InterfaceAddress
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
    Object? addressType = null,
    Object? index = null,
    Object? family = null,
    Object? scope = null,
    Object? flags = null,
    Object? prefixlen = null,
    Object? prefered = null,
    Object? valid = null,
    Object? cstamp = null,
    Object? tstamp = null,
    Object? label = freezed,
    Object? local = freezed,
    Object? localType = freezed,
    Object? broadcast = freezed,
    Object? broadcastType = freezed,
    Object? unknown = freezed,
  }) {
    return _then(_InterfaceAddress(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      addressType: null == addressType
          ? _self.addressType
          : addressType // ignore: cast_nullable_to_non_nullable
              as String,
      index: null == index
          ? _self.index
          : index // ignore: cast_nullable_to_non_nullable
              as int,
      family: null == family
          ? _self.family
          : family // ignore: cast_nullable_to_non_nullable
              as RouteFamily,
      scope: null == scope
          ? _self.scope
          : scope // ignore: cast_nullable_to_non_nullable
              as String,
      flags: null == flags
          ? _self._flags
          : flags // ignore: cast_nullable_to_non_nullable
              as List<String>,
      prefixlen: null == prefixlen
          ? _self.prefixlen
          : prefixlen // ignore: cast_nullable_to_non_nullable
              as int,
      prefered: null == prefered
          ? _self.prefered
          : prefered // ignore: cast_nullable_to_non_nullable
              as int,
      valid: null == valid
          ? _self.valid
          : valid // ignore: cast_nullable_to_non_nullable
              as int,
      cstamp: null == cstamp
          ? _self.cstamp
          : cstamp // ignore: cast_nullable_to_non_nullable
              as double,
      tstamp: null == tstamp
          ? _self.tstamp
          : tstamp // ignore: cast_nullable_to_non_nullable
              as double,
      label: freezed == label
          ? _self.label
          : label // ignore: cast_nullable_to_non_nullable
              as String?,
      local: freezed == local
          ? _self.local
          : local // ignore: cast_nullable_to_non_nullable
              as String?,
      localType: freezed == localType
          ? _self.localType
          : localType // ignore: cast_nullable_to_non_nullable
              as String?,
      broadcast: freezed == broadcast
          ? _self.broadcast
          : broadcast // ignore: cast_nullable_to_non_nullable
              as String?,
      broadcastType: freezed == broadcastType
          ? _self.broadcastType
          : broadcastType // ignore: cast_nullable_to_non_nullable
              as String?,
      unknown: freezed == unknown
          ? _self._unknown
          : unknown // ignore: cast_nullable_to_non_nullable
              as List<int>?,
    ));
  }
}

// dart format on

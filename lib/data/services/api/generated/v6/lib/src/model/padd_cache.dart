//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'padd_cache.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PaddCache {
  /// Returns a new [PaddCache] instance.
  PaddCache({

     this.size,

     this.inserted,

     this.evicted,
  });

      /// Total cache size
  @JsonKey(
    
    name: r'size',
    required: false,
    includeIfNull: false,
  )


  final int? size;



      /// Number of inserted cache entries
  @JsonKey(
    
    name: r'inserted',
    required: false,
    includeIfNull: false,
  )


  final int? inserted;



      /// Number of evicted cache entries
  @JsonKey(
    
    name: r'evicted',
    required: false,
    includeIfNull: false,
  )


  final int? evicted;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PaddCache &&
      other.size == size &&
      other.inserted == inserted &&
      other.evicted == evicted;

    @override
    int get hashCode =>
        size.hashCode +
        inserted.hashCode +
        evicted.hashCode;

  factory PaddCache.fromJson(Map<String, dynamic> json) => _$PaddCacheFromJson(json);

  Map<String, dynamic> toJson() => _$PaddCacheToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


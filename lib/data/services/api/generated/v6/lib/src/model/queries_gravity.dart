//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries_gravity.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueriesGravity {
  /// Returns a new [QueriesGravity] instance.
  QueriesGravity({

     this.domainsBeingBlocked,

     this.lastUpdate,
  });

      /// Number of domain on your Pi-hole's gravity list
  @JsonKey(
    
    name: r'domains_being_blocked',
    required: false,
    includeIfNull: false,
  )


  final int? domainsBeingBlocked;



      /// Unix timestamp of last gravity update (may be `0` if unknown)
  @JsonKey(
    
    name: r'last_update',
    required: false,
    includeIfNull: false,
  )


  final int? lastUpdate;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueriesGravity &&
      other.domainsBeingBlocked == domainsBeingBlocked &&
      other.lastUpdate == lastUpdate;

    @override
    int get hashCode =>
        domainsBeingBlocked.hashCode +
        lastUpdate.hashCode;

  factory QueriesGravity.fromJson(Map<String, dynamic> json) => _$QueriesGravityFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesGravityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


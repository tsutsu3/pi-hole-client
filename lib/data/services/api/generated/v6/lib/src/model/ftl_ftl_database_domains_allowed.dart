//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_database_domains_allowed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDatabaseDomainsAllowed {
  /// Returns a new [FtlFtlDatabaseDomainsAllowed] instance.
  FtlFtlDatabaseDomainsAllowed({

     this.total,

     this.enabled,
  });

      /// Number of allowed domains (total)
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Number of allowed domains (enabled)
  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final int? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDatabaseDomainsAllowed &&
      other.total == total &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        total.hashCode +
        enabled.hashCode;

  factory FtlFtlDatabaseDomainsAllowed.fromJson(Map<String, dynamic> json) => _$FtlFtlDatabaseDomainsAllowedFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDatabaseDomainsAllowedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


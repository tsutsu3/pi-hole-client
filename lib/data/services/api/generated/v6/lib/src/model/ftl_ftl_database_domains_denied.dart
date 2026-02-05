//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_database_domains_denied.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDatabaseDomainsDenied {
  /// Returns a new [FtlFtlDatabaseDomainsDenied] instance.
  FtlFtlDatabaseDomainsDenied({

     this.total,

     this.enabled,
  });

      /// Number of denied domains (total)
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Number of denied domains (enabled)
  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final int? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDatabaseDomainsDenied &&
      other.total == total &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        total.hashCode +
        enabled.hashCode;

  factory FtlFtlDatabaseDomainsDenied.fromJson(Map<String, dynamic> json) => _$FtlFtlDatabaseDomainsDeniedFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDatabaseDomainsDeniedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


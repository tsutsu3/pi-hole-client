//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_database_regex_allowed.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDatabaseRegexAllowed {
  /// Returns a new [FtlFtlDatabaseRegexAllowed] instance.
  FtlFtlDatabaseRegexAllowed({

     this.total,

     this.enabled,
  });

      /// Number of allowed regex filters (total)
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Number of allowed regex filters (enabled)
  @JsonKey(
    
    name: r'enabled',
    required: false,
    includeIfNull: false,
  )


  final int? enabled;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDatabaseRegexAllowed &&
      other.total == total &&
      other.enabled == enabled;

    @override
    int get hashCode =>
        total.hashCode +
        enabled.hashCode;

  factory FtlFtlDatabaseRegexAllowed.fromJson(Map<String, dynamic> json) => _$FtlFtlDatabaseRegexAllowedFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDatabaseRegexAllowedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/ftl_ftl_database_regex_denied.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_regex_allowed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_database_regex.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDatabaseRegex {
  /// Returns a new [FtlFtlDatabaseRegex] instance.
  FtlFtlDatabaseRegex({

     this.allowed,

     this.denied,
  });

  @JsonKey(
    
    name: r'allowed',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabaseRegexAllowed? allowed;



  @JsonKey(
    
    name: r'denied',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabaseRegexDenied? denied;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDatabaseRegex &&
      other.allowed == allowed &&
      other.denied == denied;

    @override
    int get hashCode =>
        allowed.hashCode +
        denied.hashCode;

  factory FtlFtlDatabaseRegex.fromJson(Map<String, dynamic> json) => _$FtlFtlDatabaseRegexFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDatabaseRegexToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


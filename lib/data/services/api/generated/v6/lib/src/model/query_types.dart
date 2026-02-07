//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/query_types_types.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'query_types.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueryTypes {
  /// Returns a new [QueryTypes] instance.
  QueryTypes({

     this.types,
  });

  @JsonKey(
    
    name: r'types',
    required: false,
    includeIfNull: false,
  )


  final QueryTypesTypes? types;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueryTypes &&
      other.types == types;

    @override
    int get hashCode =>
        types.hashCode;

  factory QueryTypes.fromJson(Map<String, dynamic> json) => _$QueryTypesFromJson(json);

  Map<String, dynamic> toJson() => _$QueryTypesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


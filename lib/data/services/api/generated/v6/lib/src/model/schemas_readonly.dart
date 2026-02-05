//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_readonly.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasReadonly {
  /// Returns a new [SchemasReadonly] instance.
  SchemasReadonly({

     this.id,

     this.dateAdded,

     this.dateModified,
  });

      /// Database ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of item addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last item modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasReadonly &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified;

    @override
    int get hashCode =>
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode;

  factory SchemasReadonly.fromJson(Map<String, dynamic> json) => _$SchemasReadonlyFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasReadonlyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


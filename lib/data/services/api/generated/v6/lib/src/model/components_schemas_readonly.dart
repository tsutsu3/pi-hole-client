//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'components_schemas_readonly.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ComponentsSchemasReadonly {
  /// Returns a new [ComponentsSchemasReadonly] instance.
  ComponentsSchemasReadonly({

     this.id,

     this.dateAdded,

     this.dateModified,

     this.name,
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



      /// hostname (only if available)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ComponentsSchemasReadonly &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified &&
      other.name == name;

    @override
    int get hashCode =>
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode +
        (name == null ? 0 : name.hashCode);

  factory ComponentsSchemasReadonly.fromJson(Map<String, dynamic> json) => _$ComponentsSchemasReadonlyFromJson(json);

  Map<String, dynamic> toJson() => _$ComponentsSchemasReadonlyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


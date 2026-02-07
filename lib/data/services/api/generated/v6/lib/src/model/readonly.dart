//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'readonly.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Readonly {
  /// Returns a new [Readonly] instance.
  Readonly({

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



      /// Unix timestamp of domain addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last domain modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Readonly &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified;

    @override
    int get hashCode =>
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode;

  factory Readonly.fromJson(Map<String, dynamic> json) => _$ReadonlyFromJson(json);

  Map<String, dynamic> toJson() => _$ReadonlyToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


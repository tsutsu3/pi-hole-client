//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/lists_get_lists_inner.dart';
import 'package:pihole_v6_api/src/model/lists_components_schemas_lists_processed_processed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'replace_lists200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ReplaceLists200Response {
  /// Returns a new [ReplaceLists200Response] instance.
  ReplaceLists200Response({

     this.lists,

     this.processed,

     this.took,
  });

      /// Array of lists
  @JsonKey(
    
    name: r'lists',
    required: false,
    includeIfNull: false,
  )


  final List<ListsGetListsInner>? lists;



  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final ListsComponentsSchemasListsProcessedProcessed? processed;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ReplaceLists200Response &&
      other.lists == lists &&
      other.processed == processed &&
      other.took == took;

    @override
    int get hashCode =>
        lists.hashCode +
        (processed == null ? 0 : processed.hashCode) +
        took.hashCode;

  factory ReplaceLists200Response.fromJson(Map<String, dynamic> json) => _$ReplaceLists200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ReplaceLists200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


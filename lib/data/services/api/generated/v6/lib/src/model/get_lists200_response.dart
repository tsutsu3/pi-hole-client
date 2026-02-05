//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/lists_get_lists_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_lists200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetLists200Response {
  /// Returns a new [GetLists200Response] instance.
  GetLists200Response({

     this.lists,

     this.took,
  });

      /// Array of lists
  @JsonKey(
    
    name: r'lists',
    required: false,
    includeIfNull: false,
  )


  final List<ListsGetListsInner>? lists;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetLists200Response &&
      other.lists == lists &&
      other.took == took;

    @override
    int get hashCode =>
        lists.hashCode +
        took.hashCode;

  factory GetLists200Response.fromJson(Map<String, dynamic> json) => _$GetLists200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetLists200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


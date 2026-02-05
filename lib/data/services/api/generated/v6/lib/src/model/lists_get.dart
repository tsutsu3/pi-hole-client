//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/lists_get_lists_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'lists_get.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ListsGet {
  /// Returns a new [ListsGet] instance.
  ListsGet({

     this.lists,
  });

      /// Array of lists
  @JsonKey(
    
    name: r'lists',
    required: false,
    includeIfNull: false,
  )


  final List<ListsGetListsInner>? lists;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ListsGet &&
      other.lists == lists;

    @override
    int get hashCode =>
        lists.hashCode;

  factory ListsGet.fromJson(Map<String, dynamic> json) => _$ListsGetFromJson(json);

  Map<String, dynamic> toJson() => _$ListsGetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


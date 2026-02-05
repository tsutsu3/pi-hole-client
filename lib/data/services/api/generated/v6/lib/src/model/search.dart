//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/search_search.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Search {
  /// Returns a new [Search] instance.
  Search({

     this.search,
  });

  @JsonKey(
    
    name: r'search',
    required: false,
    includeIfNull: false,
  )


  final SearchSearch? search;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Search &&
      other.search == search;

    @override
    int get hashCode =>
        search.hashCode;

  factory Search.fromJson(Map<String, dynamic> json) => _$SearchFromJson(json);

  Map<String, dynamic> toJson() => _$SearchToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


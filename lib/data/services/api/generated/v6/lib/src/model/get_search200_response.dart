//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/search_search.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_search200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetSearch200Response {
  /// Returns a new [GetSearch200Response] instance.
  GetSearch200Response({

     this.search,

     this.took,
  });

  @JsonKey(
    
    name: r'search',
    required: false,
    includeIfNull: false,
  )


  final SearchSearch? search;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetSearch200Response &&
      other.search == search &&
      other.took == took;

    @override
    int get hashCode =>
        search.hashCode +
        took.hashCode;

  factory GetSearch200Response.fromJson(Map<String, dynamic> json) => _$GetSearch200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSearch200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


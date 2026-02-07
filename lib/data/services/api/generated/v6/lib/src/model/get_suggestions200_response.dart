//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/suggestions_suggestions.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_suggestions200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetSuggestions200Response {
  /// Returns a new [GetSuggestions200Response] instance.
  GetSuggestions200Response({

     this.suggestions,

     this.took,
  });

  @JsonKey(
    
    name: r'suggestions',
    required: false,
    includeIfNull: false,
  )


  final SuggestionsSuggestions? suggestions;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetSuggestions200Response &&
      other.suggestions == suggestions &&
      other.took == took;

    @override
    int get hashCode =>
        suggestions.hashCode +
        took.hashCode;

  factory GetSuggestions200Response.fromJson(Map<String, dynamic> json) => _$GetSuggestions200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSuggestions200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


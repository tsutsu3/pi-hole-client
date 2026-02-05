//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/suggestions_suggestions.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggestions.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Suggestions {
  /// Returns a new [Suggestions] instance.
  Suggestions({

     this.suggestions,
  });

  @JsonKey(
    
    name: r'suggestions',
    required: false,
    includeIfNull: false,
  )


  final SuggestionsSuggestions? suggestions;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Suggestions &&
      other.suggestions == suggestions;

    @override
    int get hashCode =>
        suggestions.hashCode;

  factory Suggestions.fromJson(Map<String, dynamic> json) => _$SuggestionsFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


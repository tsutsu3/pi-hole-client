//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'search_search_results_gravity.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SearchSearchResultsGravity {
  /// Returns a new [SearchSearchResultsGravity] instance.
  SearchSearchResultsGravity({

     this.allow,

     this.block,
  });

      /// Number of allow matches (antigravity)
  @JsonKey(
    
    name: r'allow',
    required: false,
    includeIfNull: false,
  )


  final int? allow;



      /// Number of block matches (gravity)
  @JsonKey(
    
    name: r'block',
    required: false,
    includeIfNull: false,
  )


  final int? block;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SearchSearchResultsGravity &&
      other.allow == allow &&
      other.block == block;

    @override
    int get hashCode =>
        allow.hashCode +
        block.hashCode;

  factory SearchSearchResultsGravity.fromJson(Map<String, dynamic> json) => _$SearchSearchResultsGravityFromJson(json);

  Map<String, dynamic> toJson() => _$SearchSearchResultsGravityToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


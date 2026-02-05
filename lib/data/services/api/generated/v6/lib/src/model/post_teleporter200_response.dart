//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'post_teleporter200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class PostTeleporter200Response {
  /// Returns a new [PostTeleporter200Response] instance.
  PostTeleporter200Response({

     this.processed,

     this.took,
  });

  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final List<String>? processed;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is PostTeleporter200Response &&
      other.processed == processed &&
      other.took == took;

    @override
    int get hashCode =>
        processed.hashCode +
        took.hashCode;

  factory PostTeleporter200Response.fromJson(Map<String, dynamic> json) => _$PostTeleporter200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PostTeleporter200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/forbidden_error.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_flushnetwork403_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionFlushnetwork403Response {
  /// Returns a new [ActionFlushnetwork403Response] instance.
  ActionFlushnetwork403Response({

     this.error,

     this.took,
  });

  @JsonKey(
    
    name: r'error',
    required: false,
    includeIfNull: false,
  )


  final ForbiddenError? error;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActionFlushnetwork403Response &&
      other.error == error &&
      other.took == took;

    @override
    int get hashCode =>
        error.hashCode +
        took.hashCode;

  factory ActionFlushnetwork403Response.fromJson(Map<String, dynamic> json) => _$ActionFlushnetwork403ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActionFlushnetwork403ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


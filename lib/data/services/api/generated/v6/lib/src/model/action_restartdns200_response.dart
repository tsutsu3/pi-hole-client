//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'action_restartdns200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ActionRestartdns200Response {
  /// Returns a new [ActionRestartdns200Response] instance.
  ActionRestartdns200Response({

     this.status,

     this.took,
  });

      /// Key indicating the status of the request
  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final String? status;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ActionRestartdns200Response &&
      other.status == status &&
      other.took == took;

    @override
    int get hashCode =>
        status.hashCode +
        took.hashCode;

  factory ActionRestartdns200Response.fromJson(Map<String, dynamic> json) => _$ActionRestartdns200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ActionRestartdns200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


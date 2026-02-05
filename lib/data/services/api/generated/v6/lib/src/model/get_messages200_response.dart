//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/messages_messages_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_messages200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMessages200Response {
  /// Returns a new [GetMessages200Response] instance.
  GetMessages200Response({

     this.messages,

     this.took,
  });

  @JsonKey(
    
    name: r'messages',
    required: false,
    includeIfNull: false,
  )


  final List<MessagesMessagesInner>? messages;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMessages200Response &&
      other.messages == messages &&
      other.took == took;

    @override
    int get hashCode =>
        messages.hashCode +
        took.hashCode;

  factory GetMessages200Response.fromJson(Map<String, dynamic> json) => _$GetMessages200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessages200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


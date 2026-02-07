//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_messages_count200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetMessagesCount200Response {
  /// Returns a new [GetMessagesCount200Response] instance.
  GetMessagesCount200Response({

     this.count,

     this.took,
  });

      /// Number of items
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetMessagesCount200Response &&
      other.count == count &&
      other.took == took;

    @override
    int get hashCode =>
        count.hashCode +
        took.hashCode;

  factory GetMessagesCount200Response.fromJson(Map<String, dynamic> json) => _$GetMessagesCount200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetMessagesCount200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


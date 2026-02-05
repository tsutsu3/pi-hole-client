//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages_messages_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class MessagesMessagesInner {
  /// Returns a new [MessagesMessagesInner] instance.
  MessagesMessagesInner({

     this.id,

     this.timestamp,

     this.type,

     this.plain,

     this.html,
  });

      /// ID of message
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of message
  @JsonKey(
    
    name: r'timestamp',
    required: false,
    includeIfNull: false,
  )


  final num? timestamp;



      /// Message type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Plain message
  @JsonKey(
    
    name: r'plain',
    required: false,
    includeIfNull: false,
  )


  final String? plain;



      /// HTML-formatted message
  @JsonKey(
    
    name: r'html',
    required: false,
    includeIfNull: false,
  )


  final String? html;





    @override
    bool operator ==(Object other) => identical(this, other) || other is MessagesMessagesInner &&
      other.id == id &&
      other.timestamp == timestamp &&
      other.type == type &&
      other.plain == plain &&
      other.html == html;

    @override
    int get hashCode =>
        id.hashCode +
        timestamp.hashCode +
        type.hashCode +
        plain.hashCode +
        html.hashCode;

  factory MessagesMessagesInner.fromJson(Map<String, dynamic> json) => _$MessagesMessagesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesMessagesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


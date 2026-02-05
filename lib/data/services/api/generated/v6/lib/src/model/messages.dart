//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/messages_messages_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'messages.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Messages {
  /// Returns a new [Messages] instance.
  Messages({

     this.messages,
  });

  @JsonKey(
    
    name: r'messages',
    required: false,
    includeIfNull: false,
  )


  final List<MessagesMessagesInner>? messages;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Messages &&
      other.messages == messages;

    @override
    int get hashCode =>
        messages.hashCode;

  factory Messages.fromJson(Map<String, dynamic> json) => _$MessagesFromJson(json);

  Map<String, dynamic> toJson() => _$MessagesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


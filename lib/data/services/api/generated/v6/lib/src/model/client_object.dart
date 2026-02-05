//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_object.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientObject {
  /// Returns a new [ClientObject] instance.
  ClientObject({

     this.client,
  });

      /// client IP / MAC / hostname / interface
  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  )


  final String? client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientObject &&
      other.client == client;

    @override
    int get hashCode =>
        client.hashCode;

  factory ClientObject.fromJson(Map<String, dynamic> json) => _$ClientObjectFromJson(json);

  Map<String, dynamic> toJson() => _$ClientObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_maybe_array.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientMaybeArray {
  /// Returns a new [ClientMaybeArray] instance.
  ClientMaybeArray({

     this.client,
  });

  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? client;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientMaybeArray &&
      other.client == client;

    @override
    int get hashCode =>
        client.hashCode;

  factory ClientMaybeArray.fromJson(Map<String, dynamic> json) => _$ClientMaybeArrayFromJson(json);

  Map<String, dynamic> toJson() => _$ClientMaybeArrayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


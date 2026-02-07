//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/totp_totp.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'totp.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Totp {
  /// Returns a new [Totp] instance.
  Totp({

     this.totp,
  });

  @JsonKey(
    
    name: r'totp',
    required: false,
    includeIfNull: false,
  )


  final TotpTotp? totp;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Totp &&
      other.totp == totp;

    @override
    int get hashCode =>
        totp.hashCode;

  factory Totp.fromJson(Map<String, dynamic> json) => _$TotpFromJson(json);

  Map<String, dynamic> toJson() => _$TotpToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


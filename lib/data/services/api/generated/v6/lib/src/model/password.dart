//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'password.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Password {
  /// Returns a new [Password] instance.
  Password({

     this.password,
  });

      /// Password to be used for login
  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Password &&
      other.password == password;

    @override
    int get hashCode =>
        password.hashCode;

  factory Password.fromJson(Map<String, dynamic> json) => _$PasswordFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


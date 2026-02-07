//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app_app.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AppApp {
  /// Returns a new [AppApp] instance.
  AppApp({

     this.password,

     this.hash,
  });

  @JsonKey(
    
    name: r'password',
    required: false,
    includeIfNull: false,
  )


  final String? password;



  @JsonKey(
    
    name: r'hash',
    required: false,
    includeIfNull: false,
  )


  final String? hash;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AppApp &&
      other.password == password &&
      other.hash == hash;

    @override
    int get hashCode =>
        password.hashCode +
        hash.hashCode;

  factory AppApp.fromJson(Map<String, dynamic> json) => _$AppAppFromJson(json);

  Map<String, dynamic> toJson() => _$AppAppToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


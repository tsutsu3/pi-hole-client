//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'config_config_webserver_interface.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ConfigConfigWebserverInterface {
  /// Returns a new [ConfigConfigWebserverInterface] instance.
  ConfigConfigWebserverInterface({

     this.boxed,

     this.theme,
  });

  @JsonKey(
    
    name: r'boxed',
    required: false,
    includeIfNull: false,
  )


  final bool? boxed;



  @JsonKey(
    
    name: r'theme',
    required: false,
    includeIfNull: false,
  )


  final String? theme;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ConfigConfigWebserverInterface &&
      other.boxed == boxed &&
      other.theme == theme;

    @override
    int get hashCode =>
        boxed.hashCode +
        theme.hashCode;

  factory ConfigConfigWebserverInterface.fromJson(Map<String, dynamic> json) => _$ConfigConfigWebserverInterfaceFromJson(json);

  Map<String, dynamic> toJson() => _$ConfigConfigWebserverInterfaceToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


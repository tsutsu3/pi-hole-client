//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/app_app.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'app.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class App {
  /// Returns a new [App] instance.
  App({

     this.app,
  });

  @JsonKey(
    
    name: r'app',
    required: false,
    includeIfNull: false,
  )


  final AppApp? app;





    @override
    bool operator ==(Object other) => identical(this, other) || other is App &&
      other.app == app;

    @override
    int get hashCode =>
        app.hashCode;

  factory App.fromJson(Map<String, dynamic> json) => _$AppFromJson(json);

  Map<String, dynamic> toJson() => _$AppToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


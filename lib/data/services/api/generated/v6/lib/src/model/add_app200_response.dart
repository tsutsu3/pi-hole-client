//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/app_app.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_app200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddApp200Response {
  /// Returns a new [AddApp200Response] instance.
  AddApp200Response({

     this.app,

     this.took,
  });

  @JsonKey(
    
    name: r'app',
    required: false,
    includeIfNull: false,
  )


  final AppApp? app;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddApp200Response &&
      other.app == app &&
      other.took == took;

    @override
    int get hashCode =>
        app.hashCode +
        took.hashCode;

  factory AddApp200Response.fromJson(Map<String, dynamic> json) => _$AddApp200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddApp200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


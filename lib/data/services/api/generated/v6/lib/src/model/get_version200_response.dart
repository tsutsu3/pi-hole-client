//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/version_version.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_version200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetVersion200Response {
  /// Returns a new [GetVersion200Response] instance.
  GetVersion200Response({

     this.version,

     this.took,
  });

  @JsonKey(
    
    name: r'version',
    required: false,
    includeIfNull: false,
  )


  final VersionVersion? version;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetVersion200Response &&
      other.version == version &&
      other.took == took;

    @override
    int get hashCode =>
        version.hashCode +
        took.hashCode;

  factory GetVersion200Response.fromJson(Map<String, dynamic> json) => _$GetVersion200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetVersion200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


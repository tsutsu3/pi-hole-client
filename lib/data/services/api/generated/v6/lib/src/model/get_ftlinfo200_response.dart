//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/ftl_ftl.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_ftlinfo200_response.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class GetFtlinfo200Response {
  /// Returns a new [GetFtlinfo200Response] instance.
  GetFtlinfo200Response({

     this.ftl,

     this.took,
  });

  @JsonKey(
    
    name: r'ftl',
    required: false,
    includeIfNull: false,
  )


  final FtlFtl? ftl;



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is GetFtlinfo200Response &&
      other.ftl == ftl &&
      other.took == took;

    @override
    int get hashCode =>
        ftl.hashCode +
        took.hashCode;

  factory GetFtlinfo200Response.fromJson(Map<String, dynamic> json) => _$GetFtlinfo200ResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetFtlinfo200ResponseToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


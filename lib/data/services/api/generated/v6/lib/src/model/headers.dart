//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/headers_headers_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headers.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Headers {
  /// Returns a new [Headers] instance.
  Headers({

     this.headers,
  });

      /// Request headers
  @JsonKey(
    
    name: r'headers',
    required: false,
    includeIfNull: false,
  )


  final List<HeadersHeadersInner>? headers;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Headers &&
      other.headers == headers;

    @override
    int get hashCode =>
        headers.hashCode;

  factory Headers.fromJson(Map<String, dynamic> json) => _$HeadersFromJson(json);

  Map<String, dynamic> toJson() => _$HeadersToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


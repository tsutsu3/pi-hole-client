//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'http_version.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HttpVersion {
  /// Returns a new [HttpVersion] instance.
  HttpVersion({

     this.httpVersion,
  });

      /// HTTP version of request
  @JsonKey(
    
    name: r'http_version',
    required: false,
    includeIfNull: false,
  )


  final String? httpVersion;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HttpVersion &&
      other.httpVersion == httpVersion;

    @override
    int get hashCode =>
        httpVersion.hashCode;

  factory HttpVersion.fromJson(Map<String, dynamic> json) => _$HttpVersionFromJson(json);

  Map<String, dynamic> toJson() => _$HttpVersionToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


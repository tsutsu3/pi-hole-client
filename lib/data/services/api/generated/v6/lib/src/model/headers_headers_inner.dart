//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'headers_headers_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class HeadersHeadersInner {
  /// Returns a new [HeadersHeadersInner] instance.
  HeadersHeadersInner({

     this.name,

     this.value,
  });

      /// Header name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Header value
  @JsonKey(
    
    name: r'value',
    required: false,
    includeIfNull: false,
  )


  final String? value;





    @override
    bool operator ==(Object other) => identical(this, other) || other is HeadersHeadersInner &&
      other.name == name &&
      other.value == value;

    @override
    int get hashCode =>
        name.hashCode +
        value.hashCode;

  factory HeadersHeadersInner.fromJson(Map<String, dynamic> json) => _$HeadersHeadersInnerFromJson(json);

  Map<String, dynamic> toJson() => _$HeadersHeadersInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


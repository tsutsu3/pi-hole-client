//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'unicode.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Unicode {
  /// Returns a new [Unicode] instance.
  Unicode({

     this.unicode,
  });

      /// Unicode domain (may be different from `domain` if punycode-encoding is used)
  @JsonKey(
    
    name: r'unicode',
    required: false,
    includeIfNull: false,
  )


  final String? unicode;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Unicode &&
      other.unicode == unicode;

    @override
    int get hashCode =>
        unicode.hashCode;

  factory Unicode.fromJson(Map<String, dynamic> json) => _$UnicodeFromJson(json);

  Map<String, dynamic> toJson() => _$UnicodeToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


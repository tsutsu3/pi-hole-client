//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'kind.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Kind {
  /// Returns a new [Kind] instance.
  Kind({

     this.kind,
  });

      /// String specifying domain kind
  @JsonKey(
    
    name: r'kind',
    required: false,
    includeIfNull: false,
  )


  final KindKindEnum? kind;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Kind &&
      other.kind == kind;

    @override
    int get hashCode =>
        kind.hashCode;

  factory Kind.fromJson(Map<String, dynamic> json) => _$KindFromJson(json);

  Map<String, dynamic> toJson() => _$KindToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}

/// String specifying domain kind
enum KindKindEnum {
    /// String specifying domain kind
@JsonValue(r'exact')
exact(r'exact'),
    /// String specifying domain kind
@JsonValue(r'regex')
regex(r'regex');

const KindKindEnum(this.value);

final String value;

@override
String toString() => value;
}



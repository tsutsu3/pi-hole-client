//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'method.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Method {
  /// Returns a new [Method] instance.
  Method({

     this.method,
  });

      /// Request method
  @JsonKey(
    
    name: r'method',
    required: false,
    includeIfNull: false,
  )


  final String? method;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Method &&
      other.method == method;

    @override
    int get hashCode =>
        method.hashCode;

  factory Method.fromJson(Map<String, dynamic> json) => _$MethodFromJson(json);

  Map<String, dynamic> toJson() => _$MethodToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


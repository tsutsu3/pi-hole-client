//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/ftl_ftl.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Ftl {
  /// Returns a new [Ftl] instance.
  Ftl({

     this.ftl,
  });

  @JsonKey(
    
    name: r'ftl',
    required: false,
    includeIfNull: false,
  )


  final FtlFtl? ftl;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Ftl &&
      other.ftl == ftl;

    @override
    int get hashCode =>
        ftl.hashCode;

  factory Ftl.fromJson(Map<String, dynamic> json) => _$FtlFromJson(json);

  Map<String, dynamic> toJson() => _$FtlToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


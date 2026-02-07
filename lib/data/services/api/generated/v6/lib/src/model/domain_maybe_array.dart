//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'domain_maybe_array.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DomainMaybeArray {
  /// Returns a new [DomainMaybeArray] instance.
  DomainMaybeArray({

     this.domain,
  });

  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? domain;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DomainMaybeArray &&
      other.domain == domain;

    @override
    int get hashCode =>
        domain.hashCode;

  factory DomainMaybeArray.fromJson(Map<String, dynamic> json) => _$DomainMaybeArrayFromJson(json);

  Map<String, dynamic> toJson() => _$DomainMaybeArrayToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


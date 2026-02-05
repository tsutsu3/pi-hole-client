//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/get_domains_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'model_get.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ModelGet {
  /// Returns a new [ModelGet] instance.
  ModelGet({

     this.domains,
  });

      /// Array of domains
  @JsonKey(
    
    name: r'domains',
    required: false,
    includeIfNull: false,
  )


  final List<GetDomainsInner>? domains;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ModelGet &&
      other.domains == domains;

    @override
    int get hashCode =>
        domains.hashCode;

  factory ModelGet.fromJson(Map<String, dynamic> json) => _$ModelGetFromJson(json);

  Map<String, dynamic> toJson() => _$ModelGetToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


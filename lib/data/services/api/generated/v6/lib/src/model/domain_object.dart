//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'domain_object.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class DomainObject {
  /// Returns a new [DomainObject] instance.
  DomainObject({

     this.domain,
  });

      /// Domain
  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;





    @override
    bool operator ==(Object other) => identical(this, other) || other is DomainObject &&
      other.domain == domain;

    @override
    int get hashCode =>
        domain.hashCode;

  factory DomainObject.fromJson(Map<String, dynamic> json) => _$DomainObjectFromJson(json);

  Map<String, dynamic> toJson() => _$DomainObjectToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


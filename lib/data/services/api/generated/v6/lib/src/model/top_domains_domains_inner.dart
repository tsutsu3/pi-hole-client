//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_domains_domains_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TopDomainsDomainsInner {
  /// Returns a new [TopDomainsDomainsInner] instance.
  TopDomainsDomainsInner({

     this.domain,

     this.count,
  });

      /// Requested domain
  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



      /// Number of times this domain has been requested
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TopDomainsDomainsInner &&
      other.domain == domain &&
      other.count == count;

    @override
    int get hashCode =>
        domain.hashCode +
        count.hashCode;

  factory TopDomainsDomainsInner.fromJson(Map<String, dynamic> json) => _$TopDomainsDomainsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$TopDomainsDomainsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


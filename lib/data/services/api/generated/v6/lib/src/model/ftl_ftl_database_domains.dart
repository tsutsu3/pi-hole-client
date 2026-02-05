//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/ftl_ftl_database_domains_denied.dart';
import 'package:pihole_v6_api/src/model/ftl_ftl_database_domains_allowed.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_database_domains.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlDatabaseDomains {
  /// Returns a new [FtlFtlDatabaseDomains] instance.
  FtlFtlDatabaseDomains({

     this.allowed,

     this.denied,
  });

  @JsonKey(
    
    name: r'allowed',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabaseDomainsAllowed? allowed;



  @JsonKey(
    
    name: r'denied',
    required: false,
    includeIfNull: false,
  )


  final FtlFtlDatabaseDomainsDenied? denied;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlDatabaseDomains &&
      other.allowed == allowed &&
      other.denied == denied;

    @override
    int get hashCode =>
        allowed.hashCode +
        denied.hashCode;

  factory FtlFtlDatabaseDomains.fromJson(Map<String, dynamic> json) => _$FtlFtlDatabaseDomainsFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlDatabaseDomainsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


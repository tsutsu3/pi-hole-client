//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries_queries_status.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueriesQueriesStatus {
  /// Returns a new [QueriesQueriesStatus] instance.
  QueriesQueriesStatus({

     this.UNKNOWN,

     this.GRAVITY,

     this.FORWARDED,

     this.CACHE,

     this.REGEX,

     this.DENYLIST,

     this.EXTERNAL_BLOCKED_IP,

     this.EXTERNAL_BLOCKED_NULL,

     this.EXTERNAL_BLOCKED_NXRA,

     this.GRAVITY_CNAME,

     this.REGEX_CNAME,

     this.DENYLIST_CNAME,

     this.RETRIED,

     this.RETRIED_DNSSEC,

     this.IN_PROGRESS,

     this.DBBUSY,

     this.SPECIAL_DOMAIN,

     this.CACHE_STALE,

     this.eXTERNALBLOCKEDEDE15,
  });

      /// Type UNKNOWN queries
  @JsonKey(
    
    name: r'UNKNOWN',
    required: false,
    includeIfNull: false,
  )


  final int? UNKNOWN;



      /// Type GRAVITY queries
  @JsonKey(
    
    name: r'GRAVITY',
    required: false,
    includeIfNull: false,
  )


  final int? GRAVITY;



      /// Type FORWARDED queries
  @JsonKey(
    
    name: r'FORWARDED',
    required: false,
    includeIfNull: false,
  )


  final int? FORWARDED;



      /// Type CACHE queries
  @JsonKey(
    
    name: r'CACHE',
    required: false,
    includeIfNull: false,
  )


  final int? CACHE;



      /// Type REGEX queries
  @JsonKey(
    
    name: r'REGEX',
    required: false,
    includeIfNull: false,
  )


  final int? REGEX;



      /// Type DENYLIST queries
  @JsonKey(
    
    name: r'DENYLIST',
    required: false,
    includeIfNull: false,
  )


  final int? DENYLIST;



      /// Type EXTERNAL_BLOCKED_IP queries
  @JsonKey(
    
    name: r'EXTERNAL_BLOCKED_IP',
    required: false,
    includeIfNull: false,
  )


  final int? EXTERNAL_BLOCKED_IP;



      /// Type EXTERNAL_BLOCKED_NULL queries
  @JsonKey(
    
    name: r'EXTERNAL_BLOCKED_NULL',
    required: false,
    includeIfNull: false,
  )


  final int? EXTERNAL_BLOCKED_NULL;



      /// Type EXTERNAL_BLOCKED_NXRA queries
  @JsonKey(
    
    name: r'EXTERNAL_BLOCKED_NXRA',
    required: false,
    includeIfNull: false,
  )


  final int? EXTERNAL_BLOCKED_NXRA;



      /// Type GRAVITY_CNAME queries
  @JsonKey(
    
    name: r'GRAVITY_CNAME',
    required: false,
    includeIfNull: false,
  )


  final int? GRAVITY_CNAME;



      /// Type REGEX_CNAME queries
  @JsonKey(
    
    name: r'REGEX_CNAME',
    required: false,
    includeIfNull: false,
  )


  final int? REGEX_CNAME;



      /// Type DENYLIST_CNAME queries
  @JsonKey(
    
    name: r'DENYLIST_CNAME',
    required: false,
    includeIfNull: false,
  )


  final int? DENYLIST_CNAME;



      /// Type RETRIED queries
  @JsonKey(
    
    name: r'RETRIED',
    required: false,
    includeIfNull: false,
  )


  final int? RETRIED;



      /// Type RETRIED_DNSSEC queries
  @JsonKey(
    
    name: r'RETRIED_DNSSEC',
    required: false,
    includeIfNull: false,
  )


  final int? RETRIED_DNSSEC;



      /// Type IN_PROGRESS queries
  @JsonKey(
    
    name: r'IN_PROGRESS',
    required: false,
    includeIfNull: false,
  )


  final int? IN_PROGRESS;



      /// Type DBBUSY queries
  @JsonKey(
    
    name: r'DBBUSY',
    required: false,
    includeIfNull: false,
  )


  final int? DBBUSY;



      /// Type SPECIAL_DOMAIN queries
  @JsonKey(
    
    name: r'SPECIAL_DOMAIN',
    required: false,
    includeIfNull: false,
  )


  final int? SPECIAL_DOMAIN;



      /// Type CACHE_STALE queries
  @JsonKey(
    
    name: r'CACHE_STALE',
    required: false,
    includeIfNull: false,
  )


  final int? CACHE_STALE;



      /// Type EXTERNAL_BLOCKED_EDE15 queries
  @JsonKey(
    
    name: r'EXTERNAL_BLOCKED_EDE15',
    required: false,
    includeIfNull: false,
  )


  final int? eXTERNALBLOCKEDEDE15;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueriesQueriesStatus &&
      other.UNKNOWN == UNKNOWN &&
      other.GRAVITY == GRAVITY &&
      other.FORWARDED == FORWARDED &&
      other.CACHE == CACHE &&
      other.REGEX == REGEX &&
      other.DENYLIST == DENYLIST &&
      other.EXTERNAL_BLOCKED_IP == EXTERNAL_BLOCKED_IP &&
      other.EXTERNAL_BLOCKED_NULL == EXTERNAL_BLOCKED_NULL &&
      other.EXTERNAL_BLOCKED_NXRA == EXTERNAL_BLOCKED_NXRA &&
      other.GRAVITY_CNAME == GRAVITY_CNAME &&
      other.REGEX_CNAME == REGEX_CNAME &&
      other.DENYLIST_CNAME == DENYLIST_CNAME &&
      other.RETRIED == RETRIED &&
      other.RETRIED_DNSSEC == RETRIED_DNSSEC &&
      other.IN_PROGRESS == IN_PROGRESS &&
      other.DBBUSY == DBBUSY &&
      other.SPECIAL_DOMAIN == SPECIAL_DOMAIN &&
      other.CACHE_STALE == CACHE_STALE &&
      other.eXTERNALBLOCKEDEDE15 == eXTERNALBLOCKEDEDE15;

    @override
    int get hashCode =>
        UNKNOWN.hashCode +
        GRAVITY.hashCode +
        FORWARDED.hashCode +
        CACHE.hashCode +
        REGEX.hashCode +
        DENYLIST.hashCode +
        EXTERNAL_BLOCKED_IP.hashCode +
        EXTERNAL_BLOCKED_NULL.hashCode +
        EXTERNAL_BLOCKED_NXRA.hashCode +
        GRAVITY_CNAME.hashCode +
        REGEX_CNAME.hashCode +
        DENYLIST_CNAME.hashCode +
        RETRIED.hashCode +
        RETRIED_DNSSEC.hashCode +
        IN_PROGRESS.hashCode +
        DBBUSY.hashCode +
        SPECIAL_DOMAIN.hashCode +
        CACHE_STALE.hashCode +
        eXTERNALBLOCKEDEDE15.hashCode;

  factory QueriesQueriesStatus.fromJson(Map<String, dynamic> json) => _$QueriesQueriesStatusFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesQueriesStatusToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


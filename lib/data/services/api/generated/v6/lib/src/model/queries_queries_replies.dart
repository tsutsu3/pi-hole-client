//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries_queries_replies.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueriesQueriesReplies {
  /// Returns a new [QueriesQueriesReplies] instance.
  QueriesQueriesReplies({

     this.UNKNOWN,

     this.NODATA,

     this.NXDOMAIN,

     this.CNAME,

     this.IP,

     this.DOMAIN,

     this.RRNAME,

     this.SERVFAIL,

     this.REFUSED,

     this.NOTIMP,

     this.OTHER,

     this.DNSSEC,

     this.NONE,

     this.BLOB,
  });

      /// Type UNKNOWN replies
  @JsonKey(
    
    name: r'UNKNOWN',
    required: false,
    includeIfNull: false,
  )


  final int? UNKNOWN;



      /// Type NODATA replies
  @JsonKey(
    
    name: r'NODATA',
    required: false,
    includeIfNull: false,
  )


  final int? NODATA;



      /// Type NXDOMAIN replies
  @JsonKey(
    
    name: r'NXDOMAIN',
    required: false,
    includeIfNull: false,
  )


  final int? NXDOMAIN;



      /// Type CNAME replies
  @JsonKey(
    
    name: r'CNAME',
    required: false,
    includeIfNull: false,
  )


  final int? CNAME;



      /// Type IP replies
  @JsonKey(
    
    name: r'IP',
    required: false,
    includeIfNull: false,
  )


  final int? IP;



      /// Type DOMAIN replies
  @JsonKey(
    
    name: r'DOMAIN',
    required: false,
    includeIfNull: false,
  )


  final int? DOMAIN;



      /// Type RRNAME replies
  @JsonKey(
    
    name: r'RRNAME',
    required: false,
    includeIfNull: false,
  )


  final int? RRNAME;



      /// Type SERVFAIL replies
  @JsonKey(
    
    name: r'SERVFAIL',
    required: false,
    includeIfNull: false,
  )


  final int? SERVFAIL;



      /// Type REFUSED replies
  @JsonKey(
    
    name: r'REFUSED',
    required: false,
    includeIfNull: false,
  )


  final int? REFUSED;



      /// Type NOTIMP replies
  @JsonKey(
    
    name: r'NOTIMP',
    required: false,
    includeIfNull: false,
  )


  final int? NOTIMP;



      /// Type OTHER replies
  @JsonKey(
    
    name: r'OTHER',
    required: false,
    includeIfNull: false,
  )


  final int? OTHER;



      /// Type DNSSEC replies
  @JsonKey(
    
    name: r'DNSSEC',
    required: false,
    includeIfNull: false,
  )


  final int? DNSSEC;



      /// Type NONE replies
  @JsonKey(
    
    name: r'NONE',
    required: false,
    includeIfNull: false,
  )


  final int? NONE;



      /// Type BLOB replies
  @JsonKey(
    
    name: r'BLOB',
    required: false,
    includeIfNull: false,
  )


  final int? BLOB;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueriesQueriesReplies &&
      other.UNKNOWN == UNKNOWN &&
      other.NODATA == NODATA &&
      other.NXDOMAIN == NXDOMAIN &&
      other.CNAME == CNAME &&
      other.IP == IP &&
      other.DOMAIN == DOMAIN &&
      other.RRNAME == RRNAME &&
      other.SERVFAIL == SERVFAIL &&
      other.REFUSED == REFUSED &&
      other.NOTIMP == NOTIMP &&
      other.OTHER == OTHER &&
      other.DNSSEC == DNSSEC &&
      other.NONE == NONE &&
      other.BLOB == BLOB;

    @override
    int get hashCode =>
        UNKNOWN.hashCode +
        NODATA.hashCode +
        NXDOMAIN.hashCode +
        CNAME.hashCode +
        IP.hashCode +
        DOMAIN.hashCode +
        RRNAME.hashCode +
        SERVFAIL.hashCode +
        REFUSED.hashCode +
        NOTIMP.hashCode +
        OTHER.hashCode +
        DNSSEC.hashCode +
        NONE.hashCode +
        BLOB.hashCode;

  factory QueriesQueriesReplies.fromJson(Map<String, dynamic> json) => _$QueriesQueriesRepliesFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesQueriesRepliesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


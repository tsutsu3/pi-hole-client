//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner_client.dart';
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner_reply.dart';
import 'package:pihole_v6_api/src/model/schemas_queries_queries_inner_ede.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_queries_queries_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasQueriesQueriesInner {
  /// Returns a new [SchemasQueriesQueriesInner] instance.
  SchemasQueriesQueriesInner({

     this.id,

     this.time,

     this.type,

     this.domain,

     this.cname,

     this.status,

     this.client,

     this.dnssec,

     this.reply,

     this.listId,

     this.upstream,

     this.ede,
  });

      /// Query ID in the long-term database
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Timestamp
  @JsonKey(
    
    name: r'time',
    required: false,
    includeIfNull: false,
  )


  final num? time;



      /// Query type
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final String? type;



      /// Queried domain
  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final String? domain;



      /// Domain blocked during deep CNAME inspection
  @JsonKey(
    
    name: r'cname',
    required: false,
    includeIfNull: false,
  )


  final String? cname;



      /// Query status
  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final String? status;



  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  )


  final SchemasQueriesQueriesInnerClient? client;



      /// DNSSEC status
  @JsonKey(
    
    name: r'dnssec',
    required: false,
    includeIfNull: false,
  )


  final String? dnssec;



  @JsonKey(
    
    name: r'reply',
    required: false,
    includeIfNull: false,
  )


  final SchemasQueriesQueriesInnerReply? reply;



      /// ID of corresponding database table (adlist for anti-/gravity, else domainlist) (`NULL` if N/A)
  @JsonKey(
    
    name: r'list_id',
    required: false,
    includeIfNull: false,
  )


  final int? listId;



      /// IP or name + port of upstream server
  @JsonKey(
    
    name: r'upstream',
    required: false,
    includeIfNull: false,
  )


  final String? upstream;



  @JsonKey(
    
    name: r'ede',
    required: false,
    includeIfNull: false,
  )


  final SchemasQueriesQueriesInnerEde? ede;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasQueriesQueriesInner &&
      other.id == id &&
      other.time == time &&
      other.type == type &&
      other.domain == domain &&
      other.cname == cname &&
      other.status == status &&
      other.client == client &&
      other.dnssec == dnssec &&
      other.reply == reply &&
      other.listId == listId &&
      other.upstream == upstream &&
      other.ede == ede;

    @override
    int get hashCode =>
        id.hashCode +
        time.hashCode +
        type.hashCode +
        domain.hashCode +
        (cname == null ? 0 : cname.hashCode) +
        (status == null ? 0 : status.hashCode) +
        client.hashCode +
        (dnssec == null ? 0 : dnssec.hashCode) +
        reply.hashCode +
        (listId == null ? 0 : listId.hashCode) +
        (upstream == null ? 0 : upstream.hashCode) +
        ede.hashCode;

  factory SchemasQueriesQueriesInner.fromJson(Map<String, dynamic> json) => _$SchemasQueriesQueriesInnerFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasQueriesQueriesInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


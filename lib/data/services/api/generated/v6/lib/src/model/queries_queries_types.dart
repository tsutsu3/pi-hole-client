//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries_queries_types.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueriesQueriesTypes {
  /// Returns a new [QueriesQueriesTypes] instance.
  QueriesQueriesTypes({

     this.A,

     this.AAAA,

     this.ANY,

     this.SRV,

     this.SOA,

     this.PTR,

     this.TXT,

     this.NAPTR,

     this.MX,

     this.DS,

     this.RRSIG,

     this.DNSKEY,

     this.NS,

     this.SVCB,

     this.HTTPS,

     this.OTHER,
  });

      /// Type A queries
  @JsonKey(
    
    name: r'A',
    required: false,
    includeIfNull: false,
  )


  final int? A;



      /// Type AAAA queries
  @JsonKey(
    
    name: r'AAAA',
    required: false,
    includeIfNull: false,
  )


  final int? AAAA;



      /// Type ANY queries
  @JsonKey(
    
    name: r'ANY',
    required: false,
    includeIfNull: false,
  )


  final int? ANY;



      /// Type SRV queries
  @JsonKey(
    
    name: r'SRV',
    required: false,
    includeIfNull: false,
  )


  final int? SRV;



      /// Type SOA queries
  @JsonKey(
    
    name: r'SOA',
    required: false,
    includeIfNull: false,
  )


  final int? SOA;



      /// Type PTR queries
  @JsonKey(
    
    name: r'PTR',
    required: false,
    includeIfNull: false,
  )


  final int? PTR;



      /// Type TXT queries
  @JsonKey(
    
    name: r'TXT',
    required: false,
    includeIfNull: false,
  )


  final int? TXT;



      /// Type NAPTR queries
  @JsonKey(
    
    name: r'NAPTR',
    required: false,
    includeIfNull: false,
  )


  final int? NAPTR;



      /// Type MX queries
  @JsonKey(
    
    name: r'MX',
    required: false,
    includeIfNull: false,
  )


  final int? MX;



      /// Type DS queries
  @JsonKey(
    
    name: r'DS',
    required: false,
    includeIfNull: false,
  )


  final int? DS;



      /// Type RRSIG queries
  @JsonKey(
    
    name: r'RRSIG',
    required: false,
    includeIfNull: false,
  )


  final int? RRSIG;



      /// Type DNSKEY queries
  @JsonKey(
    
    name: r'DNSKEY',
    required: false,
    includeIfNull: false,
  )


  final int? DNSKEY;



      /// Type NS queries
  @JsonKey(
    
    name: r'NS',
    required: false,
    includeIfNull: false,
  )


  final int? NS;



      /// Type SVCB queries
  @JsonKey(
    
    name: r'SVCB',
    required: false,
    includeIfNull: false,
  )


  final int? SVCB;



      /// Type HTTPS queries
  @JsonKey(
    
    name: r'HTTPS',
    required: false,
    includeIfNull: false,
  )


  final int? HTTPS;



      /// Queries of remaining types
  @JsonKey(
    
    name: r'OTHER',
    required: false,
    includeIfNull: false,
  )


  final int? OTHER;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueriesQueriesTypes &&
      other.A == A &&
      other.AAAA == AAAA &&
      other.ANY == ANY &&
      other.SRV == SRV &&
      other.SOA == SOA &&
      other.PTR == PTR &&
      other.TXT == TXT &&
      other.NAPTR == NAPTR &&
      other.MX == MX &&
      other.DS == DS &&
      other.RRSIG == RRSIG &&
      other.DNSKEY == DNSKEY &&
      other.NS == NS &&
      other.SVCB == SVCB &&
      other.HTTPS == HTTPS &&
      other.OTHER == OTHER;

    @override
    int get hashCode =>
        A.hashCode +
        AAAA.hashCode +
        ANY.hashCode +
        SRV.hashCode +
        SOA.hashCode +
        PTR.hashCode +
        TXT.hashCode +
        NAPTR.hashCode +
        MX.hashCode +
        DS.hashCode +
        RRSIG.hashCode +
        DNSKEY.hashCode +
        NS.hashCode +
        SVCB.hashCode +
        HTTPS.hashCode +
        OTHER.hashCode;

  factory QueriesQueriesTypes.fromJson(Map<String, dynamic> json) => _$QueriesQueriesTypesFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesQueriesTypesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


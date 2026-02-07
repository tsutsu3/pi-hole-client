//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/queries_clients.dart';
import 'package:pihole_v6_api/src/model/queries_gravity.dart';
import 'package:pihole_v6_api/src/model/queries_queries.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Queries {
  /// Returns a new [Queries] instance.
  Queries({

     this.queries,

     this.clients,

     this.gravity,
  });

  @JsonKey(
    
    name: r'queries',
    required: false,
    includeIfNull: false,
  )


  final QueriesQueries? queries;



  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final QueriesClients? clients;



  @JsonKey(
    
    name: r'gravity',
    required: false,
    includeIfNull: false,
  )


  final QueriesGravity? gravity;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Queries &&
      other.queries == queries &&
      other.clients == clients &&
      other.gravity == gravity;

    @override
    int get hashCode =>
        queries.hashCode +
        clients.hashCode +
        gravity.hashCode;

  factory Queries.fromJson(Map<String, dynamic> json) => _$QueriesFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


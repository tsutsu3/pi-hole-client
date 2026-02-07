//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/top_clients_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_clients.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TopClients {
  /// Returns a new [TopClients] instance.
  TopClients({

     this.clients,

     this.totalQueries,

     this.blockedQueries,
  });

      /// Array of clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<TopClientsClientsInner>? clients;



      /// Total number of queries
  @JsonKey(
    
    name: r'total_queries',
    required: false,
    includeIfNull: false,
  )


  final int? totalQueries;



      /// Number of blocked queries
  @JsonKey(
    
    name: r'blocked_queries',
    required: false,
    includeIfNull: false,
  )


  final int? blockedQueries;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TopClients &&
      other.clients == clients &&
      other.totalQueries == totalQueries &&
      other.blockedQueries == blockedQueries;

    @override
    int get hashCode =>
        clients.hashCode +
        totalQueries.hashCode +
        blockedQueries.hashCode;

  factory TopClients.fromJson(Map<String, dynamic> json) => _$TopClientsFromJson(json);

  Map<String, dynamic> toJson() => _$TopClientsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


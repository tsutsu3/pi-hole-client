//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'queries_clients.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class QueriesClients {
  /// Returns a new [QueriesClients] instance.
  QueriesClients({

     this.active,

     this.total,
  });

      /// Number of active clients (seen in the last 24 hours)
  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final int? active;



      /// Total number of clients seen by FTL
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is QueriesClients &&
      other.active == active &&
      other.total == total;

    @override
    int get hashCode =>
        active.hashCode +
        total.hashCode;

  factory QueriesClients.fromJson(Map<String, dynamic> json) => _$QueriesClientsFromJson(json);

  Map<String, dynamic> toJson() => _$QueriesClientsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


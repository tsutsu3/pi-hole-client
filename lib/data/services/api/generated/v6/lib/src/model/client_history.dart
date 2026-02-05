//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/client_history_history_inner.dart';
import 'package:pihole_v6_api/src/model/client_history_clients_value.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_history.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientHistory {
  /// Returns a new [ClientHistory] instance.
  ClientHistory({

     this.clients,

     this.history,
  });

      /// Data corresponding to the individual clients
  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final Map<String, ClientHistoryClientsValue>? clients;



      /// Data array
  @JsonKey(
    
    name: r'history',
    required: false,
    includeIfNull: false,
  )


  final List<ClientHistoryHistoryInner>? history;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientHistory &&
      other.clients == clients &&
      other.history == history;

    @override
    int get hashCode =>
        clients.hashCode +
        history.hashCode;

  factory ClientHistory.fromJson(Map<String, dynamic> json) => _$ClientHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$ClientHistoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


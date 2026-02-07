//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'client_history_clients_value.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientHistoryClientsValue {
  /// Returns a new [ClientHistoryClientsValue] instance.
  ClientHistoryClientsValue({

     this.name,

     this.total,
  });

      /// Client name
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Total number of queries
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientHistoryClientsValue &&
      other.name == name &&
      other.total == total;

    @override
    int get hashCode =>
        (name == null ? 0 : name.hashCode) +
        total.hashCode;

  factory ClientHistoryClientsValue.fromJson(Map<String, dynamic> json) => _$ClientHistoryClientsValueFromJson(json);

  Map<String, dynamic> toJson() => _$ClientHistoryClientsValueToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


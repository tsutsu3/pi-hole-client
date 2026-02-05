//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'top_clients_clients_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TopClientsClientsInner {
  /// Returns a new [TopClientsClientsInner] instance.
  TopClientsClientsInner({

     this.ip,

     this.name,

     this.count,
  });

      /// Client IP address (can be either IPv4 or IPv6)
  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



      /// Client hostname (if available)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;



      /// Number of queries this client has made
  @JsonKey(
    
    name: r'count',
    required: false,
    includeIfNull: false,
  )


  final int? count;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TopClientsClientsInner &&
      other.ip == ip &&
      other.name == name &&
      other.count == count;

    @override
    int get hashCode =>
        ip.hashCode +
        name.hashCode +
        count.hashCode;

  factory TopClientsClientsInner.fromJson(Map<String, dynamic> json) => _$TopClientsClientsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$TopClientsClientsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


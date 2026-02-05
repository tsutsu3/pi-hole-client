//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ftl_ftl_clients.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class FtlFtlClients {
  /// Returns a new [FtlFtlClients] instance.
  FtlFtlClients({

     this.total,

     this.active,
  });

      /// Number of clients FTL has seen in its lfetime
  @JsonKey(
    
    name: r'total',
    required: false,
    includeIfNull: false,
  )


  final int? total;



      /// Number of clients actively using FTL
  @JsonKey(
    
    name: r'active',
    required: false,
    includeIfNull: false,
  )


  final int? active;





    @override
    bool operator ==(Object other) => identical(this, other) || other is FtlFtlClients &&
      other.total == total &&
      other.active == active;

    @override
    int get hashCode =>
        total.hashCode +
        active.hashCode;

  factory FtlFtlClients.fromJson(Map<String, dynamic> json) => _$FtlFtlClientsFromJson(json);

  Map<String, dynamic> toJson() => _$FtlFtlClientsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


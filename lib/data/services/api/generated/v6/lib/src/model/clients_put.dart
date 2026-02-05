//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clients_put.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientsPut {
  /// Returns a new [ClientsPut] instance.
  ClientsPut({

     this.comment,

     this.groups = const [0],
  });

      /// User-provided free-text comment for this client
  @JsonKey(
    
    name: r'comment',
    required: false,
    includeIfNull: false,
  )


  final String? comment;



      /// Array of group IDs
  @JsonKey(
    defaultValue: [0],
    name: r'groups',
    required: false,
    includeIfNull: false,
  )


  final List<int>? groups;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientsPut &&
      other.comment == comment &&
      other.groups == groups;

    @override
    int get hashCode =>
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode;

  factory ClientsPut.fromJson(Map<String, dynamic> json) => _$ClientsPutFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsPutToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clients_get_clients_inner.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientsGetClientsInner {
  /// Returns a new [ClientsGetClientsInner] instance.
  ClientsGetClientsInner({

     this.client,

     this.comment,

     this.groups = const [0],

     this.id,

     this.dateAdded,

     this.dateModified,

     this.name,
  });

      /// client IP / MAC / hostname / interface
  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  )


  final String? client;



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



      /// Database ID
  @JsonKey(
    
    name: r'id',
    required: false,
    includeIfNull: false,
  )


  final int? id;



      /// Unix timestamp of item addition
  @JsonKey(
    
    name: r'date_added',
    required: false,
    includeIfNull: false,
  )


  final int? dateAdded;



      /// Unix timestamp of last item modification
  @JsonKey(
    
    name: r'date_modified',
    required: false,
    includeIfNull: false,
  )


  final int? dateModified;



      /// hostname (only if available)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ClientsGetClientsInner &&
      other.client == client &&
      other.comment == comment &&
      other.groups == groups &&
      other.id == id &&
      other.dateAdded == dateAdded &&
      other.dateModified == dateModified &&
      other.name == name;

    @override
    int get hashCode =>
        client.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        id.hashCode +
        dateAdded.hashCode +
        dateModified.hashCode +
        (name == null ? 0 : name.hashCode);

  factory ClientsGetClientsInner.fromJson(Map<String, dynamic> json) => _$ClientsGetClientsInnerFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsGetClientsInnerToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


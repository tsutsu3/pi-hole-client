//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'clients_post.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ClientsPost {
  /// Returns a new [ClientsPost] instance.
  ClientsPost({

     this.client,

     this.comment,

     this.groups = const [0],
  });

  @JsonKey(
    
    name: r'client',
    required: false,
    includeIfNull: false,
  )


  final StringOrList? client;



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
    bool operator ==(Object other) => identical(this, other) || other is ClientsPost &&
      other.client == client &&
      other.comment == comment &&
      other.groups == groups;

    @override
    int get hashCode =>
        client.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode;

  factory ClientsPost.fromJson(Map<String, dynamic> json) => _$ClientsPostFromJson(json);

  Map<String, dynamic> toJson() => _$ClientsPostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


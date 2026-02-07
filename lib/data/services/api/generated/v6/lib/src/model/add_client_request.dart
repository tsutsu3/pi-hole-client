//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/string_or_list.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_client_request.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class AddClientRequest {
  /// Returns a new [AddClientRequest] instance.
  AddClientRequest({

     this.client,

     this.comment,

     this.groups = const [0],

     this.took,
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



      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is AddClientRequest &&
      other.client == client &&
      other.comment == comment &&
      other.groups == groups &&
      other.took == took;

    @override
    int get hashCode =>
        client.hashCode +
        (comment == null ? 0 : comment.hashCode) +
        groups.hashCode +
        took.hashCode;

  factory AddClientRequest.fromJson(Map<String, dynamic> json) => _$AddClientRequestFromJson(json);

  Map<String, dynamic> toJson() => _$AddClientRequestToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


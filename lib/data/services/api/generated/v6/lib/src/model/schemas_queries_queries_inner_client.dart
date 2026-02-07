//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_queries_queries_inner_client.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasQueriesQueriesInnerClient {
  /// Returns a new [SchemasQueriesQueriesInnerClient] instance.
  SchemasQueriesQueriesInnerClient({

     this.ip,

     this.name,
  });

      /// Requesting client's IP address
  @JsonKey(
    
    name: r'ip',
    required: false,
    includeIfNull: false,
  )


  final String? ip;



      /// Requesting client's hostname (if available)
  @JsonKey(
    
    name: r'name',
    required: false,
    includeIfNull: false,
  )


  final String? name;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasQueriesQueriesInnerClient &&
      other.ip == ip &&
      other.name == name;

    @override
    int get hashCode =>
        ip.hashCode +
        (name == null ? 0 : name.hashCode);

  factory SchemasQueriesQueriesInnerClient.fromJson(Map<String, dynamic> json) => _$SchemasQueriesQueriesInnerClientFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasQueriesQueriesInnerClientToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/schemas_suggestions_clients_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'schemas_suggestions.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SchemasSuggestions {
  /// Returns a new [SchemasSuggestions] instance.
  SchemasSuggestions({

     this.clients,
  });

  @JsonKey(
    
    name: r'clients',
    required: false,
    includeIfNull: false,
  )


  final List<SchemasSuggestionsClientsInner>? clients;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SchemasSuggestions &&
      other.clients == clients;

    @override
    int get hashCode =>
        clients.hashCode;

  factory SchemasSuggestions.fromJson(Map<String, dynamic> json) => _$SchemasSuggestionsFromJson(json);

  Map<String, dynamic> toJson() => _$SchemasSuggestionsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


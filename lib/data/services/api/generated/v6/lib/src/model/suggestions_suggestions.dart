//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'suggestions_suggestions.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class SuggestionsSuggestions {
  /// Returns a new [SuggestionsSuggestions] instance.
  SuggestionsSuggestions({

     this.domain,

     this.clientIp,

     this.clientName,

     this.upstream,

     this.type,

     this.status,

     this.reply,

     this.dnssec,
  });

      /// Array of suggested domains
  @JsonKey(
    
    name: r'domain',
    required: false,
    includeIfNull: false,
  )


  final List<String>? domain;



      /// Array of suggested client IP addresses
  @JsonKey(
    
    name: r'client_ip',
    required: false,
    includeIfNull: false,
  )


  final List<String>? clientIp;



      /// Array of suggested client names
  @JsonKey(
    
    name: r'client_name',
    required: false,
    includeIfNull: false,
  )


  final List<String>? clientName;



      /// Array of suggested upstreams
  @JsonKey(
    
    name: r'upstream',
    required: false,
    includeIfNull: false,
  )


  final List<String>? upstream;



      /// Array of suggested query types
  @JsonKey(
    
    name: r'type',
    required: false,
    includeIfNull: false,
  )


  final List<String>? type;



      /// Array of suggested query statuses
  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final List<String>? status;



      /// Array of suggested query replies
  @JsonKey(
    
    name: r'reply',
    required: false,
    includeIfNull: false,
  )


  final List<String>? reply;



      /// Array of suggested DNSSEC statuses
  @JsonKey(
    
    name: r'dnssec',
    required: false,
    includeIfNull: false,
  )


  final List<String>? dnssec;





    @override
    bool operator ==(Object other) => identical(this, other) || other is SuggestionsSuggestions &&
      other.domain == domain &&
      other.clientIp == clientIp &&
      other.clientName == clientName &&
      other.upstream == upstream &&
      other.type == type &&
      other.status == status &&
      other.reply == reply &&
      other.dnssec == dnssec;

    @override
    int get hashCode =>
        domain.hashCode +
        clientIp.hashCode +
        clientName.hashCode +
        upstream.hashCode +
        type.hashCode +
        status.hashCode +
        reply.hashCode +
        dnssec.hashCode;

  factory SuggestionsSuggestions.fromJson(Map<String, dynamic> json) => _$SuggestionsSuggestionsFromJson(json);

  Map<String, dynamic> toJson() => _$SuggestionsSuggestionsToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


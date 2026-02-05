//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'errors_bad_request_error.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class ErrorsBadRequestError {
  /// Returns a new [ErrorsBadRequestError] instance.
  ErrorsBadRequestError({

     this.key,

     this.message,

     this.hint,
  });

      /// Machine-readable error type
  @JsonKey(
    
    name: r'key',
    required: false,
    includeIfNull: false,
  )


  final String? key;



      /// Human-readable error message
  @JsonKey(
    
    name: r'message',
    required: false,
    includeIfNull: false,
  )


  final String? message;



      /// Further details
  @JsonKey(
    
    name: r'hint',
    required: false,
    includeIfNull: false,
  )


  final String? hint;





    @override
    bool operator ==(Object other) => identical(this, other) || other is ErrorsBadRequestError &&
      other.key == key &&
      other.message == message &&
      other.hint == hint;

    @override
    int get hashCode =>
        key.hashCode +
        message.hashCode +
        (hint == null ? 0 : hint.hashCode);

  factory ErrorsBadRequestError.fromJson(Map<String, dynamic> json) => _$ErrorsBadRequestErrorFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorsBadRequestErrorToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


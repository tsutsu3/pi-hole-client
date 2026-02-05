//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'success.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Success {
  /// Returns a new [Success] instance.
  Success({

     this.status,
  });

      /// Key indicating the status of the request
  @JsonKey(
    
    name: r'status',
    required: false,
    includeIfNull: false,
  )


  final String? status;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Success &&
      other.status == status;

    @override
    int get hashCode =>
        status.hashCode;

  factory Success.fromJson(Map<String, dynamic> json) => _$SuccessFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'took.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class Took {
  /// Returns a new [Took] instance.
  Took({

     this.took,
  });

      /// Time in seconds it took to process the request
  @JsonKey(
    
    name: r'took',
    required: false,
    includeIfNull: false,
  )


  final num? took;





    @override
    bool operator ==(Object other) => identical(this, other) || other is Took &&
      other.took == took;

    @override
    int get hashCode =>
        took.hashCode;

  factory Took.fromJson(Map<String, dynamic> json) => _$TookFromJson(json);

  Map<String, dynamic> toJson() => _$TookToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


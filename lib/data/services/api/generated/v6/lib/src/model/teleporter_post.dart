//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'teleporter_post.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TeleporterPost {
  /// Returns a new [TeleporterPost] instance.
  TeleporterPost({

     this.processed,
  });

  @JsonKey(
    
    name: r'processed',
    required: false,
    includeIfNull: false,
  )


  final List<String>? processed;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TeleporterPost &&
      other.processed == processed;

    @override
    int get hashCode =>
        processed.hashCode;

  factory TeleporterPost.fromJson(Map<String, dynamic> json) => _$TeleporterPostFromJson(json);

  Map<String, dynamic> toJson() => _$TeleporterPostToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


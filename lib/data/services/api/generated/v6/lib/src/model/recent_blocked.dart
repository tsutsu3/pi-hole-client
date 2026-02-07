//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'recent_blocked.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class RecentBlocked {
  /// Returns a new [RecentBlocked] instance.
  RecentBlocked({

     this.blocked,
  });

      /// List of blocked domains
  @JsonKey(
    
    name: r'blocked',
    required: false,
    includeIfNull: false,
  )


  final List<String>? blocked;





    @override
    bool operator ==(Object other) => identical(this, other) || other is RecentBlocked &&
      other.blocked == blocked;

    @override
    int get hashCode =>
        blocked.hashCode;

  factory RecentBlocked.fromJson(Map<String, dynamic> json) => _$RecentBlockedFromJson(json);

  Map<String, dynamic> toJson() => _$RecentBlockedToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


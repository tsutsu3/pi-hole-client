//
// AUTO-GENERATED FILE, DO NOT MODIFY!
//

// ignore_for_file: unused_element
import 'package:pihole_v6_api/src/model/total_history_history_inner.dart';
import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'total_history.g.dart';


@CopyWith()
@JsonSerializable(
  checked: true,
  createToJson: true,
  disallowUnrecognizedKeys: false,
  explicitToJson: true,
)
class TotalHistory {
  /// Returns a new [TotalHistory] instance.
  TotalHistory({

     this.history,
  });

      /// Data array
  @JsonKey(
    
    name: r'history',
    required: false,
    includeIfNull: false,
  )


  final List<TotalHistoryHistoryInner>? history;





    @override
    bool operator ==(Object other) => identical(this, other) || other is TotalHistory &&
      other.history == history;

    @override
    int get hashCode =>
        history.hashCode;

  factory TotalHistory.fromJson(Map<String, dynamic> json) => _$TotalHistoryFromJson(json);

  Map<String, dynamic> toJson() => _$TotalHistoryToJson(this);

  @override
  String toString() {
    return toJson().toString();
  }

}


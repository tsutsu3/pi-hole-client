import 'package:freezed_annotation/freezed_annotation.dart';

part 'action.freezed.dart';
part 'action.g.dart';

@freezed
sealed class Action with _$Action {
  const factory Action({required String status, required double took}) =
      _Action;

  factory Action.fromJson(Map<String, dynamic> json) => _$ActionFromJson(json);
}

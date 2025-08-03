import 'package:freezed_annotation/freezed_annotation.dart';

part 'group.freezed.dart';
part 'group.g.dart';

@freezed
sealed class Group with _$Group {
  const factory Group({
    required int id,
    required String name,
    required bool enabled,
    required DateTime dateAdded,
    required DateTime dateModified,
    String? comment,
  }) = _Group;

  factory Group.fromJson(Map<String, dynamic> json) => _$GroupFromJson(json);
}

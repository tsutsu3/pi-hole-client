import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pi_hole_client/domain/model/enums.dart';
import 'package:pi_hole_client/domain/model/ftl/message.dart';

part 'gravity_snapshot.freezed.dart';

@freezed
sealed class GravitySnapshot with _$GravitySnapshot {
  const factory GravitySnapshot({
    required GravityStatus status,
    required List<String> logs,
    required List<FtlMessage> messages,
    DateTime? startedAt,
    DateTime? completedAt,
  }) = _GravitySnapshot;
}

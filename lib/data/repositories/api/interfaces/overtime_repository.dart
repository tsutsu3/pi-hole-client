import 'package:pi_hole_client/domain/models/overtime/overtime.dart';
import 'package:result_dart/result_dart.dart';

// ignore: one_member_abstracts
abstract interface class OverTimeRepository {
  Future<Result<OverTime>> fetchOverTime();
}

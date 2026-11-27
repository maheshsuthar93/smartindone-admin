import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/layout_view_repository.dart';

class ClassifyRemainingArea {
  const ClassifyRemainingArea(this.repository);

  final LayoutViewRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String remainingAreaId,
    required RemainingAreaStatus status,
  }) => repository.classifyRemainingArea(
    remainingAreaId: remainingAreaId,
    status: status,
  );
}

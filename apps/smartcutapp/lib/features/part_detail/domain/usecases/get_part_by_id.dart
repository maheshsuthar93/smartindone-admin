import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/part_detail_model.dart';
import '../repositories/part_detail_repository.dart';

class GetPartById {
  final PartDetailRepository repository;

  GetPartById(this.repository);

  Future<Either<Failure, PartDetailModel>> call({required String id}) async {
    return repository.getPartById(id);
  }
}

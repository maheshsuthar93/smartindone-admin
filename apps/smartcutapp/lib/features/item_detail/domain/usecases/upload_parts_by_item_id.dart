import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/item_detail_repository.dart';

class UploadPartsByItemId {
  final ItemDetailRepository repository;

  UploadPartsByItemId(this.repository);

  Future<Either<Failure, ApiResponse>> call({required dynamic data}) async {
    return repository.uploadPartsByItemId(data: data);
  }
}

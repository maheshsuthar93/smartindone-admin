import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/order_detail_repository.dart';

class UploadItemsByOrderId {
  final OrderDetailRepository repository;

  UploadItemsByOrderId(this.repository);

  Future<Either<Failure, ApiResponse>> call({required dynamic data}) async {
    return repository.uploadItemsByOrderId(data: data);
  }
}

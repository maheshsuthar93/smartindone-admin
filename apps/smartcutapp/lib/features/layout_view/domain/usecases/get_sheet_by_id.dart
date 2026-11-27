import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../data/model/sheet_detail_model.dart';
import '../repositories/layout_view_repository.dart';

class GetSheetById {
  final LayoutViewRepository repository;

  GetSheetById(this.repository);

  Future<Either<Failure, SheetDetailModel>> call({
    required String sheetId,
  }) async {
    return repository.getSheetById(sheetId: sheetId);
  }
}

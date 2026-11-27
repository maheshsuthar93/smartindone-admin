import 'package:board_cut/core/network/api_response.dart';

import '../../model/selected_piece_model.dart';
import '../../model/update_status_response_model.dart';

abstract class SelectedPieceDetailRemoteDataSource {
  Future<SelectedPieceModel> getPieceById({required String pieceId});

  Future<SelectedPieceModel> getPieceByCode({required String pieceCode});

  Future<ApiResponse<UpdateStatusResponseModel>> updatePieceProcessStatus({
    required Map<String, dynamic> data,
  });
}

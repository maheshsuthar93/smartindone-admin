import 'package:board_cut/core/core.dart';

import '../../models/factory_model.dart';

abstract class FactoryRemoteDataSource {
  Future<List<FactoryModel>> getFactories();

  Future<ApiResponse> createFactory({required Map<String, dynamic> data});

  Future<ApiResponse> updateFactory({
    required String factoryId,
    required Map<String, dynamic> data,
  });
}

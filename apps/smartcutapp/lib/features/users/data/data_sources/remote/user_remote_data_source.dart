import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';

abstract class UserRemoteDataSource {
  Future<PaginatedResult<UserModel>> getUsers({
    required int page,
    required int limit,
  });

  Future<ApiResponse> updateUser({
    required String userId,
    required Map<String, dynamic> data,
  });

  Future<ApiResponse> createUser({required Map<String, dynamic> data});
}

import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:fpdart/fpdart.dart';

abstract class UserRepository {
  Future<Either<Failure, PaginatedResult<UserModel>>> getUsers({
    required int page,
    required int limit,
  });

  Future<Either<Failure, ApiResponse>> updateUser({
    required String userId,
    required Map<String, dynamic> data,
  });

  Future<Either<Failure, ApiResponse>> createUser({
    required Map<String, dynamic> data,
  });
}

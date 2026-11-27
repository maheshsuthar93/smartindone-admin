import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/user_repository.dart';
import '../data_sources/remote/user_remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;

  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, PaginatedResult<UserModel>>> getUsers({
    required int page,
    required int limit,
  }) async {
    return safeCall(() => remoteDataSource.getUsers(page: page, limit: limit));
  }

  @override
  Future<Either<Failure, ApiResponse>> updateUser({
    required String userId,
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.updateUser(userId: userId, data: data));

  @override
  Future<Either<Failure, ApiResponse>> createUser({
    required Map<String, dynamic> data,
  }) => safeCall(() => remoteDataSource.createUser(data: data));
}

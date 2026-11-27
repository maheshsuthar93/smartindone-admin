import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/user_repository.dart';

class UpdateUser {
  const UpdateUser(this.repository);

  final UserRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required String userId,
    required Map<String, dynamic> data,
  }) => repository.updateUser(userId: userId, data: data);
}

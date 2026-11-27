import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/user_repository.dart';

class CreateUser {
  const CreateUser(this.repository);

  final UserRepository repository;

  Future<Either<Failure, ApiResponse>> call({
    required Map<String, dynamic> data,
  }) => repository.createUser(data: data);
}

import 'package:fpdart/fpdart.dart';
import 'package:board_cut/core/core.dart';
import 'package:board_cut/shared/shared.dart';
import '../repositories/user_repository.dart';

class GetUsers {
  final UserRepository repository;

  GetUsers(this.repository);

  Future<Either<Failure, PaginatedResult<UserModel>>> call({
    required int page,
    required int limit,
  }) async {
    return repository.getUsers(page: page, limit: limit);
  }
}

import 'package:board_cut/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

import '../repositories/login_repository.dart';

class Login {
  const Login(this.repository);

  final LoginRepository repository;

  Future<Either<Failure, Map<String, dynamic>>> call({
    required String email,
    required String password,
  }) => repository.login(email: email, password: password);
}

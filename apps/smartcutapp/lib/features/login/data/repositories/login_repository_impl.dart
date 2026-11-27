import 'package:board_cut/core/core.dart';
import 'package:fpdart/fpdart.dart';

import '../../domain/repositories/login_repository.dart';
import '../data_sources/remote/login_remote_data_source.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginRepositoryImpl(this.remoteDataSource);

  final LoginRemoteDataSource remoteDataSource;

  @override
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  }) async {
    try {
      return await safeCall(
        () => remoteDataSource.login(email: email, password: password),
      );
    } on Object {
      return const Left(
        Failure.unknown(message: 'Could not securely save the login session.'),
      );
    }
  }
}

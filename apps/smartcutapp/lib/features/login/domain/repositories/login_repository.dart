import 'package:board_cut/core/error/failure.dart';
import 'package:fpdart/fpdart.dart';

abstract class LoginRepository {
  Future<Either<Failure, Map<String, dynamic>>> login({
    required String email,
    required String password,
  });
}

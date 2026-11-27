import 'package:dio/dio.dart';
import 'package:fpdart/fpdart.dart';

import '../error/dio_failure_mapper.dart';
import '../error/failure.dart';

Future<Either<Failure, T>> safeCall<T>(Future<T> Function() call) async {
  try {
    final result = await call();
    return Right(result);
  } on DioException catch (e) {
    return Left(DioFailureMapper.fromError(e));
  } on Exception catch (e) {
    return Left(DioFailureMapper.fromError(e));
  }
}

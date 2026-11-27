import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';

@freezed
sealed class Failure with _$Failure {
  const factory Failure.network({required String message}) = NetworkFailure;

  const factory Failure.timeout({required String message}) = TimeoutFailure;

  const factory Failure.cancelled({required String message}) = CancelledFailure;

  const factory Failure.certificate({required String message}) =
      CertificateFailure;

  const factory Failure.validation({
    required String message,
    int? statusCode,
    dynamic data,
    Map<String, dynamic>? errors,
  }) = ValidationFailure;

  const factory Failure.unauthorized({
    required String message,
    int? statusCode,
    dynamic data,
  }) = UnauthorizedFailure;

  const factory Failure.forbidden({
    required String message,
    int? statusCode,
    dynamic data,
  }) = ForbiddenFailure;

  const factory Failure.notFound({
    required String message,
    int? statusCode,
    dynamic data,
  }) = NotFoundFailure;

  const factory Failure.conflict({
    required String message,
    int? statusCode,
    dynamic data,
  }) = ConflictFailure;

  const factory Failure.rateLimit({
    required String message,
    int? statusCode,
    dynamic data,
  }) = RateLimitFailure;

  const factory Failure.server({
    required String message,
    int? statusCode,
    dynamic data,
  }) = ServerFailure;

  const factory Failure.unknown({
    required String message,
    int? statusCode,
    dynamic data,
  }) = UnknownFailure;
}

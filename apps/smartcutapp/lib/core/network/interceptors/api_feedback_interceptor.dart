import 'package:dio/dio.dart';

import '../api_error_feedback.dart';
import '../../error/dio_failure_mapper.dart';

class ApiFeedbackInterceptor extends Interceptor {
  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    final failure = DioFailureMapper.fromError(err);
    if (err.type != DioExceptionType.cancel) {
      showApiErrorFeedback(failure.message);
    }
    handler.next(err);
  }

  @override
  void onResponse(
    Response<dynamic> response,
    ResponseInterceptorHandler handler,
  ) {
    final data = response.data;
    if (data is Map && data['success'] == false) {
      final message = data['message']?.toString() ?? 'Request failed';
      showApiErrorFeedback(message);
    } else if (data is Map &&
        data['success'] == true &&
        !{
          'GET',
          'HEAD',
          'OPTIONS',
        }.contains(response.requestOptions.method.toUpperCase())) {
      final message = data['message']?.toString() ?? 'Changes saved';
      showApiSuccessFeedback(message);
    }
    handler.next(response);
  }
}

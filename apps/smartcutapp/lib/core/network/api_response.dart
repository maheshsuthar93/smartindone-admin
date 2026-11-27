import 'meta_model.dart';

class ApiResponse<T> {
  final bool success;
  final String message;
  final int statusCode;
  final T? data;
  final PaginationModel? pagination;

  ApiResponse({
    required this.success,
    required this.message,
    required this.statusCode,
    this.data,
    this.pagination,
  });

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) {
    return ApiResponse<T>(
      success: json['success'],
      message: json['message'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? fromJsonT(json['data']) : null,
      pagination: json['pagination'] != null
          ? PaginationModel.fromJson(json['pagination'])
          : null,
    );
  }
}

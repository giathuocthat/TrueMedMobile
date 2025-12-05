import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class BaseResponseModel<T> with BaseResponseModelMappable<T> {
  BaseResponseModel({
    required this.success,
    required this.message,
    required this.errors,
    required this.timestamp,
    required this.data,
  });

  final bool success;
  final String message;
  final T? data;
  final List<dynamic> errors;
  final DateTime timestamp;

  /// CUSTOM PARSER (dart_mappable không parse generic T)
  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) parser,
  ) {
    return BaseResponseModel<T>(
      success: json['success'],
      message: json['message'],
      errors: json['errors'] ?? [],
      timestamp: DateTime.parse(json['timestamp']),
      data: json['data'] != null ? parser(json['data']) : null,
    );
  }
}

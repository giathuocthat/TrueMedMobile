import 'package:dart_mappable/dart_mappable.dart';

part 'base_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class BaseResponseModel<T> with BaseResponseModelMappable<T> {
  BaseResponseModel({
    required this.success,
    required this.message,
    required this.errors,
    this.timestamp,
    required this.data,
  });

  final bool success;
  final String message;
  final T? data;
  final List<String> errors;
  final DateTime? timestamp;

  /// CUSTOM PARSER (dart_mappable không parse generic T)
  factory BaseResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic) parser,
  ) {
    return BaseResponseModel<T>(
      success: json['success'] ?? false,
      message: json['message'] ?? json['detail'] ?? '',
      errors: parseErrors(json['errors']),
      timestamp: json['timestamp'] != null
          ? DateTime.tryParse(json['timestamp'])
          : null,
      data: json['data'] != null ? parser(json['data']) : null,
    );
  }
  static List<String> parseErrors(dynamic errors) {
    if (errors == null) return [];

    // Case 1: { field: message }
    if (errors is Map) {
      return errors.values.map((e) => e.toString()).toList();
    }

    // Case 2: [ "error1", "error2" ]
    if (errors is List) {
      return errors.map((e) => e.toString()).toList();
    }

    // Fallback
    return [errors.toString()];
  }
}

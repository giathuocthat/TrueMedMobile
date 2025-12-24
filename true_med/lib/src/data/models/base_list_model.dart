import '../../domain/entities/base_entity.dart';
//part 'base_list_model.mapper.dart';

//@MappableClass(generateMethods: GenerateMethods.decode)
class BaseListResponseModel<T> extends BaseListResponseEntity<T> {
  BaseListResponseModel({
    required super.success,
    required super.message,
    required super.timestamp,
    List<T>? data,
  }) : super(data: data);

  // factory BaseListResponseModel.fromJson(
  //   //   Map<String, dynamic> json, {
  //   //   required List<T> Function(dynamic json) parser,
  //   // }
  //   Map<String, dynamic> json,
  //   List<T> Function(dynamic json) parser, // 👈 positional
  // ) {
  //   return BaseListResponseModel<T>(
  //     success: json['success'] as bool,
  //     message: json['message'] as String,
  //     timestamp: json['timestamp'] as String,
  //     data: parser(json['data']),
  //   );
  // }

  /// parser nhận 1 item (T), không phải List<T>
  factory BaseListResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) itemParser,
  ) {
    final raw = json['data'];

    final list = (raw is List)
        ? raw.map((e) => itemParser(e as Map<String, dynamic>)).toList()
        : <T>[];

    return BaseListResponseModel<T>(
      success: json['success'] as bool? ?? true, // 🔥 default,
      message: json['message'] as String? ?? '',
      timestamp: json['timestamp'] as String? ?? '',
      data: list,
    );
  }
}

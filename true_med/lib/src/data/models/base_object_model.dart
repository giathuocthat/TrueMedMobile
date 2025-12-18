import '../../domain/entities/base_entity.dart';

//part 'base_object_model.mapper.dart';

//@MappableClass(generateMethods: GenerateMethods.decode)
class BaseObjectResponseModel<T> extends BaseObjectResponseEntity<T> {
  //with BaseObjectResponseModelMappable<T> {
  BaseObjectResponseModel({
    required super.success,
    required super.message,
    //required super.errors,
    required super.timestamp,
    T? data,
  }) : super(data: data);

  //static const fromJson = BaseObjectResponseModelMapper.fromJson;
  factory BaseObjectResponseModel.fromJson(
    Map<String, dynamic> json,
    T Function(dynamic json) parser,
  ) {
    return BaseObjectResponseModel<T>(
      success: json['success'] as bool,
      message: json['message'] as String,
      timestamp: json['timestamp'] as String,
      data: json['data'] == null ? null : parser(json['data']),
    );
  }
}

typedef JsonParser<T> = T Function(Map<String, dynamic> json);
T? parseObject<T>(dynamic json, JsonParser<T> parser) {
  if (json == null) return null;

  if (json is Map<String, dynamic>) {
    return parser(json);
  }

  throw FormatException(
    'Expected Map<String, dynamic> but got ${json.runtimeType}',
  );
}

List<T> parseList<T>(dynamic json, JsonParser<T> parser) {
  if (json == null) return <T>[];

  if (json is List) {
    return json.whereType<Map<String, dynamic>>().map(parser).toList();
  }

  throw FormatException(
    'Expected List<Map<String, dynamic>> but got ${json.runtimeType}',
  );
}

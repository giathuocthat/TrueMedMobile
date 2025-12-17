import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/base_entity.dart';

part 'api_response_meta_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ApiResponseMetaModel extends BaseResponseEntity
    with ApiResponseMetaModelMappable {
  ApiResponseMetaModel({
    required super.success,
    required super.message,
    required super.timestamp,
  });

  static const fromJson = ApiResponseMetaModelMapper.fromJson;
}

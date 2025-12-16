import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/ward_entity.dart';
part 'ward_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class WardResponseModel extends WardResponseEntity
    with WardResponseModelMappable {
  WardResponseModel({
    required super.id,
    required super.name,
    required super.code,
  });

  static const fromJson = WardResponseModelMapper.fromJson;
}

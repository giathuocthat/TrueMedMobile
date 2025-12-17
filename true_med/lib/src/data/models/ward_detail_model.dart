import 'package:dart_mappable/dart_mappable.dart';
import '../../domain/entities/ward_detail_entity.dart';

part 'ward_detail_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class WardDetailResponseModel extends WardDetailResponseEntity
    with WardDetailResponseModelMappable {
  WardDetailResponseModel({
    required super.id,
    required super.name,
    required super.code,
    required super.type,
    required super.provinceId,
    required super.zipCode,
  });
  static const fromJson = WardDetailResponseModelMapper.fromJson;
}

import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/province_entity.dart';
part 'province_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProvinceResponseModel extends ProvinceResponseEntity
    with ProvinceResponseModelMappable {
  ProvinceResponseModel({
    required super.id,
    required super.name,
    required super.code,
    required super.countryId,
  });

  static const fromJson = ProvinceResponseModelMapper.fromJson;
}

import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/brand_entity.dart';

part 'brand_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class BrandResponseModel extends BrandResponseEntity
    with BrandResponseModelMappable {
  BrandResponseModel({
    required super.id,
    required super.name,
    required super.slug,
    super.countryOfOrigin,
    super.logoUrl,
  });

  static const fromJson = BrandResponseModelMapper.fromJson;
}

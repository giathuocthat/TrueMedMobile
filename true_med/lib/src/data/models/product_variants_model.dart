import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/product_variants_entity.dart';

part 'product_variants_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProductVariantsResponseModel extends ProductVariantsResponseEntity
    with ProductVariantsResponseModelMappable {
  ProductVariantsResponseModel({
    required super.id,
    required super.sku,
    required super.barcode,
    required super.price,
    required super.originalPrice,
    required super.stockQuantity,
    super.weight,
    super.dimensions,
    required super.imageUrl,
    required super.isActive,
  });

  static const fromJson = ProductVariantsResponseModelMapper.fromJson;
}

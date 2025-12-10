import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/product_variants_entity.dart';

part 'product_variants_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProductVariantsResponseModel extends ProductVariantsResponseEntity
    with ProductVariantsResponseModelMappable {
  ProductVariantsResponseModel({
    required super.id,
    required super.sku,
    super.barcode,
    required super.price,
    required super.originalPrice,
    required super.stockQuantity,
    super.weight,
    super.dimensions,
    super.imageUrl,
    super.isActive,
    super.maxSalesQuantity,
    super.inventoryStock,
    required super.soldQuantity,
  });

  static const fromJson = ProductVariantsResponseModelMapper.fromJson;
}

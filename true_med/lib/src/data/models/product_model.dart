import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProductResponseModel extends ProductResponseEntity
    with ProductResponseModelMappable {
  ProductResponseModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.shortDescription,
    required super.fullDescription,
    required super.slug,
    required super.thumbnailUrl,
    required super.ingredients,
    required super.usageInstructions,
    super.storageInstructions,
    required super.registrationNumber,
    required super.isPrescriptionDrug,
    required super.isActive,
    required super.isFeatured,
    required super.createdDate,
    super.updatedDate,
    super.drugEfficacy,
    super.dosageInstructions,
  });

  static const fromJson = ProductResponseModelMapper.fromJson;
}

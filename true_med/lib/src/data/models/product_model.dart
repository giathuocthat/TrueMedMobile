import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/product_entity.dart';
import 'brand_model.dart';
import 'category_model.dart';
import 'image_model.dart';
import 'product_variants_model.dart';

part 'product_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProductResponseModel extends ProductResponseEntity
    with ProductResponseModelMappable {
  ProductResponseModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.shortDescription,
    super.fullDescription,
    super.slug,
    super.thumbnailUrl,
    super.ingredients,
    super.usageInstructions,
    super.storageInstructions,
    super.registrationNumber,
    super.isPrescriptionDrug,
    super.isActive,
    super.isFeatured,
    super.createdDate,
    super.updatedDate,
    super.drugEfficacy,
    super.dosageInstructions,
    super.brandName,
    BrandResponseModel? brand,
    CategoryResponseModel? category,
    ProductVariantsResponseModel? variants,
    List<ProductVariantsResponseModel>? productVariants,
    List<ImageResponseModel>? images,
  }) : super(
         brand: brand,
         category: category,
         variants: variants,
         productVariants: productVariants,
         images: images,
       );

  static const fromJson = ProductResponseModelMapper.fromJson;
}

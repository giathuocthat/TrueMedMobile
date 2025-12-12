import 'brand_entity.dart';
import 'category_entity.dart';
import 'image_entity.dart';
import 'product_variants_entity.dart';

class ProductCartEntity {
  ProductCartEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.shortDescription,
    this.fullDescription,
    this.slug,
    this.thumbnailUrl,
    this.ingredients,
    this.usageInstructions,
    this.storageInstructions,
    this.registrationNumber,
    this.isPrescriptionDrug,
    this.isActive,
    this.isFeatured,
    this.createdDate,
    this.updatedDate,
    this.drugEfficacy,
    this.dosageInstructions,
    this.brandName,
    this.brand,
    this.category,
    this.variants,
    this.images,
    this.productVariants,
  });

  final int id;
  final int categoryId;
  final String name;
  final String shortDescription;
  final String? fullDescription;
  final String? slug;
  final String? thumbnailUrl;
  final String? ingredients;
  final String? usageInstructions;
  final String? storageInstructions;
  final String? registrationNumber;
  final bool? isPrescriptionDrug;
  final bool? isActive;
  final bool? isFeatured;
  final String? createdDate;
  final String? updatedDate;
  final String? drugEfficacy;
  final String? dosageInstructions;
  final String? brandName;
  final BrandResponseEntity? brand;
  final CategoryResponseEntity? category;
  final ProductVariantsResponseEntity? variants;
  final List<ImageResponseEntity>? images;
  final List<ProductVariantsResponseEntity>? productVariants;
}

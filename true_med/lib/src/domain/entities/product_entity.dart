import 'brand_entity.dart';
import 'category_entity.dart';
import 'image_entity.dart';
import 'product_variants_entity.dart';

interface class ProductEntity {}

class ProductRequestEntity extends ProductEntity {}

class ProductResponseEntity extends ProductEntity {
  ProductResponseEntity({
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
    this.brand,
    this.category,
    this.variants,
    this.images,
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
  final BrandResponseEntity? brand;
  final CategoryResponseEntity? category;
  final ProductVariantsResponseEntity? variants;
  final List<ImageResponseEntity>? images;
}

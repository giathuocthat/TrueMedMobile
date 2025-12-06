interface class ProductEntity {}

class ProductRequestEntity extends ProductEntity {}

class ProductResponseEntity extends ProductEntity {
  ProductResponseEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.shortDescription,
    required this.fullDescription,
    required this.slug,
    required this.thumbnailUrl,
    required this.ingredients,
    required this.usageInstructions,
    this.storageInstructions,
    required this.registrationNumber,
    required this.isPrescriptionDrug,
    required this.isActive,
    required this.isFeatured,
    required this.createdDate,
    this.updatedDate,
    this.drugEfficacy,
    this.dosageInstructions,
  });

  final int id;
  final int categoryId;
  final String name;
  final String shortDescription;
  final String fullDescription;
  final String slug;
  final String thumbnailUrl;
  final String ingredients;
  final String usageInstructions;
  final String? storageInstructions;
  final String registrationNumber;
  final bool isPrescriptionDrug;
  final bool isActive;
  final bool isFeatured;
  final String createdDate;
  final String? updatedDate;
  final String? drugEfficacy;
  final String? dosageInstructions;
}

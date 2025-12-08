interface class ProductVariantsEntity {}

class ProductVariantsRequestEntity extends ProductVariantsEntity {}

class ProductVariantsResponseEntity extends ProductVariantsEntity {
  ProductVariantsResponseEntity({
    required this.id,
    required this.sku,
    required this.barcode,
    required this.price,
    required this.originalPrice,
    required this.stockQuantity,
    this.weight,
    this.dimensions,
    required this.imageUrl,
    required this.isActive,
  });

  final int id;
  final String sku;
  final String barcode;
  final double price;
  final double originalPrice;
  final double stockQuantity;
  final int? weight;
  final String? dimensions;
  final String imageUrl;
  final bool isActive;
}

interface class ProductVariantsEntity {}

class ProductVariantsRequestEntity extends ProductVariantsEntity {}

class ProductVariantsResponseEntity extends ProductVariantsEntity {
  ProductVariantsResponseEntity({
    required this.id,
    required this.sku,
    this.barcode,
    required this.price,
    required this.originalPrice,
    required this.stockQuantity,
    this.weight,
    this.dimensions,
    this.imageUrl,
    this.isActive,
    this.maxSalesQuantity,
    required this.inventoryStock,
    required this.soldQuantity,
  });

  final int id;
  final String sku;
  final String? barcode;
  final double price;
  final double originalPrice;
  final double stockQuantity;
  final int? maxSalesQuantity;
  final int? inventoryStock;
  final int soldQuantity;
  final int? weight;
  final String? dimensions;
  final String? imageUrl;
  final bool? isActive;
}

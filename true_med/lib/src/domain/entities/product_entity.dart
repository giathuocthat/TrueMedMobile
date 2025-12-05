interface class ProductEntity {}

class ProductRequestEntity extends ProductEntity {}

class ProductResponseEntity extends ProductEntity {
  ProductResponseEntity({
    required this.id,
    required this.name,
    required this.price,
    required this.image,
  });

  final int id;
  final String name;
  final double price;
  final String image;
}

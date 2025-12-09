import 'page_entity.dart';
import 'product_entity.dart';

interface class ProductPageEntity {}

class ProductPageRequestEntity extends ProductPageEntity {}

class ProductPageResponseEntity extends ProductPageEntity {
  ProductPageResponseEntity({required this.data, required this.pagination});

  final List<ProductResponseEntity> data;
  final PageEntity pagination;
}

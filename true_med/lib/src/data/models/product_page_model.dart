import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/product_page_entity.dart';
import 'page_model.dart';
import 'product_model.dart';

part 'product_page_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProductPageResponseModel extends ProductPageResponseEntity
    with ProductPageResponseModelMappable {
  ProductPageResponseModel({
    required List<ProductResponseModel> data,
    required PageResponseModel pagination,
  }) : super(data: data, pagination: pagination);

  static const fromJson = ProductPageResponseModelMapper.fromJson;
}

import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/product_entity.dart';

part 'product_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProductResponseModel extends ProductResponseEntity
    with ProductResponseModelMappable {
  ProductResponseModel({
    required super.id,
    required super.name,
    required super.price,
    required super.image,
  });

  static const fromJson = ProductResponseModelMapper.fromJson;
}

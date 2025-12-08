import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/category_entity.dart';

part 'category_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class CategoryResponseModel extends CategoryResponseEntity
    with CategoryResponseModelMappable {
  CategoryResponseModel({
    required super.id,
    required super.name,
    required super.slug,
    super.parentId,
  });

  static const fromJson = CategoryResponseModelMapper.fromJson;
}

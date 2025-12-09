import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/page_entity.dart';

part 'page_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class PageResponseModel extends PageResponseEntity
    with PageResponseModelMappable {
  PageResponseModel({
    required super.pageNumber,
    required super.pageSize,
    required super.totalCount,
    required super.totalPages,
  });

  static const fromJson = PageResponseModelMapper.fromJson;
}

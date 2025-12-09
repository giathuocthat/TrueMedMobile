import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/page_entity.dart';

part 'pagination_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode, includeTypeId: true)
class PaginationResponseModel<T> extends PaginationResponseEntity<T>
    with PaginationResponseModelMappable<T> {
  PaginationResponseModel({required super.data, required super.page});

  //static const fromJson = PaginationResponseModelMapper.fromJson;
  // 👇 Retrofit sẽ tìm constructor này
  factory PaginationResponseModel.fromJson(Map<String, dynamic> json) =>
      PaginationResponseModelMapper.fromJson(json);
}

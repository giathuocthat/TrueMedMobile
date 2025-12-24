import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/bussiness_type_entity.dart';

part 'bussiness_type_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class BussinessTypeResponseModel extends BussinessTypeResponseEntity
    with BussinessTypeResponseModelMappable {
  BussinessTypeResponseModel({
    required super.id,
    required super.name,
    super.createdDate,
    super.updatedDate,
  });

  static const fromJson = BussinessTypeResponseModelMapper.fromJson;
}

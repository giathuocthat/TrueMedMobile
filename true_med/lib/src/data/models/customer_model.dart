import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/customer_entity.dart';

part 'customer_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class CustomerResponseModel extends CustomerResponseEntity
    with CustomerResponseModelMappable {
  CustomerResponseModel({
    required super.id,
    required super.fullName,
    super.email,
    required super.hasBusinessInfo,
    required super.businessTypeId,
    required super.businessTypeName,
  });

  static const fromJson = CustomerResponseModelMapper.fromJson;
}

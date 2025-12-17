import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/address_shipping_entity.dart';
part 'address_shipping_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class AddressShippingResponseModel extends AddressShippingResponseEntity
    with AddressShippingResponseModelMappable {
  AddressShippingResponseModel({
    required super.id,
    required super.customerId,
    required super.recipientName,
    required super.phoneNumber,
    required super.addressLine,
    required super.wardName,
    required super.provinceName,
    required super.isDefault,
    required super.addressTypeName,
    super.addressType,
    required super.wardId,
    required super.provinceId,
    required super.wardType,
    required super.provinceType,
    required super.fullAddress,
    required super.createdDate,
    super.updatedDate,
  });
  static const fromJson = AddressShippingResponseModelMapper.fromJson;
}

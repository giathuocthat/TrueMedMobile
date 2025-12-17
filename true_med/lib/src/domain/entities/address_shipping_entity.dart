interface class AddressShippingEntity {}

class AddressShippingequestEntity extends AddressShippingEntity {}

class AddressShippingResponseEntity extends AddressShippingEntity {
  AddressShippingResponseEntity({
    required this.id,
    required this.customerId,
    required this.recipientName,
    required this.phoneNumber,
    required this.addressLine,
    required this.wardName,
    required this.provinceName,
    required this.isDefault,
    required this.addressTypeName,
    this.addressType,
    required this.wardId,
    required this.provinceId,
    required this.wardType,
    required this.provinceType,
    required this.fullAddress,
    required this.createdDate,
    this.updatedDate,
  });

  final int id;
  final int customerId;
  final String recipientName;
  final String phoneNumber;
  final String addressLine;
  final int wardId;
  final int provinceId;
  final String wardType;
  final String provinceType;
  final String fullAddress;
  final DateTime createdDate;
  final DateTime? updatedDate;

  final String wardName;
  final String provinceName;
  final bool isDefault;
  final String addressTypeName;
  int? addressType;
}

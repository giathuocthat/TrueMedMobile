import 'address_entity.dart';

interface class ProvinceEntity {}

class ProvinceRequestEntity extends ProvinceEntity {}

class ProvinceResponseEntity extends ProvinceEntity implements AddressItem {
  ProvinceResponseEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.countryId,
  });

  @override
  final int id;

  @override
  final String name;
  final String code;
  final int countryId;

  @override
  late final String normalizedName;
}

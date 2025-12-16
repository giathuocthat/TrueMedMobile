import 'ward_entity.dart';

interface class ProvinceDetailEntity {}

class ProvinceDetailRequestEntity extends ProvinceDetailEntity {}

class ProvinceDetailResponseEntity extends ProvinceDetailEntity {
  ProvinceDetailResponseEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.countryId,
    required this.zipCode,
    required this.wards,
  });

  final int id;
  final String name;
  final String code;
  final String type;
  final int countryId;
  final String zipCode;
  final List<WardResponseEntity> wards;
}

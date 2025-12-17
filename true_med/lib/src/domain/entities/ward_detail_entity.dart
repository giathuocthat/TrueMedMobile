interface class WardDetailEntity {}

class WardDetailRequestEntity extends WardDetailEntity {}

class WardDetailResponseEntity extends WardDetailEntity {
  WardDetailResponseEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.type,
    required this.provinceId,
    required this.zipCode,
    //required this.wards,
  });

  final int id;
  final String name;
  final String code;
  final String type;
  final int provinceId;
  final String zipCode;
  //final List<WardResponseEntity> wards;
}

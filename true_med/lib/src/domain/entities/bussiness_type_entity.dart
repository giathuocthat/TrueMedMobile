interface class BussinessTypeEntity {}

class BussinessTypeRequestEntity extends BussinessTypeEntity {}

class BussinessTypeResponseEntity extends BussinessTypeEntity {
  BussinessTypeResponseEntity({
    required this.id,
    required this.name,
    this.createdDate,
    this.updatedDate,
  });

  final int id;
  final String name;
  final DateTime? createdDate;
  final DateTime? updatedDate;
}

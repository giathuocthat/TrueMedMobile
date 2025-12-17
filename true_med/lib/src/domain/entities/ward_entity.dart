import 'address_entity.dart';
import 'address_shipping_entity.dart';

interface class WardEntity {}

class WardRequestEntity extends WardEntity {}

class WardResponseEntity extends WardEntity implements AddressItem {
  WardResponseEntity({
    required this.id,
    required this.name,
    required this.code,
    this.provinceId,
  });
  @override
  final int id;
  @override
  final String name;
  final String code;
  @override
  late final String normalizedName;
  final int? provinceId;
}

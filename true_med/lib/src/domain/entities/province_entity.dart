import 'brand_entity.dart';
import 'category_entity.dart';
import 'image_entity.dart';
import 'product_variants_entity.dart';

interface class ProvinceEntity {}

class ProvinceRequestEntity extends ProvinceEntity {}

class ProvinceResponseEntity extends ProvinceEntity {
  ProvinceResponseEntity({
    required this.id,
    required this.name,
    required this.code,
    required this.countryId,
  });

  final int id;
  final String name;
  final String code;
  final int countryId;
}

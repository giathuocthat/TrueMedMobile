import 'brand_entity.dart';
import 'category_entity.dart';
import 'image_entity.dart';
import 'product_variants_entity.dart';

interface class WardEntity {}

class WardRequestEntity extends WardEntity {}

class WardResponseEntity extends WardEntity {
  WardResponseEntity({
    required this.id,
    required this.name,
    required this.code,
  });

  final int id;
  final String name;
  final String code;
}

import '../../presentation/features/shipping_address/view/widget/adress_picker_sheet.dart';
import 'brand_entity.dart';
import 'category_entity.dart';
import 'image_entity.dart';
import 'product_variants_entity.dart';

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

String removeVietnameseDiacritics(String input) {
  const vietnamese =
      'àáạảãâầấậẩẫăằắặẳẵ'
      'èéẹẻẽêềếệểễ'
      'ìíịỉĩ'
      'òóọỏõôồốộổỗơờớợởỡ'
      'ùúụủũưừứựửữ'
      'ỳýỵỷỹ'
      'đ'
      'ÀÁẠẢÃÂẦẤẬẨẪĂẰẮẶẲẴ'
      'ÈÉẸẺẼÊỀẾỆỂỄ'
      'ÌÍỊỈĨ'
      'ÒÓỌỎÕÔỒỐỘỔỖƠỜỚỢỞỠ'
      'ÙÚỤỦŨƯỪỨỰỬỮ'
      'ỲÝỴỶỸ'
      'Đ';

  const nonVietnamese =
      'aaaaaaaaaaaaaaaaa'
      'eeeeeeeeeee'
      'iiiii'
      'ooooooooooooooooo'
      'uuuuuuuuuuu'
      'yyyyy'
      'd'
      'AAAAAAAAAAAAAAAAA'
      'EEEEEEEEEEE'
      'IIIII'
      'OOOOOOOOOOOOOOOOO'
      'UUUUUUUUUUU'
      'YYYYY'
      'D';

  var result = input;
  for (int i = 0; i < vietnamese.length; i++) {
    result = result.replaceAll(vietnamese[i], nonVietnamese[i]);
  }
  return result;
}

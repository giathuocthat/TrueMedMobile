import '../../presentation/features/shipping_address/view/widget/adress_picker_sheet.dart';

interface class WardEntity {}

class WardRequestEntity extends WardEntity {}

class WardResponseEntity extends WardEntity implements AddressItem {
  WardResponseEntity({
    required this.id,
    required this.name,
    required this.code,
  });
  @override
  final int id;
  @override
  final String name;
  final String code;
  @override
  late final String normalizedName;
}

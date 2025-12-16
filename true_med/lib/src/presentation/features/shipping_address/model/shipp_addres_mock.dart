import '../../home/model/product_mock.dart';

class AddressEntity {
  final int id;
  final String name;
  final String phone;
  final String fullAddress;
  final int wardId;
  final int districtId;

  final bool isDefault;

  AddressEntity({
    required this.id,
    required this.name,
    required this.phone,
    required this.fullAddress,
    required this.wardId,
    required this.districtId,
    this.isDefault = false,
  });
}

final mockAddressData = [
  AddressEntity(
    id: 1,
    name: "Nhà thuốc 1",
    phone: "0933 575 056",
    fullAddress:
        "141 Nguyễn Thanh Đăng, Phường Phước Hiệp,\nThành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu",
    isDefault: true,
    wardId: 1,
    districtId: 1,
  ),
  AddressEntity(
    id: 2,
    name: "Nhà thuốc 2",
    phone: "0933 575 057",
    fullAddress:
        "142 Nguyễn Thanh Đăng, Phường Phước Hiệp,\nThành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu",
    wardId: 2,
    districtId: 2,
  ),
  AddressEntity(
    id: 3,
    name: "Nhà thuốc 3",
    phone: "0933 575 058",
    fullAddress:
        "143 Nguyễn Thanh Đăng, Phường Phước Hiệp,\nThành phố Bà Rịa, Tỉnh Bà Rịa - Vũng Tàu",
    wardId: 3,
    districtId: 3,
  ),
];

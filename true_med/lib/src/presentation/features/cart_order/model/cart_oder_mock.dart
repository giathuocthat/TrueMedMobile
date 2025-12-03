import '../../home/model/product_mock.dart';

class ShopCartMock {
  final String shopId;
  final String shopName;
  final String shopLogo;
  final List<ProductMock> products;

  ShopCartMock({
    required this.shopId,
    required this.shopName,
    required this.shopLogo,
    required this.products,
  });
}

final mockCartData = [
  ShopCartMock(
    shopId: "shop_ugreen",
    shopName: "Merakishop",
    shopLogo:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    products: [
      ProductMock(
        name: "Neutri Fore Bidiphar (hộp/100 Viên Nén)",
        name_stock: "Hôp 10 vĩ, mỗi vĩ 10 Viên Nén",
        image:
            "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
        manufacturer: "Bidiphar",
        price: 127100,
        oldPrice: 141800,
        discount: 3,
        isShowStock: true,
        hasAlternative: true,
        isDiscount: true,
        isCombo: false,
        isPromotion: true,
        isNearOut: true,
        stock: 947,
      ),
      ProductMock(
        name: "Cefixim 200mg Pharimexco (h/20v)",
        name_stock: "Hôp/100 Viên Nén",
        image:
            "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
        manufacturer: "MEDX",
        price: 32000,
        oldPrice: 0,
        discount: 0,
        isShowStock: false,
        hasAlternative: false,
        isDiscount: false,
        isCombo: false,
        isNearOut: false,
        stock: 0,
      ),
      ProductMock(
        name: "Cefixim 200mg",
        name_stock: "Hôp/100 Viên Nén",
        image:
            "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
        manufacturer: "MEDX",
        price: 32000,
        oldPrice: 35300,
        discount: 8,
        isShowStock: true,
        hasAlternative: true,
        isDiscount: false,
        isCombo: false,
        isNearOut: true,
        stock: 133,
      ),
    ],
  ),

  // -----------------------------------------------------
  ShopCartMock(
    shopId: "shop_minoristore",
    shopName: "minoristore",
    shopLogo:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    products: [
      ProductMock(
        name: "Gel Năng Lượng Bổ Sung Mix Vị",
        name_stock: "5 gói Mix vị",
        image:
            "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
        manufacturer: "minori",
        price: 294000,
        oldPrice: 320000,
        discount: 8,
        isShowStock: true,
        isDiscount: true,
        hasAlternative: false,
        isCombo: false,
        isPromotion: true,
        isNearOut: false,
        stock: 52,
      ),
    ],
  ),
];

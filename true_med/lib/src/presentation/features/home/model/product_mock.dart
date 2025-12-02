class ProductMock {
  final String name_stock;
  final String name;
  final String image;
  final String manufacturer;
  final double price;
  final double oldPrice;
  final int stock;
  final int discount;
  final bool isDiscount;
  final bool isCombo;
  final bool isNearOut;
  final bool hasAlternative;
  final bool isPromotion;

  ProductMock({
    required this.name,
    required this.name_stock,
    required this.image,
    required this.manufacturer,
    this.price = 0,
    this.oldPrice = 0,
    this.stock = 0,
    this.discount = 0,
    this.isDiscount = false,
    this.isCombo = false,
    this.isNearOut = false,
    this.hasAlternative = false,
    this.isPromotion = false,
  });
}

final mockProducts = [
  ProductMock(
    name: "Neutri Fore Bidiphar (hộp/100 Viên Nén)",
    name_stock: "Hôp 10 vĩ, mỗi vĩ 10 Viên Nén",
    image:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    manufacturer: "Bidiphar",
    price: 127100,
    oldPrice: 141800,
    discount: 3,
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
    hasAlternative: false,
    isDiscount: false,
    isCombo: false,
    isNearOut: false,
    stock: 133,
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
    hasAlternative: true,
    isDiscount: false,
    isCombo: false,
    isNearOut: true,
    stock: 133,
  ),
  ProductMock(
    name: "Cefixim 300mg",
    name_stock: "Hôp/100 Viên Nén",
    image:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    manufacturer: "MEDX",
    price: 32000,
    oldPrice: 35300,
    discount: 10,
    hasAlternative: true,
    isDiscount: true,
    isCombo: false,
    isNearOut: true,
    stock: 133,
  ),
  ProductMock(
    name: "Cefixim 400mg",
    name_stock: "Hôp/100 Viên Nén",
    image:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    manufacturer: "MEDX",
    price: 32000,
    oldPrice: 35300,
    discount: 18,
    hasAlternative: true,
    isDiscount: true,
    isCombo: false,
    isNearOut: true,
    stock: 133,
  ),
  ProductMock(
    name: "Cefixim 500mg",
    name_stock: "Hôp/100 Viên Nén",
    image:
        "https://raw.githubusercontent.com/TaqBostan/content/refs/heads/main/labeled-2.png",
    manufacturer: "MEDX",
    price: 32000,
    oldPrice: 35300,
    discount: 28,
    hasAlternative: true,
    isDiscount: false,
    isCombo: false,
    isNearOut: true,
    stock: 133,
  ),
];

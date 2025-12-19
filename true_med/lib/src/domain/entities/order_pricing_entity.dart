class OrderPricingEntity {
  OrderPricingEntity({
    required this.subtotal,
    required this.shippingFee,
    required this.discount,
    required this.total,
  });

  final double subtotal;
  final double shippingFee;
  final double discount;
  final double total;
}

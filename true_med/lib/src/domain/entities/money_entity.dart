import 'cart_entity.dart';
import 'order_entity.dart';

interface class MoneyEntity {}

class OrderPricingEntity {
  OrderPricingEntity({
    required this.moneyTotal,
    required this.shippingFee,
    required this.discountAmount,
    required this.orderItems,
    required this.moneyFinal,
    required this.paymentMethod,
  });
  final double moneyFinal;
  final double moneyTotal;
  final double shippingFee;
  final double discountAmount;
  final String paymentMethod;
  final List<CartItemEntity> orderItems;
}

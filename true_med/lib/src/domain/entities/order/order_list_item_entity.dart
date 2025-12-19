interface class OrderListItemEntity {}

class OrderListItemResponseEntity extends OrderListItemEntity {
  OrderListItemResponseEntity({
    required this.id,
    required this.orderNumber,
    required this.customerName,
    required this.customerPhone,
    this.customerEmail,
    required this.createdDate,
    required this.orderStatus,
    required this.paymentStatus,
    required this.totalAmount,
  });

  final int id;
  final String orderNumber;
  final String customerName;
  final String customerPhone;
  String? customerEmail;
  final String createdDate;
  final String orderStatus;
  final String paymentStatus;
  final double totalAmount;
}

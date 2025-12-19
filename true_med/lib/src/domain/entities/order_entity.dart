import 'order_item_entity.dart';

interface class OrderEntity {}

class OrderRequestEntity extends OrderEntity {
  OrderRequestEntity({
    required this.customerFullName,
    required this.customerEmail,
    required this.customerPhone,
    required this.orderItems,
    required this.paymentMethod,
    required this.shippingFee,
    required this.discountAmount,
    required this.shippingName,
    required this.shippingAddress,
    required this.shippingPhone,
    required this.wardId,
    required this.provinceId,
    this.note,
  });

  final String customerFullName;
  final String customerEmail;
  final String customerPhone;
  final List<OrderItemEntity> orderItems;
  final String paymentMethod;
  final double shippingFee;
  final double discountAmount;
  final String shippingName;
  final String shippingAddress;
  final String shippingPhone;
  final int wardId;
  final int provinceId;
  final String? note;
}

class OrderResponseEntity extends OrderEntity {
  OrderResponseEntity({
    required this.id,
    required this.orderNumber,
    required this.customerId,
    required this.customerName,
    required this.customerEmail,
    required this.customerPhone,
    required this.createdDate,
    required this.orderStatus,
    required this.paymentStatus,
    required this.paymentMethod,
    required this.subTotal,
    required this.shippingFee,
    required this.discountAmount,
    required this.totalAmount,
    required this.shippingName,
    required this.shippingAddress,
    required this.shippingPhone,
    required this.wardId,
    required this.wardName,
    required this.provinceId,
    required this.provinceName,
    this.countryId,
    this.countryName,
    required this.deliveryStatus,
    this.shippingCarrier,
    this.trackingNumber,
    this.shippedDate,
    this.deliveredDate,
    this.deliveryNotes,
    this.note,
    required this.orderItems,
  });
  final int id;
  final String orderNumber;
  final int customerId;
  final String customerName;
  final String customerEmail;
  final String customerPhone;
  final DateTime createdDate;
  final String orderStatus;
  final String paymentStatus;

  final String paymentMethod;
  final double subTotal;
  final double shippingFee;

  final double discountAmount;
  final double totalAmount;
  final String shippingName;
  final String shippingAddress;
  final String shippingPhone;
  final int wardId;
  final String wardName;
  final int provinceId;
  final String provinceName;
  final int? countryId;
  final String? countryName;
  final String deliveryStatus;
  final String? shippingCarrier;
  final String? trackingNumber;
  final DateTime? shippedDate;
  final DateTime? deliveredDate;
  final String? deliveryNotes;
  final String? note;
  final List<OrderItemResponseEntity> orderItems;
}

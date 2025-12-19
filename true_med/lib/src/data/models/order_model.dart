import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/order_entity.dart';
import 'order_item_model.dart';
part 'order_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.encode)
class OrderRequestModel with OrderRequestModelMappable {
  OrderRequestModel({
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
  final List<OrderItemRequestModel> orderItems;
  final String paymentMethod;
  final double shippingFee;
  final double discountAmount;
  final String shippingName;
  final String shippingAddress;
  final String shippingPhone;
  final int wardId;
  final int provinceId;
  final String? note;

  factory OrderRequestModel.fromEntity(OrderRequestEntity entity) {
    return OrderRequestModel(
      customerFullName: entity.customerFullName,
      customerEmail: entity.customerEmail,
      customerPhone: entity.customerPhone,
      orderItems: entity.orderItems
          .map(OrderItemRequestModel.fromEntity)
          .toList(),
      paymentMethod: entity.paymentMethod,
      shippingFee: entity.shippingFee,
      discountAmount: entity.discountAmount,
      shippingName: entity.shippingName,
      shippingAddress: entity.shippingAddress,
      shippingPhone: entity.shippingPhone,
      wardId: entity.wardId,
      provinceId: entity.provinceId,
      note: entity.note,
    );
  }
}

@MappableClass(generateMethods: GenerateMethods.decode)
class OrderResponseModel extends OrderResponseEntity
    with OrderResponseModelMappable {
  OrderResponseModel({
    required super.id,
    required super.orderNumber,
    required super.customerId,
    required super.customerName,
    required super.customerEmail,
    required super.customerPhone,
    required super.createdDate,
    required super.orderStatus,
    required super.paymentStatus,
    required super.paymentMethod,
    required super.subTotal,
    required super.shippingFee,
    required super.discountAmount,
    required super.totalAmount,
    required super.shippingName,
    required super.shippingAddress,
    required super.shippingPhone,
    required super.wardId,
    required super.wardName,
    required super.provinceId,
    required super.provinceName,
    required super.countryId,
    required super.countryName,
    required super.deliveryStatus,
    super.shippingCarrier,
    super.trackingNumber,
    super.shippedDate,
    super.deliveredDate,
    super.deliveryNotes,
    super.note,
    required List<OrderItemResponseModel> orderItems,
  }) : super(orderItems: orderItems);

  static const fromJson = OrderResponseModelMapper.fromJson;
}

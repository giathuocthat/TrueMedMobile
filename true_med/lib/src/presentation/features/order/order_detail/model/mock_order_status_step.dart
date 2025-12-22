final stepComplete = [
  OrderStatusStep(
    type: OrderStatusType.pending,
    title: 'Chờ xác nhận',
    time: DateTime.parse("2024-11-20T18:31:47"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.confirmed,
    title: 'Đã xác nhận',
    time: DateTime.parse("2024-11-20T18:33:14"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.processing,
    title: 'Đang xử lý',
    time: DateTime.parse("2024-11-21T14:35:18"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.shipping,
    title: 'Đang trung chuyển',
    time: DateTime.parse("2024-11-22T01:59:33"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.delivering,
    title: 'Đang giao',
    time: DateTime.parse("2024-11-22T10:38:53"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.completed,
    title: 'Hoàn tất',
    time: DateTime.parse("2024-11-22T11:46:31"),
    isActive: true,
  ),
];
final stepAll = [
  OrderStatusStep(
    type: OrderStatusType.pending,
    title: 'Chờ xác nhận',
    time: DateTime.parse("2024-11-20T18:31:47"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.confirmed,
    title: 'Đã xác nhận',
    time: DateTime.parse("2024-11-20T18:33:14"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.processing,
    title: 'Đang xử lý',
    time: DateTime.parse("2024-11-21T14:35:18"),
    isActive: false,
  ),
  OrderStatusStep(
    type: OrderStatusType.shipping,
    title: 'Đang trung chuyển',
    time: DateTime.parse("2024-11-22T01:59:33"),
    isActive: false,
  ),
  OrderStatusStep(
    type: OrderStatusType.delivering,
    title: 'Đang giao',
    time: DateTime.parse("2024-11-22T10:38:53"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.completed,
    title: 'Hoàn tất',
    time: DateTime.parse("2024-11-22T11:46:31"),
    isActive: false,
  ),
];
final stepCancel = [
  OrderStatusStep(
    type: OrderStatusType.pending,
    title: 'Chờ xác nhận',
    time: DateTime.parse("2025-12-03T19:13:53"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.confirmed,
    title: 'Đã xác nhận',
    time: DateTime.parse("2025-12-03T19:13:53"),
    isActive: true,
  ),
  OrderStatusStep(
    type: OrderStatusType.cancelled,
    title: 'Đã huỷ',
    time: DateTime.parse("2025-12-08T10:49:28"),
    isActive: true,
  ),
];

enum OrderStatusType {
  pending,
  confirmed,
  processing,
  shipping,
  delivering,
  delivered,
  completed,
  cancelled,
}

class OrderStatusStep {
  final OrderStatusType type;
  final String title;
  final DateTime? time;
  final bool isActive; // đã đi qua hay chưa

  OrderStatusStep({
    required this.type,
    required this.title,
    this.time,
    required this.isActive,
  });
}

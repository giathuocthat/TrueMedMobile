import 'dart:ffi';

interface class BaseEntity {}

class BaseRequestEntity extends BaseEntity {}

class BaseListResponseEntity<T> extends BaseEntity {
  BaseListResponseEntity({
    this.data,
    required this.success,
    required this.message,
    required this.timestamp,
  });

  final List<T>? data;
  final bool success;
  final String message;
  final String timestamp;
}

class BaseObjectResponseEntity<T> extends BaseEntity {
  BaseObjectResponseEntity({
    required this.data,
    required this.success,
    required this.message,
    required this.timestamp,
  });

  final T? data;
  final bool success;
  final String message;
  final String timestamp;
}

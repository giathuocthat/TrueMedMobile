//enum Status { initial, loading, success, error }

enum Status {
  initial, // chưa làm gì
  loading, // đang gọi API
  success, // thành công thật
  invalid, // dữ liệu sai (validation)
  empty, // không có data
  error, // lỗi hệ thống
}

extension StatusExtension on Status {
  bool get isInitial => this == Status.initial;
  bool get isLoading => this == Status.loading;
  bool get isSuccess => this == Status.success;
  bool get isError => this == Status.error;
  bool get isEmpty => this == Status.empty;
  bool get isInvalid => this == Status.invalid;
}

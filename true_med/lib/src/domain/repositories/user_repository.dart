import '../entities/customer_entity.dart';

abstract class UserRepository {
  /// Lấy user từ cache (SharedPreferences / secure storage)
  Future<CustomerResponseEntity?> getCachedUser();

  /// Lưu user vào cache (khi remember me)
  Future<void> saveUser(CustomerResponseEntity user);

  /// Xoá user cache (logout / token invalid)
  Future<void> clearUser();

  /// (Optional) Lấy user từ server
  //Future<CustomerResponseEntity> fetchProfile();
}

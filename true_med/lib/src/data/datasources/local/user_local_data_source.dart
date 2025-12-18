import 'dart:convert';

import '../../../domain/entities/customer_entity.dart';
import '../../services/cache/cache_service.dart';

// class UserLocalDataSource {
//   UserLocalDataSource(this.prefs);

//   final SharedPreferences prefs;
//   static const _keyUser = 'cached_user';

//   Future<void> saveUser(CustomerResponseEntity user) async {
//     await prefs.setString(_keyUser, jsonEncode(user.toJson()));
//   }

//   CustomerResponseEntity? getUser() {
//     final json = prefs.getString(_keyUser);
//     if (json == null) return null;
//     return CustomerResponseEntity.fromJson(jsonDecode(json));
//   }

//   Future<void> clear() async {
//     await prefs.remove(_keyUser);
//   }
// }

class UserLocalDataSource {
  UserLocalDataSource(this.cache);

  final CacheService cache;

  static const _key = CacheKey.cachedUser;

  Future<void> saveUser(CustomerResponseEntity user) async {
    await cache.save<String>(_key, jsonEncode(user.toJson()));
  }

  CustomerResponseEntity? getUser() {
    final json = cache.get<String>(_key);
    if (json == null) return null;

    return CustomerResponseEntity.fromJson(
      jsonDecode(json) as Map<String, dynamic>,
    );
  }

  Future<void> clear() {
    return cache.remove([_key]);
  }
}

import '../../core/base/exceptions.dart';
import '../../core/base/failure.dart';
import '../../core/base/result.dart';
import '../../domain/entities/login_entity.dart';
import '../../domain/entities/sign_up_entity.dart';
import '../../domain/repositories/authentication_repository.dart';
import '../models/api_response_error_model.dart';
import '../models/authen_model.dart';
import '../models/base_model.dart';
import '../models/login_model.dart';
import '../models/login_phone_model.dart';
import '../models/sign_up_model.dart';
import '../services/cache/cache_service.dart';
import '../services/network/rest_client.dart';

final class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({required this.remote, required this.local});

  final RestClient remote;
  final CacheService local;

  @override
  Future<Result<LoginResponseEntity, Failure>> login(
    LoginRequestEntity data,
  ) async {
    return asyncGuard(() async {
      final model = LoginRequestModel.fromEntity(data);
      final response = await remote.login(model.toJson());

      final base = BaseResponseModel.fromJson(
        response.data,
        (json) => AuthenResponseModel.fromJson(json),
      );

      // Kiểm tra nếu login không thành công
      if (base.data == null || base.data?.accessToken == null) {
        throw UnauthorizedException(message: base.message);
      }

      // Kiểm tra nếu customer null
      // if (base.data?.customer == null) {
      //   throw const ValidationException(
      //     message: 'Thông tin khách hàng không hợp lệ.',
      //     field: 'customer',
      //   );
      // }

      // Save the session if the user has selected the "Remember Me" option
      if (data.shouldRemeber ?? false) await _saveSession();

      return LoginResponseEntity(
        accessToken: base.data!.accessToken!,
        customer: base.data!.customer,
      );
    });
  }

  @override
  Future<Result<LoginResponseEntity, Failure>> loginPhone(
    LoginPhoneRequestEntity data,
  ) async {
    return asyncGuard(() async {
      final response = await remote.loginPhone(data.toJson());

      final base = BaseResponseModel.fromJson(
        response.data,
        (json) => AuthenResponseModel.fromJson(json),
      );

      // Kiểm tra nếu login không thành công
      if (base.data == null || base.data?.accessToken == null) {
        throw UnauthorizedException(message: base.message);
      }

      // Kiểm tra nếu customer null
      if (base.data?.customer == null) {
        throw const ValidationException(
          message: 'Thông tin khách hàng không hợp lệ.',
          field: 'customer',
        );
      }

      // Save the session if the user has selected the "Remember Me" option
      if (data.shouldRemeber ?? false) await _saveSession();

      return LoginResponseEntity(
        accessToken: base.data!.accessToken!,
        customer: base.data!.customer,
      );
    });
  }

  @override
  Future<Result<ApiResponseErrorResponseModel, Failure>> checkExisting(
    String phoneNumber,
    String? email,
  ) async {
    return asyncGuard(() async {
      if (email != null && email.isNotEmpty) {
        final response = await remote.checkExisting(({
          'phoneNumber': phoneNumber,
          'email': email,
        }));

        return response.data;
      } else {
        final response = await remote.checkExisting(({
          'phoneNumber': phoneNumber,
        }));

        return response.data;
      }
    });
  }

  @override
  Future<Result<void, Failure>> sendOTP(String phoneNumber, int type) async {
    return asyncGuard(() async {
      final response = await remote.sendOTP(({
        'phoneNumber': phoneNumber,
        'type': type,
      }));

      return response.data;
    });
  }

  @override
  Future<Result<void, Failure>> verifyOTP(
    String phoneNumber,
    String otpCode,
  ) async {
    return asyncGuard(() async {
      final response = await remote.verifyOtp(({
        'phone': phoneNumber,
        'otpCode': otpCode,
      }));

      return response.data;
    });
  }

  Future<void> _saveSession() async {
    await local.save(CacheKey.isLoggedIn, true);
  }

  /// Manages the "Remember Me" functionality.
  ///
  /// When [rememberMe] is null, retrieves the current setting from cache.
  /// When [rememberMe] has a value, updates the setting in cache.
  /// Returns the current or newly saved value, defaulting to false on errors.
  @override
  Future<bool> rememberMe({bool? rememberMe}) async {
    try {
      if (rememberMe == null) {
        return local.get<bool>(CacheKey.rememberMe) ?? false;
      }

      await local.save(CacheKey.rememberMe, rememberMe);

      return rememberMe;
    } catch (e) {
      return false;
    }
  }

  @override
  Future<String> forgotPassword(Map<String, dynamic> data) {
    // TODO: implement forgotPassword
    throw UnimplementedError();
  }

  @override
  Future<String> resetPassword(Map<String, dynamic> data) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  @override
  Future<String> resendOTP(Map<String, dynamic> data) {
    // TODO: implement resendOTP
    throw UnimplementedError();
  }

  @override
  Future<void> logout() async {
    await local.remove([CacheKey.isLoggedIn, CacheKey.rememberMe]);
  }

  @override
  Future<Result<LoginResponseEntity, Failure>> refreshToken() async {
    return asyncGuard(() async {
      final request = LoginRequestEntity(
        phoneNumber: '0976973925',
        password: 'Hgsg@123',
        shouldRemeber: true,
      );
      final model = LoginRequestModel.fromEntity(request);
      final response = await remote.login(model.toJson());

      final base = BaseResponseModel.fromJson(
        response.data,
        (json) => AuthenResponseModel.fromJson(json),
      );

      // Save the session if the user has selected the "Remember Me" option
      if (request.shouldRemeber ?? false) await _saveSession();

      //return base.data!;
      return LoginResponseEntity(
        accessToken: base.data?.accessToken ?? '',
        customer: base.data?.customer,
      );
    });
  }

  @override
  Future<Result<LoginResponseEntity, Failure>> register(
    SignUpRequestEntity data,
  ) async {
    return asyncGuard(() async {
      final response = await remote.register(data.toJson());

      // final base = BaseResponseModel.fromJson(
      //   response.data,
      //   (json) => AuthenResponseModel.fromJson(json),
      // );

      final base = BaseResponseModel<Map<String, dynamic>>.fromJson(
        response.data,
        (json) => json,
      );
      // Kiểm tra nếu login không thành công
      if (base.message.isNotEmpty) {
        throw UnauthorizedException(message: base.message);
      }
      final auth = AuthenResponseModel.fromJson(response.data);

      // Kiểm tra nếu customer null
      // if (base.data?.customer == null) {
      //   throw const ValidationException(
      //     message: 'Thông tin khách hàng không hợp lệ.',
      //     field: 'customer',
      //   );
      // }

      // Save the session if the user has selected the "Remember Me" option
      //if (request.shouldRemeber ?? false)
      //await _saveSession();

      //return base.data!;
      return LoginResponseEntity(
        accessToken: auth.accessToken ?? '',
        customer: auth.customer,
      );
    });
  }
}

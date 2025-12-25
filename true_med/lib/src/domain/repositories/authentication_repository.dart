import '../../core/base/failure.dart';
import '../../core/base/repository.dart';
import '../../core/base/result.dart';
import '../../data/models/api_response_error_model.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';

abstract base class AuthenticationRepository extends Repository {
  Future<Result<ApiErrorResponseModel, Failure>> register(
    SignUpRequestEntity data,
  );

  Future<Result<LoginResponseEntity, Failure>> login(LoginRequestEntity data);

  Future<bool> rememberMe({bool? rememberMe});

  Future<String> forgotPassword(Map<String, dynamic> data);

  Future<String> resetPassword(Map<String, dynamic> data);

  //Future<String> verifyOTP(Map<String, dynamic> data);

  Future<String> resendOTP(Map<String, dynamic> data);

  Future<Result<LoginResponseEntity, Failure>> refreshToken();

  Future<void> logout();

  Future<Result<ApiResponseErrorResponseModel, Failure>> checkExisting(
    String phoneNumber,
    String? email,
  );

  Future<Result<void, Failure>> sendOTP(String phoneNumber, int type);
  Future<Result<void, Failure>> verifyOTP(String phoneNumber, String otpCode);

  //Future<String> resendOTP(Map<String, dynamic> data);
}

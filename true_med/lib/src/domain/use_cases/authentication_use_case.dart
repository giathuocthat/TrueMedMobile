import '../../core/base/result.dart';
import '../../data/models/api_response_error_model.dart';
import '../../data/models/api_response_meta_model.dart';
import '../entities/login_entity.dart';
import '../entities/sign_up_entity.dart';
import '../repositories/authentication_repository.dart';

final class RegisterUseCase {
  RegisterUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<ApiErrorResponseModel, String>> call(
    SignUpRequestEntity request,
  ) async {
    final result = await repository.register(request);
    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class LoginUseCase {
  LoginUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<LoginResponseEntity, String>> call({
    required String email,
    required String password,
    bool? shouldRemember,
  }) async {
    final request = LoginRequestEntity(
      phoneNumber: email,
      password: password,
      shouldRemeber: shouldRemember,
    );

    final result = await repository.login(request);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class LoginPhoneUseCase {
  LoginPhoneUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<LoginResponseEntity, String>> call({
    required String phone,
    required String otp,
    bool? shouldRemember,
  }) async {
    final request = LoginPhoneRequestEntity(
      phoneNumber: phone,
      otp: otp,
      shouldRemeber: shouldRemember,
    );

    final result = await repository.loginPhone(request);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class CheckRememberMeUseCase {
  CheckRememberMeUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<bool> call() async {
    return repository.rememberMe();
  }
}

final class SaveRememberMeUseCase {
  SaveRememberMeUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<bool> call(bool rememberMe) async {
    return repository.rememberMe(rememberMe: rememberMe);
  }
}

final class LogoutUseCase {
  LogoutUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<void> call() async {
    return repository.logout();
  }
}

final class CheckExitingPhoneEmailUseCase {
  CheckExitingPhoneEmailUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<ApiResponseErrorResponseModel, String>> call({
    required String phone,
    String? email,
  }) async {
    final result = await repository.checkExisting(phone, email);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class SendOTPUseCase {
  SendOTPUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<void, String>> call({
    required String phone,
    required int type,
  }) async {
    final result = await repository.sendOTP(phone, type);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

final class VerifyOTPUseCase {
  VerifyOTPUseCase(this.repository);

  final AuthenticationRepository repository;

  Future<Result<void, String>> call({
    required String phone,
    required String otpCode,
  }) async {
    final result = await repository.verifyOTP(phone, otpCode);

    return switch (result) {
      Success(:final data) => Success(data),
      Error(:final error) => Error(error.message),
      _ => const Error('Something went wrong'),
    };
  }
}

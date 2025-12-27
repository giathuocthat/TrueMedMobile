import 'customer_entity.dart';

interface class LoginEntity {}

class LoginRequestEntity extends LoginEntity {
  LoginRequestEntity({
    required this.phoneNumber,
    required this.password,
    this.shouldRemeber = false,
  });

  final String phoneNumber;
  final String password;
  final bool? shouldRemeber;
}

class LoginPhoneRequestEntity extends LoginEntity {
  LoginPhoneRequestEntity({
    required this.phoneNumber,
    required this.otp,
    this.shouldRemeber = false,
  });

  final String phoneNumber;
  final String otp;
  final bool? shouldRemeber;
}

class LoginResponseEntity extends LoginEntity {
  LoginResponseEntity({required this.accessToken, this.customer});

  final String accessToken;
  final CustomerResponseEntity? customer;
}

class RegisterResponseEntity extends LoginEntity {
  RegisterResponseEntity({
    required this.accessToken,
    required this.message,
    this.customer,
    required this.isSuccess,
  });

  final String accessToken;
  final String message;
  final bool isSuccess;
  final CustomerResponseEntity? customer;
}

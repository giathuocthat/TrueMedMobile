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

class LoginResponseEntity extends LoginEntity {
  LoginResponseEntity({required this.accessToken, this.customer});

  final String accessToken;
  final CustomerResponseEntity? customer;
}

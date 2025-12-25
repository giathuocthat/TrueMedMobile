interface class SignUpEntity {}

class SignUpRequestEntity extends SignUpEntity {
  SignUpRequestEntity({
    required this.fullName,
    required this.email,
    required this.phoneNumber,
    required this.password,
    required this.confirmPassword,
    required this.businessTypeId,
    required this.provinceId,
    required this.wardId,
    required this.address,
    required this.otpCode,
  });

  final String fullName;
  final String email;
  final String phoneNumber;
  final String password;
  final String confirmPassword;
  final int businessTypeId;
  final int provinceId;
  final int wardId;
  final String address;
  final String otpCode;
}

class SignUpResponseEntity extends SignUpEntity {
  SignUpResponseEntity({required this.accessToken});

  final String accessToken;
}

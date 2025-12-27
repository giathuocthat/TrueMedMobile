import '../../domain/entities/sign_up_entity.dart';

extension SignUpRequestModel on SignUpRequestEntity {
  Map<String, dynamic> toJson() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'password': password,
      'confirmPassword': confirmPassword,
      'businessTypeId': businessTypeId,
      'provinceId': provinceId,
      'wardId': wardId,
      'address': address,
      'otp': otpCode,
    };
  }
}

class SignUpResponseModel extends SignUpResponseEntity {
  SignUpResponseModel({required super.accessToken});

  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) {
    return SignUpResponseModel(accessToken: json['access_token']);
  }
}

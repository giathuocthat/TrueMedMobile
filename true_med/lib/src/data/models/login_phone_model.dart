import '../../domain/entities/login_entity.dart';

extension LoginPhoneRequestModel on LoginPhoneRequestEntity {
  Map<String, dynamic> toJson() {
    return {'phoneNumber': phoneNumber, 'otpCode': otp};
  }
}

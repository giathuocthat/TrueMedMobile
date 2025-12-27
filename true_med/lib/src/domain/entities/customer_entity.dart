interface class CustomerEntity {}

class CustomerRequestEntity extends CustomerEntity {}

class CustomerResponseEntity extends CustomerEntity {
  CustomerResponseEntity({
    required this.id,
    required this.fullName,
    this.email,
    this.hasBusinessInfo,
    required this.businessTypeId,
    required this.businessTypeName,
    this.phoneNumber,
    this.isVerified,
  });

  final int id;
  final String fullName;
  final String? email;
  final bool? hasBusinessInfo;
  final bool? isVerified;
  final int businessTypeId;
  final String businessTypeName;
  final String? phoneNumber;

  // ✅ FROM JSON (an toàn null)
  factory CustomerResponseEntity.fromJson(Map<String, dynamic> json) {
    return CustomerResponseEntity(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      hasBusinessInfo: json['hasBusinessInfo'] as bool?,
      isVerified: json['isVerified'] as bool?,
      businessTypeId: json['businessTypeId'] as int,
      businessTypeName: json['businessTypeName'] as String,
    );
  }

  // ✅ TO JSON (không gửi field null)
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{
      'id': id,
      'fullName': fullName,
      'businessTypeId': businessTypeId,
      'businessTypeName': businessTypeName,
    };

    if (email != null) data['email'] = email;
    if (phoneNumber != null) data['phoneNumber'] = phoneNumber;
    if (hasBusinessInfo != null) {
      data['hasBusinessInfo'] = hasBusinessInfo;
    }
    if (isVerified != null) {
      data['isVerified'] = isVerified;
    }

    return data;
  }
}

interface class CustomerEntity {}

class CustomerRequestEntity extends CustomerEntity {}

class CustomerResponseEntity extends CustomerEntity {
  CustomerResponseEntity({
    required this.id,
    required this.fullName,
    this.email,
    required this.hasBusinessInfo,
    required this.businessTypeId,
    required this.businessTypeName,
  });

  final int id;
  final String fullName;
  final String? email;
  final bool hasBusinessInfo;
  final int businessTypeId;
  final String businessTypeName;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'fullName': fullName,
      'email': email,
      'hasBusinessInfo': hasBusinessInfo,
      'businessTypeId': businessTypeId,
      'businessTypeName': businessTypeName,
    };
  }

  factory CustomerResponseEntity.fromJson(Map<String, dynamic> json) {
    return CustomerResponseEntity(
      id: json['id'] as int,
      fullName: json['fullName'] as String,
      email: json['email'] as String?,
      hasBusinessInfo: json['hasBusinessInfo'] as bool,
      businessTypeId: json['businessTypeId'] as int,
      businessTypeName: json['businessTypeName'] as String,
    );
  }
}

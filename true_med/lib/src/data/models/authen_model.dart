import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/authen_entity.dart';
import 'customer_model.dart';

part 'authen_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class AuthenResponseModel extends AuthenResponseEntity
    with AuthenResponseModelMappable {
  AuthenResponseModel({
    //required this.id,
    this.tokenType,
    this.expiresAt,
    this.message,

    super.accessToken,
    //required super.accessToken,
    // required this.firstName,
    // required this.lastName,
    // required this.image,
    // required super.accessToken,
    // required this.gender,
    // required this.refreshToken,
    CustomerResponseModel? customer,
  }) : super(customer: customer);

  //final int id;
  final String? tokenType;
  final String? expiresAt;
  final String? message;
  //final String? detail;
  //final bool? success;
  // final String firstName;
  // final String lastName;
  // final String gender;
  // final String image;
  // final String refreshToken;

  static const fromJson = AuthenResponseModelMapper.fromJson;
}

@MappableClass(generateMethods: GenerateMethods.copy | GenerateMethods.encode)
class AuthenRequestModel extends AuthenRequestEntity
    with AuthenRequestModelMappable {
  AuthenRequestModel({required super.username, required super.password});

  factory AuthenRequestModel.fromEntity(AuthenRequestEntity entity) {
    return AuthenRequestModel(
      username: entity.username,
      password: entity.password,
    );
  }
}

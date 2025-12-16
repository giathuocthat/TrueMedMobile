import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/province_detail_entity .dart';

import 'ward_model.dart';

part 'province_detail_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ProvinceDetailResponseModel extends ProvinceDetailResponseEntity
    with ProvinceDetailResponseModelMappable {
  ProvinceDetailResponseModel({
    required super.id,
    required super.name,
    required super.code,
    required super.type,
    required super.countryId,
    required super.zipCode,
    required List<WardResponseModel> wards,
  }) : super(wards: wards);

  static const fromJson = ProvinceDetailResponseModelMapper.fromJson;
}

// @MappableClass(generateMethods: GenerateMethods.decode)
// class ProvinceDetailResponseModel extends ProvinceDetailResponseModel
//     with ProvinceDetailResponseModelMappable {
//   ProvinceDetailResponseModel({
//     required super.id,
//     required super.name,
//     required super.code,
//     required super.type,
//     required super.countryId,
//     required super.zipCode,
//     List<WardResponseModel> wards,
//   }) : super(wards: wards);

//   static const fromJson = ProvinceDetailResponseModelMapper.fromJson;
// }

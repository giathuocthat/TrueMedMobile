import 'package:dart_mappable/dart_mappable.dart';

import '../../domain/entities/image_entity.dart';

part 'image_model.mapper.dart';

@MappableClass(generateMethods: GenerateMethods.decode)
class ImageResponseModel extends ImageResponseEntity
    with ImageResponseModelMappable {
  ImageResponseModel({
    required super.id,
    required super.imageUrl,
    super.altText,
    required super.displayOrder,
  });

  static const fromJson = ImageResponseModelMapper.fromJson;
}

interface class ImageEntity {}

class ImageRequestEntity extends ImageEntity {}

class ImageResponseEntity extends ImageEntity {
  ImageResponseEntity({
    required this.id,
    required this.imageUrl,
    this.altText,
    required this.displayOrder,
  });

  final int id;
  final String imageUrl;
  final String? altText;
  final int displayOrder;
}

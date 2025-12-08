interface class BrandEntity {}

class BrandRequestEntity extends BrandEntity {}

class BrandResponseEntity extends BrandEntity {
  BrandResponseEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.countryOfOrigin,
    this.logoUrl,
  });

  final int id;
  final String name;
  final String slug;
  final String? countryOfOrigin;
  final String? logoUrl;
}

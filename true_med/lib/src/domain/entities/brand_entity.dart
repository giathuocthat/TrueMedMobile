interface class BrandEntity {}

class BrandRequestEntity extends BrandEntity {}

class BrandResponseEntity extends BrandEntity {
  BrandResponseEntity({
    this.id,
    this.name,
    this.slug,
    this.countryOfOrigin,
    this.logoUrl,
  });

  final int? id;
  final String? name;
  final String? slug;
  final String? countryOfOrigin;
  final String? logoUrl;
}

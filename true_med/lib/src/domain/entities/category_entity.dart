interface class CategoryEntity {}

class CategoryRequestEntity extends CategoryEntity {}

class CategoryResponseEntity extends CategoryEntity {
  CategoryResponseEntity({
    required this.id,
    required this.name,
    required this.slug,
    this.parentId,
  });

  final int id;
  final String name;
  final String slug;
  final int? parentId;
}

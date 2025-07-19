import '../../../homepage/domain/entity/category_entity.dart';

class ProductEntity {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final List<String> images;
  final CategoryEntity category;

  ProductEntity({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });
}

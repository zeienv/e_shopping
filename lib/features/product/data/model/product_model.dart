import '../../../homepage/data/model/category_model.dart';
import '../../../product/domain/entity/product_entity.dart';

class ProductModel {
  final int id;
  final String title;
  final String slug;
  final int price;
  final String description;
  final List<String> images;
  final CategoryModel category;

  ProductModel({
    required this.id,
    required this.title,
    required this.slug,
    required this.price,
    required this.description,
    required this.images,
    required this.category,
  });

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      title: title,
      slug: slug,
      price: price,
      description: description,
      images: images,
      category: category,
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      slug: json['slug'],
      price: json['price'],
      description: json['description'],
      images: List<String>.from(json['images']),
      category: CategoryModel.fromJson(json['category']),
    );
  }
}

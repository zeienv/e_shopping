

import '../entity/category_entity.dart';

abstract class CategoryRepository {
  Future<List<CategoryEntity>> getCategories({required int limit});
}



import '../entity/category_entity.dart';
import '../repository/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository repository;

  GetCategoriesUseCase(this.repository);

  Future<List<CategoryEntity>> call({required int limit}) async {
    return await repository.getCategories(limit: limit);
  }
}

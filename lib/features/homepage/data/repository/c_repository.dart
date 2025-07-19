import '../../domain/entity/category_entity.dart';
import '../../domain/repository/category_repository.dart';
import '../datasources/c_remote_datasource.dart';

class CategoryRepositoryImpl implements CategoryRepository {
  final CategoryRemoteDataSource remoteDataSource;

  CategoryRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<CategoryEntity>> getCategories({required int limit}) {
    return remoteDataSource.getCategories(limit: limit);
  }
}

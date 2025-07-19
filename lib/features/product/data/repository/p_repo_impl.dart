
import '../../domain/repository/product_repo.dart';
import '../datasource/product_remote_datasource.dart';
import '../model/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;

  ProductRepositoryImpl({required this.remoteDataSource});

  @override
  Future<List<ProductModel>> getProducts({
    required int limit,
    required int offset,
  }) {
    return remoteDataSource.getProducts(limit: limit, offset: offset);
  }
}

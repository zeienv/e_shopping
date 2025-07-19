import '../../data/model/product_model.dart';

abstract class ProductRepository {
  Future<List<ProductModel>> getProducts({
    required int limit,
    required int offset,
  });
}

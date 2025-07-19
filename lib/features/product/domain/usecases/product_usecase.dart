

import 'package:e_commerce_app/features/product/data/model/product_model.dart';
import '../repository/product_repo.dart';

class GetProductsUseCase {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  Future<List<ProductModel>> call({required int limit, required int offset}) {
    return repository.getProducts(limit: limit, offset: offset);
  }
}

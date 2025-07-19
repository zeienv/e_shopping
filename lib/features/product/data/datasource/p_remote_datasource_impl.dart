import 'package:dio/dio.dart';
import '../model/product_model.dart';
import 'product_remote_datasource.dart';

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Dio dio;

  ProductRemoteDataSourceImpl({required this.dio});

  @override
  Future<List<ProductModel>> getProducts({required int limit, required int offset}) async {
    try {
      final response = await dio.get(
        'https://api.escuelajs.co/api/v1/products',
        queryParameters: {
          'limit': limit,
          'offset': offset,
        },
      );

      print('Products response: \n${response.data}');

      return (response.data as List)
          .map((json) => ProductModel.fromJson(json))
          .toList();
    } catch (e) {
      throw Exception('Failed to fetch products: $e');
    }
  }
}

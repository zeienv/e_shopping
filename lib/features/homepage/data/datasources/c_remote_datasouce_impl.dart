import 'package:dio/dio.dart';

import '../model/category_model.dart';
import 'c_remote_datasource.dart';

class CategoryRemoteDataSourceImpl implements CategoryRemoteDataSource {
  final Dio dio;

  CategoryRemoteDataSourceImpl({required this.dio}){
    dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
      logPrint: (obj) => print(obj),
    ));
  }

  @override
  Future<List<CategoryModel>> getCategories({required int limit}) async {
    try {
      final response = await dio.get(
        'https://api.escuelajs.co/api/v1/categories',
        queryParameters: {'limit': limit},
        options: Options(headers: {'accept': '*/*'}),
      );

      final List<dynamic> data = response.data;
      return data.map((json) => CategoryModel.fromJson(json)).toList();
    } catch (e) {
      throw Exception('Failed to fetch categories: $e');
    }
  }
}

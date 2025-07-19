import 'dart:convert';

import '../model/category_model.dart';


abstract class CategoryRemoteDataSource {
  Future<List<CategoryModel>> getCategories({required int limit});
}

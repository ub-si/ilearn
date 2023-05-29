import 'package:ilearn/app/core/services/http_manager.dart';

import '../core/utils/api_result.dart';
import '../core/utils/urls.dart';
import '../models/category_model.dart';

class CategoryRepository {
  final HttpManager httpManager;

  CategoryRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<CategoryModel>>> getAll(String token) async {
    const String endpoint = "${Url.base}/categories";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<CategoryModel> categoryList = CategoryModel.fromList(list);

      return ApiResult<List<CategoryModel>>(data: categoryList);
    } else {
      String message = response['error'] ?? "Não foi possível buscar as categorias. Tente novamente!";
      return ApiResult<List<CategoryModel>>(message: message, isError: true);
    }
  }

  Future<ApiResult<CategoryModel>> getById(String token, int id) async {
    String endpoint = "${Url.base}/categories/$id";

    CategoryModel model = CategoryModel();

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      model = CategoryModel.fromJson(response['data']);
      return ApiResult<CategoryModel>(data: model);
    } else {
      String message = response['error'] ?? "Não foi possível buscar a categoria. Tente novamente!";
      return ApiResult<CategoryModel>(message: message, isError: true);
    }
  }
}

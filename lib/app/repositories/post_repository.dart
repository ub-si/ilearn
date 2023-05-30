import '../core/services/http_manager.dart';
import '../core/utils/api_result.dart';
import '../core/utils/urls.dart';
import '../models/post_model.dart';

class PostRepository {
  final HttpManager httpManager;

  PostRepository({
    required this.httpManager,
  });

  Future<ApiResult<List<PostModel>>> getAll(String token) async {
    const String endpoint = "${Url.base}/posts";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      List list = response['data'];

      List<PostModel> listPosts = PostModel.fromList(list);

      return ApiResult<List<PostModel>>(data: listPosts);
    } else {
      String message = response['error'] ?? "Não foi possível buscar os posts. Tente novamente!";
      return ApiResult<List<PostModel>>(message: message, isError: true);
    }
  }

  Future<ApiResult<PostModel>> getById(String token, int id) async {
    String endpoint = "${Url.base}/posts/$id";

    PostModel model = PostModel();

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.get,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      model = PostModel.fromJson(response['data']);
      return ApiResult<PostModel>(data: model);
    } else {
      String message = response['error'] ?? "Não foi possível buscar o post. Tente novamente!";
      return ApiResult<PostModel>(message: message, isError: true);
    }
  }
}

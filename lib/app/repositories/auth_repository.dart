import '../models/user_model.dart';
import '../core/services/http_manager.dart';
import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../core/utils/urls.dart';

class AuthRepository {
  final HttpManager httpManager;
  final AppUtils appUtils;

  AuthRepository({
    required this.httpManager,
    required this.appUtils,
  });

  Future<ApiResult<UserModel>> signIn({required String email, required String password}) async {
    const String endpoint = "${Url.base}/login";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      body: {
        'email': email,
        'password': password,
      },
    );

    if (response['data'] != null) {
      UserModel user = UserModel.fromMap(response['data']);
      appUtils.saveLocalData(key: "user-token", data: user.token!);

      return ApiResult<UserModel>(data: user);
    } else {
      String message = response['error'] ?? "Não foi possível fazer login. Tente novamente!";
      return ApiResult<UserModel>(message: message, isError: true);
    }
  }

  Future<ApiResult<UserModel>> signUp(UserModel user) async {
    const String endpoint = "${Url.base}/register";

    Map<String, dynamic> body = user.toMap();
    body['password_confirmation'] = user.password;

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      body: body,
    );

    if (response['data'] != null) {
      UserModel user = UserModel.fromMap(response['data']);

      return ApiResult<UserModel>(data: user);
    } else {
      String message = response['error'] ?? "Não foi possível fazer o cadastro. Tente novamente!";
      return ApiResult<UserModel>(message: message, isError: true);
    }
  }

  Future<ApiResult<UserModel>> validateToken(String token) async {
    const String endpoint = "${Url.base}/validate-token";

    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['data'] != null) {
      UserModel user = UserModel.fromMap(response['data']);
      appUtils.saveLocalData(key: "user-token", data: user.token!);
      return ApiResult<UserModel>(data: user);
    } else {
      String message = response['error'] ?? "Realize login novamente!";
      return ApiResult<UserModel>(message: message, isError: true);
    }
  }

  Future<String?> signOut({required String token}) async {
    const String endpoint = "${Url.base}/logout";
    final response = await httpManager.request(
      url: endpoint,
      method: HttpMethods.post,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (response['message'] != null) {
      return response['message'];
    } else {
      return null;
    }
  }
}

import 'package:get/get.dart';

import '../core/routes/app_routes_pages.dart';
import '../models/user_model.dart';
import '../repositories/auth_repository.dart';
import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';

class AuthController extends GetxController {
  final AuthRepository repository;
  final AppUtils appUtils;

  AuthController({
    required this.repository,
    required this.appUtils,
  });

  RxBool isLoading = false.obs;
  UserModel user = UserModel();

  @override
  void onInit() {
    super.onInit();

    validateToke();
  }

  Future signUp() async {
    isLoading.value = true;

    ApiResult<UserModel> result = await repository.signUp(user);
    if (!result.isError) {
      user = result.data!;
      appUtils.showToast(message: "Usuário cadastrado com sucesso!");
      Get.offAllNamed(AppRoutes.login);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future signIn({required String email, required String password}) async {
    isLoading.value = true;

    ApiResult<UserModel> result = await repository.signIn(email: email, password: password);
    if (!result.isError) {
      user = result.data!;
      Get.offAllNamed(AppRoutes.base);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }

  Future validateToke() async {
    String? token = await appUtils.getLocalData(key: 'user-token');

    if (token != null) {
      ApiResult<UserModel> result = await repository.validateToken(token);
      if (!result.isError) {
        user = result.data!;
        Get.offAllNamed(AppRoutes.base);
      } else {
        appUtils.showToast(message: result.message!, isError: true);
        Get.offAllNamed(AppRoutes.login);
      }
    } else {
      Get.offAllNamed(AppRoutes.login);
    }
  }

  Future signOut() async {
    String? token = await appUtils.getLocalData(key: 'user-token');
    await appUtils.removeLocalData(key: 'user-token');

    await repository.signOut(token: token ?? "");
    Get.offAllNamed(AppRoutes.login);
  }
}

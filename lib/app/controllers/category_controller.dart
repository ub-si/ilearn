import 'package:get/get.dart';

import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../models/category_model.dart';
import '../repositories/category_repository.dart';
import 'auth_controller.dart';

class CategoryController extends GetxController {
  final AuthController auth;
  final CategoryRepository repository;
  final AppUtils appUtils;

  CategoryController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  @override
  void onInit() {
    super.onInit();

    getCategories();
  }

  RxList<CategoryModel> listCategories = RxList<CategoryModel>([]);
  RxBool isLoading = false.obs;

  Future getCategories() async {
    isLoading.value = true;

    ApiResult<List<CategoryModel>> result = await repository.getAll(auth.user.token!);
    if (!result.isError) {
      listCategories.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}

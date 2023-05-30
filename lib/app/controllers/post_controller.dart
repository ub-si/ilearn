import 'package:get/get.dart';

import '../core/utils/api_result.dart';
import '../core/utils/app_utils.dart';
import '../models/post_model.dart';
import '../repositories/post_repository.dart';
import 'auth_controller.dart';

class PostController extends GetxController {
  final AuthController auth;
  final PostRepository repository;
  final AppUtils appUtils;

  PostController({
    required this.auth,
    required this.repository,
    required this.appUtils,
  });

  RxList<PostModel> listCategories = RxList<PostModel>([]);
  RxBool isLoading = false.obs;

  Future getPosts() async {
    isLoading.value = true;

    ApiResult<List<PostModel>> result = await repository.getAll(auth.user.token!);
    if (!result.isError) {
      listCategories.assignAll(result.data!);
    } else {
      appUtils.showToast(message: result.message!, isError: true);
    }

    isLoading.value = false;
  }
}

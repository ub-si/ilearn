import 'package:get/get.dart';

import '../controllers/post_controller.dart';
import '../repositories/post_repository.dart';

class PostBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(PostRepository(httpManager: Get.find()));
    Get.put(PostController(auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}

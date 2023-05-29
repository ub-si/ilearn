import 'package:get/get.dart';

import '../controllers/category_controller.dart';
import '../repositories/category_repository.dart';

class CategoryBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(CategoryRepository(httpManager: Get.find()));
    Get.put(CategoryController(auth: Get.find(), repository: Get.find(), appUtils: Get.find()));
  }
}

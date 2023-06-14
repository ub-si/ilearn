import 'package:get/get.dart';

import '../models/user_model.dart';
import 'auth_controller.dart';

class ProfileController extends GetxController {
  final AuthController auth;

  ProfileController({
    required this.auth,
  });

  UserModel user = UserModel();
  RxBool isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();

    getUser();
  }

  Future getUser() async {
    isLoading.value = true;
    user = auth.user;
    isLoading.value = false;
  }

  Future signOut() async {
    await auth.signOut();
  }
}

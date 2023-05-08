import 'package:get/get.dart';

import '../../pages/auth/login_page.dart';
import '../../pages/auth/register_page.dart';
import '../../pages/base_page.dart';
import '../../pages/home/home_page.dart';
import '../../pages/splash_page.dart';

abstract class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.base,
      page: () => const BasePage(),
    ),
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashPage(),
    ),
    GetPage(
      name: AppRoutes.login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: AppRoutes.register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomePage(),
    ),
  ];
}

abstract class AppRoutes {
  static const String base = '/';
  static const String splash = '/splash';
  static const String login = '/login';
  static const String register = '/register';
  static const String home = '/home';
}

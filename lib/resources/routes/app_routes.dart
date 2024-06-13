import 'package:get/get.dart';
import 'package:mvvm_getx/resources/routes/routes_name.dart';
import 'package:mvvm_getx/view/homeView/home_view.dart';
import 'package:mvvm_getx/view/loginVeiw/login_view.dart';
import 'package:mvvm_getx/view/splashScreen/splash_screen.dart';

class AppRoutes {
  static appRoutes() => [
        GetPage(
          name: RoutesName.splashScreen,
          page: () => const SplashScreen(),
        ),
        GetPage(
          name: RoutesName.loginView,
          page: () => const LoginView(),
        ),
        GetPage(
          name: RoutesName.homeView,
          page: () => const HomeView(),
        )
      ];
}

import 'package:get/get.dart';
import 'package:getx_firebase_app/presentation/views/auth/signin_view.dart';
import 'package:getx_firebase_app/presentation/views/auth/signup_view.dart';
import 'package:getx_firebase_app/presentation/views/details/details_view.dart';
import 'package:getx_firebase_app/presentation/views/home/home_view.dart';
import 'package:getx_firebase_app/presentation/views/splash/splash_view.dart';
import 'package:getx_firebase_app/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.SPLASH,
      page: () => SplashView(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupView(),
    ),
    GetPage(
      name: AppRoutes.SIGNIN,
      page: () => SigninView(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: AppRoutes.DETAILS,
      page: () => DetailsView(),
    ),
  ];
}

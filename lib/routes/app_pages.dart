import 'package:get/get.dart';
import '../views/splash_view.dart';
import '../views/signin_view.dart';
import '../views/signup_view.dart';
import '../views/home_view.dart';

class AppPages {
  static const initial = '/splash';

  static final routes = [
    GetPage(name: '/splash', page: () => SplashView()),
    GetPage(name: '/signin', page: () => SignInView()),
    GetPage(name: '/signup', page: () => SignUpView()),
    GetPage(name: '/home', page: () => HomeView()),
  ];
}

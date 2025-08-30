import 'package:get/get.dart';
import 'package:your_app_name/modules/auth/login_view.dart';
import 'package:your_app_name/modules/auth/signup_view.dart';
import 'package:your_app_name/modules/auth/reset_password_view.dart';
import 'package:your_app_name/modules/home/home_view.dart';
import 'package:your_app_name/modules/property/property_view.dart';
import 'package:your_app_name/modules/wishlist/wishlist_view.dart';
import 'package:your_app_name/modules/home/search_filter_view.dart';
import 'package:your_app_name/modules/property/contact_form_view.dart';
import 'package:your_app_name/routes/app_routes.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => LoginView(),
    ),
    GetPage(
      name: AppRoutes.SIGNUP,
      page: () => SignupView(),
    ),
    GetPage(
      name: AppRoutes.RESET_PASSWORD,
      page: () => ResetPasswordView(),
    ),
    GetPage(
      name: AppRoutes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: AppRoutes.PROPERTY_DETAILS,
      page: () => PropertyView(),
    ),
    GetPage(
      name: AppRoutes.WISHLIST,
      page: () => WishlistView(),
    ),
    GetPage(
      name: AppRoutes.SEARCH_FILTER,
      page: () => SearchFilterView(),
    ),
    GetPage(
      name: AppRoutes.CONTACT_FORM,
      page: () {
        final arguments = Get.arguments as Map<String, String>;
        return ContactFormView(
          propertyId: arguments['propertyId']!,
          propertyTitle: arguments['propertyTitle']!,
        );
      },
    ),
  ];
}

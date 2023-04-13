import 'package:enayas_app/services/configs/appTheme.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/pages/auth/loginPage.dart';
import 'package:enayas_app/view/pages/auth/registerPage.dart';
import 'package:enayas_app/view/pages/cart/cartPage.dart';
import 'package:enayas_app/view/pages/category/categoryPage.dart';
import 'package:enayas_app/view/pages/category/categoryProductPage.dart';
import 'package:enayas_app/view/pages/chat/chatListPage.dart';
import 'package:enayas_app/view/pages/profile/profilePage.dart';
import 'package:enayas_app/view/pages/splash/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'services/configs/appColors.dart';
import 'view/pages/home/bottomBarHomePage.dart';
import 'view/pages/home/homePage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await GetStorage.init();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRouteService.splash,
      theme: AppTheme.appTheme,
      smartManagement: SmartManagement.onlyBuilder,
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(name: AppRouteService.home, page: () => HomePage()),
        GetPage(
            name: AppRouteService.bottomHome, page: () => BottomBarHomePage()),
        GetPage(name: AppRouteService.splash, page: () => SplashPage()),
        GetPage(name: AppRouteService.category, page: () => CategoryPage()),
        GetPage(name: AppRouteService.profile, page: () => ProfilePage()),
        GetPage(name: AppRouteService.login, page: () => Loginpage()),
        GetPage(name: AppRouteService.register, page: () => RegisterPage()),
        GetPage(
            name: AppRouteService.categoryProductPage,
            page: () => CategoryProductPage()),
        GetPage(name: AppRouteService.chatList, page: () => ChatListPage()),
        GetPage(name: AppRouteService.cart, page: () => CartPage()),
        // GetPage(
        //     name: AppRouteService.productDetails,
        //     page: () => ProductDetailsPage()),
      ],
    );
  }
}

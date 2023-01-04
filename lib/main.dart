import 'package:enayas_app/services/configs/appTheme.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/pages/auth/loginPage.dart';
import 'package:enayas_app/view/pages/cart/cartPage.dart';
import 'package:enayas_app/view/pages/category/categoryPage.dart';
import 'package:enayas_app/view/pages/category/categoryProductPage.dart';
import 'package:enayas_app/view/pages/chat/chatListPage.dart';
import 'package:enayas_app/view/pages/product/productDetailsPage.dart';
import 'package:enayas_app/view/pages/profile/profilePage.dart';
import 'package:enayas_app/view/pages/splash/splashPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'services/configs/appColors.dart';

import 'view/pages/home/bottomBarHomePage.dart';
import 'view/pages/home/homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: AppColors.transparent,
    statusBarBrightness: Brightness.dark,
    statusBarIconBrightness: Brightness.dark,
  ));

  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  //   DeviceOrientation.portraitDown,
  // ]);

  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: AppRouteService.splash,
      theme: AppTheme.appTheme,
      debugShowCheckedModeBanner: false,
      // home: HomePage(),
      getPages: [
        GetPage(name: AppRouteService.home, page: () => HomePage()),
        GetPage(
            name: AppRouteService.bottomHome, page: () => BottomBarHomePage()),
        GetPage(name: AppRouteService.splash, page: () => SplashPage()),
        GetPage(name: AppRouteService.category, page: () => CategoryPage()),
        GetPage(name: AppRouteService.profile, page: () => ProfilePage()),
        GetPage(name: AppRouteService.login, page: () => Loginpage()),
        GetPage(
            name: AppRouteService.categoryProductPage,
            page: () => CategoryProductPage()),
        GetPage(name: AppRouteService.chatList, page: () => ChatListPage()),
        GetPage(name: AppRouteService.cart, page: () => CartPage()),
        GetPage(
            name: AppRouteService.productDetails,
            page: () => ProductDetailsPage()),
      ],
    );
  }
}

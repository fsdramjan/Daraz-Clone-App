import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3)).then(
      (value) => Get.offAndToNamed(
        AppRouteService.bottomHome,
      ),
    );
    return Scaffold(
      body: Center(
        child: Container(
          // color: AppColors.pink,
          alignment: Alignment.center,
          child: Image.asset(
            'assets/images/logo.png',
            width: Get.width,
          ),
        ),
      ),
    );
  }
}

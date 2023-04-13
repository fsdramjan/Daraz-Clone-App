import 'package:enayas_app/services/Api/apiService.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/checkUserAuth.dart';
import 'package:enayas_app/services/helpers/loadingDialog.dart';
import 'package:enayas_app/services/helpers/reloadAllData.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';
import 'package:enayas_app/view/pages/auth/loginPage.dart';
import 'package:enayas_app/view/pages/home/bottomBarHomePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final fullName = TextEditingController().obs;
  final phoneOrEmail = TextEditingController().obs;
  final password = TextEditingController().obs;
  final isEmailLogin = RxBool(true);
  userLogin() async {
    try {
      var loginType = isEmailLogin.value == true ? 'email' : 'phone';

      loadingDialog();

      var res = await ApiService.post(
        url: '/auth/login',
        data: {
          "$loginType": phoneOrEmail.value.text,
          "password": password.value.text,
          "identity_matrix": "",
        },
      );

      print(res!.data.toString());
      if (res.data != null) {
        if (res.data['result'] == true) {
          phoneOrEmail.value.clear();
          password.value.clear();
          print(res.data['access_token']);
          Apputils.getStorage
              .write(Apputils.accessToken, res.data['access_token']);
          snackBar(message: res.data['message']);
          ReloadAllData.reloadAllData();
          checkUserAuth(isRouteOff: true);
          Get.offAll(BottomBarHomePage());
          // Get.back();
        } else if (res.data['result'] == false) {
          snackBar(message: res.data['message']);
        } else {
          snackBar(message: res.data['message']);
        }
        Get.back();
      }
    } catch (e) {
      print(e);

      Get.back();
    }
  }

  userRegistration() async {
    try {
      var loginType = isEmailLogin.value == true ? 'email' : 'phone';

      loadingDialog();

      final res = await ApiService.post(
        url: '/auth/signup',
        data: {
          "name": fullName.value.text,
          "email_or_phone": phoneOrEmail.value.text,
          "password": password.value.text,
          "passowrd_confirmation": password.value.text,
          "register_by": loginType,
        },
      );

      print(res!.data.toString());
      if (res.data != null) {
        if (res.data['result'] == true) {
          snackBar(message: res.data['message']);
          // Get.back();
          Get.offAll(Loginpage());
        } else if (res.data['result'] == false) {
          snackBar(message: res.data['message']);
        } else {
          snackBar(message: res.data['message']);
        }
        Get.back();
      }
    } catch (e) {
      print(e);
      // serverErrorSnackbar();

      Get.back();
    }
  }

  void signout() async {
    await Apputils.getStorage.erase();
    ReloadAllData.reloadAllData();
    checkUserAuth(isRouteOff: true);
    Get.to(Loginpage());
  }
}

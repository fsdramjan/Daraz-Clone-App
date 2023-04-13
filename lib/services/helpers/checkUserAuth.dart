import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:get/get.dart';

void checkUserAuth({bool isRouteOff = false}) async {
  Future.delayed(Duration(seconds: 3)).then((value) {
    if (Apputils.getStorage.read(Apputils.accessToken) != null) {
      Apputils.isLoggedIn.value = true;

      if (isRouteOff == true) {
      } else {
        Get.offAndToNamed(
          AppRouteService.bottomHome,
        );
      }
    } else {
      Apputils.isLoggedIn.value = false;
      if (isRouteOff == true) {
      } else {
        Get.offAndToNamed(
          AppRouteService.login,
        );
      }
    }
  });
}

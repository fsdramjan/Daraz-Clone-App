import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';

class ReloadAllData {
  static void reloadAllData() {
    AllController.sliderC.getMainSlider();
    AllController.categoryC.getAllCategory();
    AllController.categoryC.getTopCategory();
    AllController.productC.getAllProduct();
    if (Apputils.getStorage.read(Apputils.accessToken) != null) {
      AllController.profileC.getProfileInfo();
      AllController.wishlistC.getWishlist();
      AllController.cartC.getAllCart();
    }
  }
}

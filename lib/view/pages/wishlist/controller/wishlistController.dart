import 'package:enayas_app/services/Api/apiService.dart';
import 'package:enayas_app/services/helpers/loadingDialog.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';
import 'package:get/get.dart';

import '../../../../services/helpers/allController.dart';
import '../model/wishlistModel.dart';

class WishlistController extends GetxController {
  final isLoading = RxBool(false);

  final wishlist = WishlistModel().obs;

  void getWishlist() async {
    try {
      isLoading.value = true;
      final res = await ApiService.get(
        endPoint: '/wishlists',
      );
      if (res!.statusCode == 200) {
        wishlist.value = WishlistModel.fromJson(res.data);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  addWishItem({
    required productId,
  }) async {
    try {
      loadingDialog();
      final res = await ApiService.get(
        endPoint:
            '/wishlists-add-product?product_id=$productId&user_id=${AllController.profileC.profileInfo.value.id}',
      );
      if (res!.statusCode == 200) {
        snackBar(message: res.data['message']);
        Get.back();
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }
}

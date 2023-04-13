import 'package:enayas_app/controllers/category/categoryController.dart';
import 'package:enayas_app/controllers/product/productControlle.dart';
import 'package:enayas_app/controllers/slider/sliderController.dart';
import 'package:enayas_app/view/pages/auth/controller/authController.dart';
import 'package:enayas_app/view/pages/profile/controller/profileController.dart';
import 'package:get/get.dart';

import '../../view/pages/cart/controller/cartController.dart';
import '../../view/pages/wishlist/controller/wishlistController.dart';

class AllController {
  static final authC = Get.put(AuthController());
  static final sliderC = Get.put(SliderController());
  static final categoryC = Get.put(CategoryController());
  static final productC = Get.put(ProductController());
  static final profileC = Get.put(ProfileController());
  static final wishlistC = Get.put(WishlistController());
  static final cartC = Get.put(CartController());
}

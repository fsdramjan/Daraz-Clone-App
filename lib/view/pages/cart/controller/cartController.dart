import 'package:enayas_app/services/Api/apiService.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loadingDialog.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';
import 'package:get/get.dart';

import '../model/cartlistModel.dart';

class CartController extends GetxController {
  final isLoading = RxBool(false);

  final cartList = RxList<CartListModel>();

  final selectedCartItem = RxList<CartItems>();
  final subTotalAmount = RxInt(0);
  final totalAmount = RxInt(0);
  final quantity = RxInt(1);

  addNewCart({
    required id,
    required variantColor,
    required quantity,
  }) async {
    try {
      // loadingDialog(loadingText: 'Cart Adding...');
      final res = await ApiService.post(
        url: '/carts/add',
        data: {
          "id": id,
          "variant": 'Black',
          "user_id": AllController.profileC.profileInfo.value.id,
          "quantity": quantity,
          "cost_matrix": ""
        },
      );

      if (res!.data != null) {
        if (res.data['result'] == true) {
          snackBar(message: res.data['message']);
          getAllCart();
          // Get.back();
        } else {
          snackBar(message: res.data['message']);
          // Get.back();
        }
      }
    } catch (e) {
      print(e);
      Get.back();
    }
  }

  void getAllCart() async {
    try {
      isLoading.value = true;
      final res = await ApiService.post(
        url: '/carts',
      );
      final item = res!.data
          .map((json) => CartListModel.fromJson(json))
          .toList()
          .cast<CartListModel>();

      if (res.statusCode == 200) {
        cartList.clear();
        cartList.addAll(item);
        isLoading.value = false;
      }
    } catch (e) {
      print(e);
      isLoading.value = false;
    }
  }

  subTotalAmountCal(id) {
    cartList.map((cartData) {
      cartData.cartItems!.map((e) {
        selectedCartItem.map((sCart) {
          if (sCart.id == id) {
          } else {
            subTotalAmount.value = selectedCartItem.fold(
                0,
                (previous, current) =>
                    previous +
                    int.parse(current.price.toString()) *
                        current.quantity!.toInt());

            totalAmount.value = subTotalAmount.value;
          }
        }).toList();
      }).toList();
    }).toList();
  }

  void selectedCart(CartItems? cartItems) {
    final index =
        selectedCartItem.indexWhere((e) => e.productId == cartItems!.productId);

    if (cartItems != null) {
      if (index > -1) {
        snackBar(message: 'Exists!!');
        selectedCartItem.remove(cartItems);

        selectedCartItem.add(cartItems);
        subTotalAmountCal(cartItems.productId);
      } else {
        print(selectedCartItem.contains(cartItems.productId));

        if (selectedCartItem.contains(cartItems.productId)) {
          selectedCartItem.remove(cartItems.productId);
          subTotalAmountCal(cartItems.productId);
        } else {
          selectedCartItem.add(cartItems);
          subTotalAmountCal(cartItems.productId);
        }
        print('Selected Cart : ${selectedCartItem.length}');
      }
    }
    print(selectedCartItem.contains(cartItems!.productId));
  }
}

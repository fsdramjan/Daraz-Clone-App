import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/view/pages/home/bottomBarHomePage.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/helpers/allController.dart';

Widget cartIcon({IconData? icon}) {
  return Stack(
    clipBehavior: Clip.none,
    children: [
      iconButton(
        onTap: () => Get.to(BottomBarHomePage(
          selectedIndex: 2,
        )),
        icons:icon?? Icons.shopping_cart_outlined,
        iconColor: AppColors.grey.shade700,
      ),
      Positioned(
        right: 5,
        top: 5,
        child: Obx(
          () => AllController.cartC.isLoading.value == true
              ? Container()
              : AllController.cartC.cartList.length == 0
                  ? Container()
                  : CircleAvatar(
                      radius: 7.5,
                      backgroundColor: AppColors.pink,
                      child: KText(
                        text: AllController.cartC.cartList.length.toString(),
                        color: AppColors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 9,
                      ),
                    ),
        ),
      ),
    ],
  );
}

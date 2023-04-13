import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';
import 'package:enayas_app/view/pages/product/productDetailsPage.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/productCard/productCard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/configs/appColors.dart';
import '../../widgets/text/kText.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('Wish - ${AllController.wishlistC.wishlist.value.data!.length}');
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        elevation: .5,
        title: KText(
          text: 'Wishlist',
        ),
      ),
      body: Obx(
        () => AllController.wishlistC.isLoading.value == true
            ? loadingAnimation()
            : Padding(
                padding: Apputils.paddingAll10,
                child: GridView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount:
                      AllController.wishlistC.wishlist.value.data!.length,
                  gridDelegate: Apputils.geidDeligate,
                  itemBuilder: (c, i) {
                    final item =
                        AllController.wishlistC.wishlist.value.data![i];
                    return productCard(
                      onTap: () => Get.to(
                          ProductDetailsPage(productId: item.product!.id)),
                      id: item.id,
                      image: item.product!.thumbnailImage,
                      title: item.product!.name,
                      price: item.product!.basePrice,
                      stackIcon: iconButton(
                        onTap: () {
                          snackBar(message: 'Item removed!!');
                        },
                        icons: Icons.delete,
                        iconSize: 14,
                        iconColor: AppColors.pink,
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}

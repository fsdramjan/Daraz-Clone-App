import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget productCard({
  void Function()? onTap,
  required id,
  required String? image,
  required String? title,
  required price,
  discountPrice,
  Widget? stackIcon,
}) {
  return InkWell(
    onTap: onTap,
    borderRadius: BorderRadius.circular(5),
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.grey100,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              CachedNetworkImageWidget(
                imageUrl: image,
                height: Get.height / 6,
                width: Get.width,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                top: 5,
                child: Container(
                  height: 28,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  alignment: Alignment.center,
                  child: stackIcon ??
                      iconButton(
                        onTap: () =>
                            AllController.wishlistC.addWishItem(productId: id),
                        tooltip: 'Wishlist',
                        icons: Icons.favorite_outlined,
                        iconSize: 14,
                        iconColor: AppColors.pink,
                      ),
                ),
              ),
            ],
          ),
          Apputils.sizeH5,
          Padding(
            padding: Apputils.paddingH5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                KText(
                  text: title,
                  fontSize: 12,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                Apputils.sizeH5,
                Row(
                  children: [
                    Icon(
                      Icons.star,
                      color: AppColors.orange,
                      size: 15,
                    ),
                    KText(
                      text: '4.3/5 (230) | 2.3k sold ',
                      fontSize: 12,
                    ),
                  ],
                ),
                Apputils.sizeH5,
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(
                      color: AppColors.pink,
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: KText(
                      text: '6 Vouchers',
                      fontSize: 12,
                      color: AppColors.pink,
                    ),
                  ),
                ),
                Apputils.sizeH5,
                Row(
                  children: [
                    KText(
                      text: price.toString(),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.pink,
                    ),
                    Apputils.sizeW10,
                    KText(
                      text: discountPrice ?? '',
                      fontSize: 12,
                      decoration: TextDecoration.lineThrough,
                      fontWeight: FontWeight.normal,
                      color: AppColors.grey,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

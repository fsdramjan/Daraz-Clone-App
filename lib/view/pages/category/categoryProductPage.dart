import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../services/dummyData/dummyData.dart';
import '../../widgets/cachedNetwork/cachedNetworkWidget.dart';
import '../../widgets/text/kText.dart';

class CategoryProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: backButton(),
        title: SizedBox(
          height: 40,
          child: TextFormField(
            decoration: InputDecoration(
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: AppColors.pink,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(
                  color: AppColors.pink,
                ),
              ),
              contentPadding: Apputils.paddingH10,
              hintText: 'Search Product',
            ),
          ),
        ),
        actions: [
          iconButton(
            icons: Icons.shopping_cart_outlined,
          ),
          iconButton(
            icons: Icons.more_vert_rounded,
          ),
        ],
      ),
      body: ListView(
        children: [
          _categoryProductList(context),
        ],
      ),
    );
  }

  _categoryProductList(context) {
    return Padding(
      padding: Apputils.paddingH10,
      child: GridView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: productList.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.52),
          ),
          itemBuilder: (c, i) {
            final item = productList[i];
            return GestureDetector(
              onTap: () {
                Get.toNamed(AppRouteService.productDetails);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.grey100,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  children: [
                    CachedNetworkImageWidget(
                      imageUrl: item['image'],
                      height: Get.height / 6,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                    Apputils.sizeH5,
                    Padding(
                      padding: Apputils.paddingH5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          KText(
                            text: item['title'],
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
                                text: Apputils.tkSymbol +
                                    item['price'].toString(),
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: AppColors.pink,
                              ),
                              Apputils.sizeW10,
                              KText(
                                text: Apputils.tkSymbol +
                                    item['price'].toString(),
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
          }),
    );
  }
}

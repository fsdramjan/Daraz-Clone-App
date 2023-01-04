import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/dummyData/dummyData.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        elevation: 0,
        title: KText(
          text: 'My Cart(2)',
          fontSize: 15,
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: KText(
              text: 'Delete',
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          ListView.builder(
              shrinkWrap: true,
              primary: false,
              itemCount: 2,
              itemBuilder: (c, i) {
                final item = productList[i];
                return Card(
                  elevation: .3,
                  margin: EdgeInsets.symmetric(vertical: 5),
                  child: Padding(
                    padding: Apputils.paddingH10,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: AppColors.grey.shade400,
                            ),
                            Apputils.sizeW10,
                            KText(
                              text: 'Chengyuanshop',
                            ),
                            Apputils.sizeW10,
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 12,
                              color: AppColors.grey.shade400,
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: KText(
                                text: 'Get Voucher',
                                fontSize: 13,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: .5,
                          width: Get.width,
                          color: AppColors.grey.shade300,
                        ),
                        Apputils.sizeH10,
                        Row(
                          children: [
                            Icon(
                              Icons.circle_outlined,
                              color: AppColors.grey.shade400,
                            ),
                            Apputils.sizeW10,
                            CachedNetworkImageWidget(
                              imageUrl: item['image'],
                              width: Get.width / 6,
                            ),
                            Apputils.sizeW10,
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 1.7,
                                  child: KText(
                                    text: item['title'],
                                    maxLines: 1,
                                    fontSize: 13,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                KText(
                                  text: 'No Brand, Color Family : Black',
                                  fontSize: 11,
                                  color: AppColors.grey.shade600,
                                ),
                                KText(
                                  text: 'Only 1 items in stock',
                                  fontSize: 11,
                                  color: AppColors.pink.withOpacity(.7),
                                ),
                                Apputils.sizeH5,
                                KText(
                                  text: Apputils.tkSymbol + '478',
                                  fontSize: 14,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.pink,
                                ),
                                Apputils.sizeH5,
                                SizedBox(
                                  height: 30,
                                  width: Get.width / 1.7,
                                  child: Row(
                                    children: [
                                      KText(
                                        text: Apputils.tkSymbol + '478',
                                        fontSize: 12,
                                        color: AppColors.grey.shade600,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                      Apputils.sizeW10,
                                      KText(
                                        text: '-50%',
                                        fontSize: 12,
                                        color: AppColors.grey.shade600,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                      Spacer(),
                                      KText(
                                        text: 'Qty: 1',
                                        fontSize: 12,
                                        color: AppColors.grey.shade600,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Apputils.sizeH10,
                      ],
                    ),
                  ),
                );
              }),
        ],
      ),
      bottomSheet: Container(
        height: 100,
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.only(bottom: 40),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: Icon(
                  Icons.circle_outlined,
                  size: 20,
                  color: AppColors.grey.shade400,
                ),
                label: KText(
                  text: 'All',
                  fontSize: 12,
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        KText(
                          text: 'Delivery:',
                          fontSize: 10,
                          color: AppColors.grey.shade400,
                        ),
                        KText(
                          text: Apputils.tkSymbol + ' 0',
                          fontSize: 10,
                          color: AppColors.pink.withOpacity(.6),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        KText(
                          text: 'Total:',
                          fontSize: 12,
                          color: AppColors.grey.shade400,
                        ),
                        KText(
                          text: Apputils.tkSymbol + ' 0',
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: AppColors.pink,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Apputils.sizeW10,
              Container(
                decoration: BoxDecoration(
                  // color: AppColors.pink,
                  borderRadius: BorderRadius.circular(5),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.orange,
                      AppColors.pink,
                    ],
                  ),
                ),
                height: 40,
                child: Padding(
                  padding: Apputils.paddingAll10,
                  child: KText(
                    text: 'Check Out (2)',
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              Apputils.sizeW10,
            ],
          ),
        ),
      ),
    );
  }
}

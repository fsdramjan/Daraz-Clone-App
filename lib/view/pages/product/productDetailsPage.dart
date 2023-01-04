import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/dummyData/dummyData.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconAndBottomTextButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/routes/appRouterService.dart';

class ProductDetailsPage extends StatelessWidget {
  final _isDescriptionTab = RxBool(true);
  @override
  Widget build(BuildContext context) {
    final item = productList[1];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: backButton(
          icon: Icons.arrow_back_ios_new,
          iconSize: 20,
        ),
        title: SizedBox(
          height: 40,
          child: TextFormField(
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.transparent,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.transparent,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
              prefixIcon: Icon(
                Icons.search,
                size: 20,
                color: AppColors.grey.shade700,
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: 2),
              hintText: 'Search in Enayas',
              hintStyle: GoogleFonts.openSans(
                fontSize: 11,
              ),
              fillColor: AppColors.grey100,
              filled: true,
            ),
          ),
        ),
        actions: [
          iconButton(
            icons: Icons.share_outlined,
            iconColor: AppColors.grey.shade700,
          ),
          iconButton(
            icons: Icons.shopping_cart_outlined,
            iconColor: AppColors.grey.shade700,
          ),
          iconButton(
            icons: Icons.more_horiz_rounded,
            iconColor: AppColors.grey.shade700,
          ),
        ],
      ),
      backgroundColor: AppColors.grey100,
      body: Padding(
        padding: Apputils.paddingAll10,
        child: ListView(
          children: [
            Container(
              height: Get.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: CachedNetworkImageWidget(
                imageUrl: item['image'],
                height: Get.height / 2.5,
              ),
            ),
            Apputils.sizeH10,
            Container(
              height: 70,
              width: Get.width,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // shrinkWrap: true,
                // primary: false,
                // scrollDirection: Axis.horizontal,
                children: List<Widget>.generate(
                  2,
                  (index) => Padding(
                    padding: Apputils.paddingAll5,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.pink.withOpacity(.7),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: CachedNetworkImageWidget(
                        imageUrl: item['image'],
                        fit: BoxFit.contain,
                        height: Get.height / 8,
                        width: 80,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Apputils.sizeH10,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Padding(
                padding: Apputils.paddingAll10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(text: item['title']),
                    Apputils.sizeH5,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: Apputils.tkSymbol + item['price'].toString(),
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        Apputils.sizeW10,
                        KText(
                          text: Apputils.tkSymbol + item['price'].toString(),
                          fontSize: 12,
                          color: AppColors.grey.shade600,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.lineThrough,
                        ),
                        Apputils.sizeW5,
                        KText(
                          text: '-86%',
                          fontSize: 12,
                          color: AppColors.grey.shade600,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Apputils.sizeH10,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Padding(
                padding: Apputils.paddingAll10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'Fabric Colour',
                    ),
                    Apputils.sizeH10,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.pink,
                        ),
                      ),
                      width: Get.width / 1.8,
                      child: Padding(
                        padding: Apputils.paddingAll10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            KText(
                              text: 'Same As Picture Color',
                            ),
                            Apputils.sizeW10,
                            CircleAvatar(
                              backgroundColor: AppColors.pink,
                              radius: 10,
                              child: Icon(
                                Icons.done,
                                size: 12,
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Apputils.sizeH10,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Padding(
                padding: Apputils.paddingAll10,
                child: Obx(
                  () => Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _tab(),
                      Apputils.sizeH10,
                      _isDescriptionTab.value == true
                          ? _descriptionTab()
                          : _reviewsTab(),
                    ],
                  ),
                ),
              ),
            ),
            Apputils.sizeH10,
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: AppColors.white,
              ),
              child: Padding(
                padding: Apputils.paddingAll10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    KText(
                      text: 'Related products',
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                    Divider(),
                    GridView.builder(
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
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            border: Border.all(
                                              color: AppColors.pink,
                                            ),
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 4),
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
                                              decoration:
                                                  TextDecoration.lineThrough,
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
                  ],
                ),
              ),
            ),
            Apputils.sizeH30,
            Apputils.sizeH20,
          ],
        ),
      ),
      bottomSheet: Container(
        height: 50,
        color: AppColors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Row(
            children: [
              iconAndTextButton(
                onTap: () {},
                icons: Icons.message,
                iconColor: AppColors.pink,
                text: 'Chat',
                textSize: 12,
              ),
              Apputils.sizeW10,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.orange,
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: Apputils.paddingAll5,
                    child: KText(
                      text: 'Buy Now',
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              Apputils.sizeW10,
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.pink,
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: Apputils.paddingAll5,
                    child: KText(
                      text: 'Add to Cart',
                      color: AppColors.white,
                      fontSize: 12,
                    ),
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

  _descriptionTab() {
    return KText(
      text: '''সমগ্র বাংলাদেশের হোম ডেলিভারি দিয়ে থাকি I    

Email : enaya.shikder@gmail.com

Help Line-    01973258268
WhatsApp-  01973258268''',
    );
  }

  _reviewsTab() {
    return Center(
      child: KText(
        text: '''There is not review found!!''',
      ),
    );
  }

  _tab() {
    return Obx(
      () => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {
                _isDescriptionTab.value = true;
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                      _isDescriptionTab.value == true ? AppColors.pink : null,
                  border: _isDescriptionTab.value == true
                      ? null
                      : Border.all(
                          color: AppColors.pink,
                        ),
                ),
                alignment: Alignment.center,
                child: KText(
                  text: 'Description',
                  fontWeight: FontWeight.bold,
                  color: _isDescriptionTab.value == true
                      ? AppColors.white
                      : AppColors.black,
                ),
              ),
            ),
          ),
          Apputils.sizeW10,
          Expanded(
            child: GestureDetector(
              onTap: () {
                _isDescriptionTab.value = false;
              },
              child: Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color:
                      _isDescriptionTab.value == false ? AppColors.pink : null,
                  border: _isDescriptionTab.value == false
                      ? null
                      : Border.all(
                          color: AppColors.pink,
                        ),
                ),
                alignment: Alignment.center,
                child: KText(
                  text: 'Reviews',
                  color: _isDescriptionTab.value == false
                      ? AppColors.white
                      : AppColors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/hexcolor.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:enayas_app/view/pages/product/searchProductPage.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/cartIcon.dart';
import 'package:enayas_app/view/widgets/buttons/iconAndBottomTextButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/formfield/cFormField.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';

class ProductDetailsPage extends StatelessWidget {
  final _isDescriptionTab = RxBool(true);
  final int? productId;

  ProductDetailsPage({
    required this.productId,
  });

  final selectedImage = RxString('');
  final selectedColor = RxString('');
  final selectedSize = RxString('');
  final selectedSize2 = RxString('');

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AllController.productC.isLoading.value = true;
      AllController.productC.getProductDetails(productId);

      if (AllController.productC.productDetails.value.data == null) {
        AllController.productC.getProductDetails(productId);
        Future.delayed(Duration(seconds: 3)).then((value) {
          AllController.productC.isLoading.value = false;
        });
      } else {
        Future.delayed(Duration(seconds: 3)).then((value) {
          AllController.productC.isLoading.value = false;
        });
      }
    });
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        leading: backButton(
          icon: Icons.arrow_back_ios_new,
          iconSize: 20,
        ),
        title: cFormField(
          onTap: () => Get.to(SearchProductPage()),
          readOnly: true,
          hintText: 'Search in Enayas',
          filledColor: AppColors.grey100,
          borderRadius: 30,
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.grey,
          ),
        ),
        actions: [
          iconButton(
            icons: Icons.share_outlined,
            iconColor: AppColors.grey.shade700,
          ),
          cartIcon(),
          iconButton(
            icons: Icons.more_horiz_rounded,
            iconColor: AppColors.grey.shade700,
          ),
        ],
      ),
      backgroundColor: AppColors.grey100,
      body: Obx(
        () => AllController.productC.isLoading.value == true
            ? loadingAnimation()
            : Padding(
                padding: Apputils.paddingAll10,
                child: ListView(
                  shrinkWrap: true,
                  primary: false,
                  children: [
                    Container(
                      height: Get.height / 3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.white,
                      ),
                      child: CachedNetworkImageWidget(
                        imageUrl: selectedImage.value != ''
                            ? selectedImage.value
                            : AllController.productC.productDetails.value.data!
                                .first.thumbnailImage,
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
                      alignment: Alignment.center,
                      child: ListView(
                        shrinkWrap: true,
                        primary: false,
                        scrollDirection: Axis.horizontal,
                        children: List<Widget>.generate(
                          AllController.productC.productDetails.value.data!
                              .first.photos!.length,
                          (index) => GestureDetector(
                            onTap: () {
                              selectedImage.value = AllController
                                  .productC
                                  .productDetails
                                  .value
                                  .data!
                                  .first
                                  .photos![index]
                                  .path
                                  .toString();
                            },
                            child: Padding(
                              padding: Apputils.paddingAll5,
                              child: Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: selectedImage.value ==
                                            AllController
                                                .productC
                                                .productDetails
                                                .value
                                                .data!
                                                .first
                                                .photos![index]
                                                .path
                                        ? AppColors.pink.withOpacity(.7)
                                        : AppColors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: CachedNetworkImageWidget(
                                  imageUrl: AllController
                                      .productC
                                      .productDetails
                                      .value
                                      .data!
                                      .first
                                      .photos![index]
                                      .path,
                                  fit: BoxFit.contain,
                                  height: Get.height / 8,
                                  width: Get.width / 6,
                                ),
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
                            KText(
                              text: AllController.productC.productDetails.value
                                  .data!.first.name,
                            ),
                            Apputils.sizeH5,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                KText(
                                  text: AllController.productC.productDetails
                                      .value.data!.first.mainPrice,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                Apputils.sizeW10,
                                KText(
                                  text: AllController.productC.productDetails
                                      .value.data!.first.strokedPrice,
                                  fontSize: 12,
                                  color: AppColors.grey.shade600,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.lineThrough,
                                ),
                                Apputils.sizeW5,
                                KText(
                                  text: AllController.productC.productDetails
                                      .value.data!.first.discount,
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

                    productSizeColor(),

                    Apputils.sizeH10,
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: AppColors.white,
                        ),
                        child: Padding(
                          padding: Apputils.paddingAll10,
                          child: Row(
                            children: [
                              CircleAvatar(
                                backgroundColor: AppColors.transparent,
                                backgroundImage: NetworkImage(
                                  AllController.productC.productDetails.value
                                      .data!.first.shopLogo
                                      .toString(),
                                ),
                              ),
                              Apputils.sizeW10,
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  KText(
                                    text: AllController.productC.productDetails
                                        .value.data!.first.shopName,
                                    fontWeight: FontWeight.w700,
                                  ),
                                  // KText(
                                  //   text: 'view shop',
                                  //   fontSize: 10,
                                  //   color: AppColors.black54,
                                  // ),
                                ],
                              ),
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
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5),
                    //     color: AppColors.white,
                    //   ),
                    //   child: Padding(
                    //     padding: Apputils.paddingAll10,
                    //     child: Column(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         KText(
                    //           text: 'Related products',
                    //           fontWeight: FontWeight.bold,
                    //           fontSize: 16,
                    //         ),
                    //         Divider(),
                    //         GridView.builder(
                    //             shrinkWrap: true,
                    //             primary: false,
                    //             itemCount:AllController.productC.productDetails.value.data!.first.r.length,
                    //             gridDelegate:
                    //                 SliverGridDelegateWithFixedCrossAxisCount(
                    //               crossAxisCount: 2,
                    //               mainAxisSpacing: 10,
                    //               crossAxisSpacing: 10,
                    //               childAspectRatio:
                    //                   MediaQuery.of(context).size.width /
                    //                       (MediaQuery.of(context).size.height /
                    //                           1.52),
                    //             ),
                    //             itemBuilder: (c, i) {
                    //               final item = productList[i];
                    //               return productCard(
                    //                 image: item.,
                    //                 title: title,
                    //                 price: price,
                    //                 discountPrice: ,
                    //               );
                    //             }),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Apputils.sizeH30,
                    Apputils.sizeH20,
                  ],
                ),
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
                child: GestureDetector(
                  onTap: () => AllController.cartC.addNewCart(
                    id: AllController
                        .productC.productDetails.value.data!.first.id,
                    variantColor: selectedColor.value,
                    quantity: 1,
                  ),
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
              ),
              Apputils.sizeW10,
            ],
          ),
        ),
      ),
    );
  }

  _descriptionTab() {
    return Html(
      data: AllController.productC.productDetails.value.data!.first.description
          .toString(),
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

  productSizeColor() {
    return Container(
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
              text: 'Colour:',
              color: AppColors.black54,
            ),
            Apputils.sizeH10,
            FittedBox(
              child: Wrap(
                children: List.generate(
                  AllController
                      .productC.productDetails.value.data!.first.colors!.length,
                  (index) => GestureDetector(
                    onTap: () {
                      selectedColor.value = AllController.productC
                          .productDetails.value.data!.first.colors![index];
                    },
                    child: Padding(
                      padding: Apputils.paddingH5,
                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: selectedColor.value ==
                                AllController.productC.productDetails.value
                                    .data!.first.colors![index]
                            ? AppColors.pink
                            : AppColors.grey.shade100,
                        child: CircleAvatar(
                          backgroundColor: AppColors.white,
                          radius: 17,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: HexColor(
                              AllController.productC.productDetails.value.data!
                                  .first.colors![index],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Apputils.sizeH10,
            ListView.builder(
                shrinkWrap: true,
                primary: false,
                itemCount: AllController.productC.productDetails.value.data!
                    .first.choiceOptions!.length,
                itemBuilder: (c, i) {
                  final item = AllController.productC.productDetails.value.data!
                      .first.choiceOptions![i];
                  return Padding(
                    padding: Apputils.paddingH5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KText(
                          text: item.title.toString() + ':',
                          color: AppColors.black54,
                        ),
                        Apputils.sizeH5,
                        SizedBox(
                          height: 40,
                          child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: item.options!.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (c, i) {
                                final _item = item.options![i];
                                return Obx(
                                  () => Padding(
                                    padding: Apputils.paddingH5,
                                    child: _item.isNum
                                        ? GestureDetector(
                                            onTap: () {
                                              selectedSize.value =
                                                  _item.toString();
                                            },
                                            child: CircleAvatar(
                                              radius: 17,
                                              backgroundColor:
                                                  selectedSize.value == _item
                                                      ? AppColors.pink
                                                      : AppColors.grey100,
                                              child: CircleAvatar(
                                                radius: 16,
                                                backgroundColor:
                                                    AppColors.transparent,
                                                child: CircleAvatar(
                                                  radius: 15,
                                                  backgroundColor:
                                                      AppColors.white,
                                                  child: KText(
                                                    text: _item,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              selectedSize2.value =
                                                  _item.toString();
                                            },
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                  color: selectedSize2.value ==
                                                          _item
                                                      ? AppColors.pink
                                                      : AppColors.grey100,
                                                ),
                                              ),
                                              child: Center(
                                                child: Padding(
                                                  padding: Apputils.paddingAll5,
                                                  child: KText(
                                                    text: _item,
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w600,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                );
                              }),
                        )
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

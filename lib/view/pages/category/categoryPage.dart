// ignore_for_file: must_be_immutable

import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/pages/product/searchProductPage.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/cartIcon.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  var selectedCategory =
      RxInt(AllController.categoryC.allCategory.value.data!.first.id!.toInt());
  var selectedSubCategory = RxString('');
  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AllController.categoryC.isLoading.value = true;

      AllController.categoryC.getSubCategory(selectedCategory.value);
      Future.delayed(Duration(seconds: 2)).then((value) {
        AllController.categoryC.isLoading.value = false;
      });
    });
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: backButton(),
        actions: [
          iconButton(
            onTap: () => Get.to(SearchProductPage()),
            icons: Icons.search,
          ),
          cartIcon(),
          // iconButton(
          //   icons: Icons.shopping_cart_outlined,
          // ),
          iconButton(
            icons: Icons.more_vert,
          ),
        ],
      ),
      body: Obx(
        () => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: AppColors.grey.shade300,
              width: 110,
              alignment: Alignment.topLeft,
              child: ListView.builder(
                  shrinkWrap: true,
                  primary: false,
                  itemCount:
                      AllController.categoryC.allCategory.value.data!.length,
                  itemBuilder: (c, i) {
                    final item =
                        AllController.categoryC.allCategory.value.data![i];
                    return Obx(
                      () => GestureDetector(
                        onTap: () {
                          print(item.id);
                          selectedCategory.value = item.id!;
                          AllController.categoryC
                              .getSubCategory(selectedCategory.value);
                        },
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Container(
                            height: 80,
                            width: 110,
                            decoration: BoxDecoration(
                              color: item.id == selectedCategory.value
                                  ? AppColors.white
                                  : null,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CachedNetworkImageWidget(
                                  imageUrl: item.icon,
                                ),
                                KText(
                                  text: item.name,
                                  fontSize: 11,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Apputils.sizeW5,
            Expanded(
              child: Obx(
                () => AllController.categoryC.isLoading.value == true
                    ? loadingAnimation()
                    : AllController
                            .categoryC.subCategoryList.value.data!.isEmpty
                        ? Center(
                            child: KText(text: 'No data!!'),
                          )
                        : Container(
                            color: AppColors.white,
                            child:
                                // selectedCategory.value != 0
                                //     ?
                                ListView(
                              children: [
                                ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: AllController.categoryC
                                        .subCategoryList.value.data!.length,
                                    itemBuilder: (c, i) {
                                      final item = AllController.categoryC
                                          .subCategoryList.value.data![i];
                                      return Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 50,
                                            child: MaterialButton(
                                              onPressed: () {
                                                AllController.productC
                                                    .getSubCategoryWiseProduct(
                                                        categoryId: item.id);
                                                print(item.id);

                                                if (selectedSubCategory
                                                    .isNotEmpty) {
                                                  selectedSubCategory.value =
                                                      '';
                                                } else {
                                                  selectedSubCategory.value =
                                                      item.id.toString();
                                                }
                                              },
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      KText(
                                                        text: item.name,
                                                        fontSize: 12,
                                                      ),
                                                      Spacer(),
                                                      iconButton(
                                                        onTap: () {
                                                          AllController.productC
                                                              .getSubCategoryWiseProduct(
                                                                  categoryId:
                                                                      item.id);
                                                          if (selectedSubCategory
                                                              .isNotEmpty) {
                                                            selectedSubCategory
                                                                .value = '';
                                                          } else {
                                                            selectedSubCategory
                                                                    .value =
                                                                item.id
                                                                    .toString();
                                                          }
                                                        },
                                                        icons: Icons
                                                            .keyboard_arrow_down_sharp,
                                                        iconSize: 15,
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                              // color: AppColors.pink,
                                              ),
                                          Obx(
                                            () => selectedSubCategory
                                                    .value.isNotEmpty
                                                ? selectedSubCategory.value ==
                                                        item.id.toString()
                                                    ? _categoryListItem()
                                                    : Container()
                                                : Container(),
                                          ),
                                        ],
                                      );
                                    }),
                              ],
                            ),
                            // : _categoryListItem(),
                          ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _categoryListItem() {
    return Obx(
      () => AllController.productC.isLoading.value == true
          ? loadingAnimation()
          : GridView.builder(
              // gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //   crossAxisCount: 3,
              //   mainAxisSpacing: 5,
              //   crossAxisSpacing: 5,
              //   childAspectRatio: .65,
              // ),
              gridDelegate: Apputils.geidDeligate,
              shrinkWrap: true,
              primary: false,
              itemCount:
                  AllController.productC.subCategoryProduct.value.data == null
                      ? 0
                      : AllController
                          .productC.subCategoryProduct.value.data!.length,
              // itemCount: AllController
              //     .categoryC.subCategoryList.value.data!.length,
              itemBuilder: (c, i) {
                final item =
                    AllController.productC.subCategoryProduct.value.data![i];
                return AllController
                        .productC.subCategoryProduct.value.data!.isEmpty
                    ? Center(
                        child: KText(text: 'No data!!'),
                      )
                    : GestureDetector(
                        onTap: () =>
                            Get.toNamed(AppRouteService.categoryProductPage),
                        child: Container(
                          decoration: BoxDecoration(
                            // color: AppColors.pink,
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                              color: AppColors.grey100,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CachedNetworkImageWidget(
                                imageUrl: item.thumbnailImage,
                              ),
                              Apputils.sizeH5,
                              Padding(
                                padding: EdgeInsets.all(3),
                                child: KText(
                                  text: item.name,
                                  textAlign: TextAlign.center,
                                  fontSize: 11,
                                  maxLines: 3,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
              },
            ),
    );
  }
}

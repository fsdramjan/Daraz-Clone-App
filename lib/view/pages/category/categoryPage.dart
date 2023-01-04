// ignore_for_file: must_be_immutable

import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/dummyData/dummyData.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  var selectedCategory = RxInt(0);
  var selectedSubCategory = RxString('');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: backButton(),
        actions: [
          iconButton(
            icons: Icons.search,
          ),
          iconButton(
            icons: Icons.shopping_cart_outlined,
          ),
          iconButton(
            icons: Icons.more_vert,
          ),
        ],
      ),
      body: Row(
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
                itemCount: categoryList.length,
                itemBuilder: (c, i) {
                  final item = categoryList[i];
                  return Obx(
                    () => GestureDetector(
                      onTap: () {
                        selectedCategory.value = i;
                      },
                      child: Padding(
                        padding: EdgeInsets.all(2),
                        child: Container(
                          height: 80,
                          width: 110,
                          decoration: BoxDecoration(
                            color: i == selectedCategory.value
                                ? AppColors.white
                                : null,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CachedNetworkImageWidget(
                                imageUrl: item['image'],
                              ),
                              KText(
                                text: item['title'],
                                fontSize: 11,
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
              () => Container(
                color: AppColors.white,
                child: selectedCategory.value != 0
                    ? ListView(
                        children: [
                          ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              itemCount: subCategoryList.length,
                              itemBuilder: (c, i) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 50,
                                      child: MaterialButton(
                                        onPressed: () {
                                          if (selectedSubCategory.isNotEmpty) {
                                            selectedSubCategory.value = '';
                                          } else {
                                            selectedSubCategory.value =
                                                i.toString();
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
                                                  CrossAxisAlignment.center,
                                              children: [
                                                KText(
                                                  text: subCategoryList[i],
                                                  fontSize: 12,
                                                ),
                                                Spacer(),
                                                Obx(
                                                  () => iconButton(
                                                    onTap: () {
                                                      if (selectedSubCategory
                                                          .isNotEmpty) {
                                                        selectedSubCategory
                                                            .value = '';
                                                      } else {
                                                        selectedSubCategory
                                                                .value =
                                                            i.toString();
                                                      }
                                                    },
                                                    icons: selectedSubCategory
                                                            .value.isNotEmpty
                                                        ? Icons
                                                            .keyboard_arrow_up_rounded
                                                        : Icons
                                                            .keyboard_arrow_down_sharp,
                                                    iconSize: 15,
                                                  ),
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
                                      () => selectedSubCategory.value.isNotEmpty
                                          ? selectedSubCategory.value ==
                                                  i.toString()
                                              ? _categoryListItem()
                                              : Container()
                                          : Container(),
                                    ),
                                  ],
                                );
                              }),
                        ],
                      )
                    : _categoryListItem(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  _categoryListItem() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: .65,
      ),
      shrinkWrap: true,
      primary: false,
      itemCount: categoryList.length,
      itemBuilder: (c, i) {
        final item = categoryList[i];
        return GestureDetector(
          onTap: () => Get.toNamed(AppRouteService.categoryProductPage),
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
                  imageUrl: item['image'],
                ),
                Apputils.sizeH5,
                Padding(
                  padding: EdgeInsets.all(3),
                  child: KText(
                    text: item['title'],
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
    );
  }
}

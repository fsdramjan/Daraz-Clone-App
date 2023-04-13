import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/formfield/cFormField.dart';
import 'package:enayas_app/view/widgets/productCard/productCard.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'productDetailsPage.dart';

class SearchProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: .5,
        leading: backButton(),
        title: cFormField(
          controller: AllController.productC.searchText.value,
          hintText: 'Search anything...',
          filledColor: AppColors.grey100,
          onChanged: (_) {
            AllController.productC.getSearchProduct();
          },
          suffixIcon: iconButton(
            onTap: () {
              AllController.productC.getSearchProduct();
            },
            icons: Icons.search,
          ),
        ),
      ),
      body: Obx(
        () => AllController.productC.isLoading.value == true
            ? loadingAnimation()
            : AllController.productC.searchText.value.text == ''
                ? Center(
                    child: KText(text: 'Search anything...'),
                  )
                : Padding(
                    padding: Apputils.paddingH10,
                    child: GridView.builder(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: AllController
                            .productC.searchProduct.value.data!.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: MediaQuery.of(context).size.width /
                              (MediaQuery.of(context).size.height / 1.52),
                        ),
                        itemBuilder: (c, i) {
                          final item = AllController
                              .productC.searchProduct.value.data![i];
                          return AllController
                                  .productC.searchProduct.value.data!.isEmpty
                              ? Center(
                                  child: KText(text: 'No data!!'),
                                )
                              : productCard(
                                  onTap: () => Get.to(
                                      ProductDetailsPage(productId: item.id)),
                id: item.id,

                                  title: item.name,
                                  image: item.thumbnailImage,
                                  price: item.mainPrice.toString(),
                                  discountPrice: item.strokedPrice.toString(),
                                );
                        }),
                  ),
      ),
    );
  }
}

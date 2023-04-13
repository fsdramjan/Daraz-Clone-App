import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:enayas_app/view/pages/cart/model/cartlistModel.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {
  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  quantityAdd(CartItems productResponse) {
    if (AllController.cartC.quantity.value >
        productResponse.upperLimit!.toInt()) {
      setState(() {
        int qty = productResponse.quantity!.toInt();
        qty++;
        productResponse.quantity = qty;
      });
    } else {}

    print(productResponse.quantity);

    AllController.cartC.subTotalAmountCal(productResponse.id);

    // _totalAmountGet();
  }

  quantityMinus(CartItems productResponse) {
    if (productResponse.quantity! > productResponse.lowerLimit!.toInt()) {
      setState(() {
        int qty = productResponse.quantity!.toInt();
        qty--;
        productResponse.quantity = qty;
      });
      print(productResponse.quantity);

      AllController.cartC.subTotalAmountCal(productResponse.id);

      // _totalAmountGet();
    }
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      AllController.cartC.getAllCart();
    });
    return Scaffold(
      backgroundColor: AppColors.grey100,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Obx(
          () => KText(
            text: AllController.cartC.cartList.isEmpty
                ? 'My Cart(0)'
                : 'My Cart(${AllController.cartC.cartList.length.toString()})',
            fontSize: 15,
          ),
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
      body: Obx(
        () => AllController.cartC.isLoading.value == true
            ? loadingAnimation()
            : AllController.cartC.cartList.isEmpty
                ? Center(
                    child: KText(text: 'No cart data!!'),
                  )
                : ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    itemCount: AllController.cartC.cartList.length,
                    itemBuilder: (c, i) {
                      final item = AllController.cartC.cartList[i];
                      return Padding(
                        padding: EdgeInsets.only(bottom: 5),
                        child: Card(
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
                                    iconButton(
                                      onTap: () {
                                        item.cartItems!.map((e) {
                                          if (AllController
                                              .cartC.selectedCartItem
                                              .contains(e.productId)) {
                                          } else {
                                            AllController.cartC.selectedCartItem
                                                .add(e);
                                            AllController.cartC
                                                .subTotalAmountCal(e.productId);
                                          }
                                        }).toList();
                                        print(
                                          AllController.cartC.selectedCartItem,
                                        );
                                      },
                                      icons: Icons.circle_outlined,
                                      iconColor: AppColors.grey.shade400,
                                    ),
                                    Apputils.sizeW10,
                                    KText(
                                      text: item.name,
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
                                ListView.builder(
                                    shrinkWrap: true,
                                    primary: false,
                                    itemCount: item.cartItems!.length,
                                    itemBuilder: (c, i) {
                                      final cartItem = item.cartItems![i];
                                      return Obx(
                                        () => Padding(
                                          padding: EdgeInsets.only(bottom: 5),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              iconButton(
                                                onTap: () => AllController.cartC
                                                    .selectedCart(cartItem),
                                                icons: AllController
                                                        .cartC.selectedCartItem
                                                        .contains(
                                                            cartItem.productId)
                                                    ? Icons.circle
                                                    : Icons.circle_outlined,
                                                iconColor: AllController
                                                        .cartC.selectedCartItem
                                                        .contains(
                                                            cartItem.productId)
                                                    ? AppColors.pink
                                                    : AppColors.grey.shade400,
                                              ),

                                              Apputils.sizeW10,
                                              // FlutterLogo(
                                              //   size: Get.width / 6,
                                              // ),
                                              CachedNetworkImageWidget(
                                                imageUrl: cartItem
                                                    .productThumbnailImage,
                                                width: Get.width / 6,
                                              ),
                                              Apputils.sizeW10,
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 5),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: Get.width / 1.7,
                                                      child: KText(
                                                        text: cartItem
                                                            .productName
                                                            .toString()
                                                            .capitalizeFirst,
                                                        maxLines: 1,
                                                        fontSize: 13,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                      ),
                                                    ),
                                                    KText(
                                                      text:
                                                          'Color Family : ${cartItem.variation}',
                                                      fontSize: 11,
                                                      color: AppColors
                                                          .grey.shade600,
                                                    ),
                                                    // KText(
                                                    //   text: 'Only 1 items in stock',
                                                    //   fontSize: 11,
                                                    //   color: AppColors.pink
                                                    //       .withOpacity(.7),
                                                    // ),
                                                    Apputils.sizeH5,
                                                    SizedBox(
                                                      width: Get.width / 1.7,
                                                      child: Row(
                                                        children: [
                                                          KText(
                                                            text: cartItem
                                                                    .currencySymbol
                                                                    .toString() +
                                                                cartItem.price
                                                                    .toString(),
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w600,
                                                            color:
                                                                AppColors.pink,
                                                          ),
                                                          Spacer(),
                                                          KText(
                                                            text:
                                                                'Qty: ${cartItem.quantity}',
                                                            fontSize: 12,
                                                            color: AppColors
                                                                .grey.shade600,
                                                          ),
                                                          Row(
                                                            children: [
                                                              iconButton(
                                                                onTap: () =>
                                                                    quantityMinus(
                                                                        cartItem),
                                                                icons: Icons
                                                                    .remove_circle_outline,
                                                                iconSize: 15,
                                                                iconColor:
                                                                    AppColors
                                                                        .pink,
                                                              ),
                                                              Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5),
                                                                  color: AppColors
                                                                      .grey100,
                                                                ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    horizontal:
                                                                        10,
                                                                    vertical: 4,
                                                                  ),
                                                                  child: Obx(
                                                                    () => KText(
                                                                      text: AllController
                                                                          .cartC
                                                                          .quantity
                                                                          .value
                                                                          .toString(),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                              iconButton(
                                                                onTap: () =>
                                                                    quantityAdd(
                                                                        cartItem),
                                                                icons: Icons
                                                                    .add_circle_outline,
                                                                iconSize: 15,
                                                                iconColor:
                                                                    Colors
                                                                        .green,
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }),
                                Apputils.sizeH10,
                                Container(
                                  height: .5,
                                  width: Get.width,
                                  color: AppColors.grey.shade300,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
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
              // TextButton.icon(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.circle_outlined,
              //     size: 20,
              //     color: AppColors.grey.shade400,
              //   ),
              //   label: KText(
              //     text: 'All',
              //     fontSize: 12,
              //   ),
              // ),
              // Spacer(),
              Apputils.sizeW20,
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
                        Obx(
                          () => KText(
                            text: Apputils.tkSymbol +
                                ' ${AllController.cartC.subTotalAmount.value}',
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: AppColors.pink,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Apputils.sizeW10,
              Spacer(),

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
                  child: Obx(
                    () => KText(
                      text:
                          'Check Out (${AllController.cartC.selectedCartItem.length})',
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
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
}

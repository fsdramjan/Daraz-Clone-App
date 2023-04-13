import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/loading.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/pages/product/productDetailsPage.dart';
import 'package:enayas_app/view/pages/product/searchProductPage.dart';
import 'package:enayas_app/view/pages/splash/splashPage.dart';
import 'package:enayas_app/view/pages/wishlist/wishlistPage.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/formfield/cFormField.dart';
import 'package:enayas_app/view/widgets/productCard/productCard.dart';
import 'package:enayas_app/view/widgets/slider/sliderWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:enayas_app/view/widgets/categoryCard/categoryCard.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // Timer? _timer;
  // int _start = 59;

  // void startTimer() {
  //   const oneSec = const Duration(seconds: 1);
  //   _timer = new Timer.periodic(
  //     oneSec,
  //     (Timer timer) {
  //       if (_start == 0) {
  //         setState(() {
  //           // timer.cancel();
  //           _start = 59;
  //         });
  //       } else {
  //         setState(() {
  //           _start--;
  //         });
  //       }
  //     },
  //   );
  // }

  getCurrentLocation() async {
    Position position = await getGeoLocationPosition();
    location = '${position.latitude},${position.longitude}';
    getAddressFromLatLong(position);
  }

  @override
  void initState() {
    // startTimer();
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    // _timer!.cancel();
    super.dispose();
  }

  bool isTransparentAppbar = true;

  RxInt selectedJCategory = RxInt(99999);

  @override
  Widget build(context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(Get.width, 45),
        child: AppBar(
          backgroundColor: AppColors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: cFormField(
              height: 35,
              readOnly: true,
              hintText: 'money bag for men',
              onTap: () => Get.to(SearchProductPage()),
              filledColor: AppColors.grey100,
              prefixIcon: Icon(
                Icons.search,
              )),
          actions: [
            iconButton(
              tooltip: 'Compare',
              icons: Icons.autorenew_outlined,
              iconColor: AppColors.black,
            ),
            Stack(
              clipBehavior: Clip.none,
              children: [
                iconButton(
                  onTap: () => Get.to(WishlistPage()),
                  tooltip: 'Wishlist',
                  icons: Icons.favorite_outline,
                  iconColor: AppColors.black,
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: Obx(
                    () => AllController.wishlistC.isLoading.value == true
                        ? Container()
                        : AllController.wishlistC.wishlist.value.data!.length ==
                                0
                            ? Container()
                            : CircleAvatar(
                                radius: 7.5,
                                backgroundColor: AppColors.pink,
                                child: KText(
                                  text: AllController
                                      .wishlistC.wishlist.value.data!.length
                                      .toString(),
                                  color: AppColors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 9,
                                ),
                              ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      body:
          //  ScaffoldLayoutBuilder(
          //   backgroundColorAppBar: ColorBuilder(
          //     Colors.transparent,
          //     AppColors.white,
          //   ),
          //   textColorAppBar: ColorBuilder(AppColors.black),
          //   appBarBuilder: _appBars,
          //   child:

          SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          // primary: false,
          children: [
            SizedBox(
              height: 150,
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  SliderWidget(sliderHeight: 150),
                  Positioned(
                    bottom: -35,
                    left: 20,
                    right: 20,
                    child: Card(
                      child: Container(
                        width: Get.width,
                        height: 40,
                        child: Row(
                          children: [
                            Apputils.sizeW10,
                            Icon(
                              Icons.location_on_outlined,
                              size: 20,
                              color: AppColors.pink,
                            ),
                            Apputils.sizeW10,
                            Container(
                              height: 20,
                              width: .5,
                              color: AppColors.black.withOpacity(.3),
                            ),
                            Apputils.sizeW10,
                            Obx(
                              () => FittedBox(
                                child: KText(
                                  text: address.value != ''
                                      ? address.value
                                      : 'Set your delivery location',
                                  fontSize: 13,
                                  fontWeight: FontWeight.normal,
                                  color: AppColors.black.withOpacity(.7),
                                ),
                              ),
                            ),
                            Apputils.sizeW10,
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Apputils.sizeH30,
            Apputils.sizeH20,
            Obx(
              () => AllController.categoryC.isLoading.value == true
                  ? loadingAnimation()
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: AllController.categoryC.topCategory.value.data!
                          .map((e) => Container(
                                height: 80,
                                child: Column(
                                  children: [
                                    Container(
                                      height: 60,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),

                                        color: AppColors.pink.withOpacity(.05),
                                        // border: Border.all(
                                        //   color: AppColors.grey,
                                        // ),
                                      ),
                                      child: CachedNetworkImageWidget(
                                        borderRadius: BorderRadius.circular(5),
                                        isImgCircular: true,
                                        imageUrl: e.icon,
                                        height: 60,
                                      ),
                                    ),
                                    SizedBox(height: 3),
                                    Expanded(
                                      child: KText(
                                        text: e.name,
                                        fontSize: 11,
                                        fontWeight: FontWeight.normal,
                                        color: AppColors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ))
                          .toList(),
                    ),
            ),
            Apputils.sizeH10,
            Padding(
              padding: Apputils.paddingH10,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  'https://icms-image.slatic.net/images/ims-web/ac5a9829-a8d2-4ec9-9ef6-015a31898d9b.jpg_1200x1200.jpg',
                  height: 130,
                ),
              ),
            ),

            // _flashCard(),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  KText(
                    text: 'Categories',
                    fontWeight: FontWeight.normal,
                    fontSize: 18,
                  ),
                  Spacer(),
                  TextButton(
                    onPressed: () => Get.toNamed(AppRouteService.category),
                    child: KText(
                      text: 'Shop More >',
                      color: AppColors.pink,
                    ),
                  ),
                ],
              ),
            ),

            Apputils.sizeH10,
            Obx(
              () => AllController.categoryC.isLoading.value == true
                  ? loadingAnimation()
                  : Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        height: 200,
                        child: Padding(
                          padding: Apputils.paddingH10,
                          child: GridView.builder(
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 8,
                              crossAxisSpacing: 8,
                              childAspectRatio: MediaQuery.of(context)
                                      .size
                                      .width /
                                  (MediaQuery.of(context).size.height / 2.4),
                            ),
                            shrinkWrap: true,
                            primary: false,
                            itemCount: AllController
                                .categoryC.allCategory.value.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (c, i) {
                              final item = AllController
                                  .categoryC.allCategory.value.data![i];
                              return categoryCard(
                                onTap: () => Get.toNamed(
                                    AppRouteService.categoryProductPage),
                                title: item.name,
                                image: item.icon,
                              );
                            },
                          ),
                        ),
                      ),
                    ),
            ),

            Apputils.sizeH10,

            Padding(
              padding: Apputils.paddingH10,
              child: CachedNetworkImageWidget(
                isImgCircular: true,
                imageUrl:
                    'https://icms-image.slatic.net/images/ims-web/19a118f8-f78e-42c9-940a-c8551da80ac0.jpg',
                width: Get.width,
                fit: BoxFit.cover,
              ),
            ),

            // Apputils.sizeH10,

            // Center(
            //   child: SizedBox(
            //     height: 100,
            //     child: ListView.builder(
            //         shrinkWrap: true,
            //         primary: false,
            //         itemCount: productList.length,
            //         scrollDirection: Axis.horizontal,
            //         itemBuilder: (c, i) {
            //           final item = productList[i];
            //           return FittedBox(
            //             child: Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 5),
            //               child: Container(
            //                 decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(5),
            //                     border: Border.all(color: AppColors.grey100)),
            //                 child: Column(
            //                   children: [
            //                     CachedNetworkImageWidget(
            //                       imageUrl: item['image'],
            //                     ),
            //                     KText(
            //                       text: Apputils.tkSymbol +
            //                           item['price'].toString(),
            //                       fontSize: 8,
            //                       color: AppColors.black.withOpacity(.7),
            //                     ),
            //                   ],
            //                 ),
            //               ),
            //             ),
            //           );
            //         }),
            //   ),
            // ),

            // Apputils.sizeH10,

            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 10),
            //   child: Row(
            //     children: [
            //       KText(
            //         text: 'Trending Now',
            //         fontWeight: FontWeight.normal,
            //         fontSize: 18,
            //       ),
            //       Spacer(),
            //       TextButton(
            //         onPressed: () {},
            //         child: KText(
            //           text: 'Shop More >',
            //           color: AppColors.pink,
            //         ),
            //       ),
            //     ],
            //   ),
            // ),

            // // Apputils.sizeH10,

            // SizedBox(
            //   height: 330,
            //   child: Padding(
            //     padding: Apputils.paddingH10,
            //     child: GridView.builder(
            //       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //         crossAxisCount: 2,
            //         mainAxisSpacing: 8,
            //         crossAxisSpacing: 8,
            //         childAspectRatio: 1,
            //       ),
            //       shrinkWrap: true,
            //       primary: false,
            //       itemCount: productList.length,
            //       scrollDirection: Axis.horizontal,
            //       itemBuilder: (c, i) {
            //         final item = productList[i];
            //         return Padding(
            //           padding: EdgeInsets.symmetric(horizontal: 5),
            //           child: Container(
            //             decoration: BoxDecoration(
            //               borderRadius: BorderRadius.circular(10),
            //               border: Border.all(
            //                 color: AppColors.grey100,
            //               ),
            //             ),
            //             child: Padding(
            //               padding: EdgeInsets.symmetric(horizontal: 5),
            //               child: Stack(
            //                 children: [
            //                   Container(
            //                     width: 120,
            //                     // height: 150,
            //                     decoration: BoxDecoration(
            //                       borderRadius: BorderRadius.circular(5),
            //                     ),
            //                     child: Column(
            //                       children: [
            //                         CachedNetworkImageWidget(
            //                           imageUrl: item['image'],
            //                           fit: BoxFit.cover,
            //                           width: 120,
            //                           height: 80,
            //                         ),
            //                         Apputils.sizeH5,
            //                         KText(
            //                           text: item['title'],
            //                           color: AppColors.black.withOpacity(.7),
            //                           fontWeight: FontWeight.normal,
            //                           fontSize: 13,
            //                           maxLines: 2,
            //                         ),
            //                         Apputils.sizeH5,
            //                         KText(
            //                           text: '17k people searched this prod...',
            //                           color: AppColors.black.withOpacity(.7),
            //                           fontSize: 12,
            //                           fontWeight: FontWeight.normal,
            //                           maxLines: 2,
            //                         ),
            //                       ],
            //                     ),
            //                   ),
            //                 ],
            //               ),
            //             ),
            //           ),
            //         );
            //       },
            //     ),
            //   ),
            // ),

            Apputils.sizeH10,

            Padding(
              padding: Apputils.paddingH10,
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImageWidget(
                      imageUrl:
                          'https://icms-image.slatic.net/images/ims-web/ac5a9829-a8d2-4ec9-9ef6-015a31898d9b.jpg_1200x1200.jpg',
                      height: 80,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Apputils.sizeW5,
                  CachedNetworkImageWidget(
                    imageUrl:
                        'https://icms-image.slatic.net/images/ims-web/50c244b9-34b2-4350-8222-2303ac7f6d8e.jpg',
                    width: Get.width / 3.5,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Apputils.sizeH10,

            Padding(
              padding: Apputils.paddingH10,
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImageWidget(
                      imageUrl:
                          'https://icms-image.slatic.net/images/ims-web/ac5a9829-a8d2-4ec9-9ef6-015a31898d9b.jpg_1200x1200.jpg',
                      height: 80,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Apputils.sizeW5,
                  CachedNetworkImageWidget(
                    imageUrl:
                        'https://icms-image.slatic.net/images/ims-web/50c244b9-34b2-4350-8222-2303ac7f6d8e.jpg',
                    width: Get.width / 3.5,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Apputils.sizeH10,

            Padding(
              padding: Apputils.paddingH10,
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImageWidget(
                      imageUrl:
                          'https://icms-image.slatic.net/images/ims-web/50c244b9-34b2-4350-8222-2303ac7f6d8e.jpg',
                      height: 80,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Apputils.sizeW5,
                  CachedNetworkImageWidget(
                    imageUrl:
                        'https://icms-image.slatic.net/images/ims-web/ac5a9829-a8d2-4ec9-9ef6-015a31898d9b.jpg_1200x1200.jpg',
                    width: Get.width / 3.5,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Apputils.sizeH10,

            Padding(
              padding: Apputils.paddingH10,
              child: Row(
                children: [
                  Expanded(
                    child: CachedNetworkImageWidget(
                      imageUrl:
                          'https://icms-image.slatic.net/images/ims-web/ac5a9829-a8d2-4ec9-9ef6-015a31898d9b.jpg_1200x1200.jpg',
                      height: 80,
                      width: Get.width,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Apputils.sizeW5,
                  CachedNetworkImageWidget(
                    imageUrl:
                        'https://icms-image.slatic.net/images/ims-web/50c244b9-34b2-4350-8222-2303ac7f6d8e.jpg',
                    width: Get.width / 3.5,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),

            Apputils.sizeH10,

            Center(
              child: KText(
                text: 'Just For You',
              ),
            ),
            Apputils.sizeH10,

            Obx(
              () => AllController.categoryC.isLoading.value == true
                  ? loadingAnimation()
                  : Align(
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  selectedJCategory.value = 99999;
                                  AllController.productC.getAllProduct();
                                },
                                child: SizedBox(
                                  width: 50,
                                  height: 70,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 40,
                                        child: Icon(
                                          Icons.category_outlined,
                                          color: AppColors.black54,
                                        ),
                                      ),
                                      // Apputils.sizeH10,
                                      // Spacer(),
                                      KText(
                                        text: 'All',
                                        fontSize: 10,
                                      ),
                                      selectedJCategory.value == 99999
                                          ? Center(
                                              child: Container(
                                                color: AppColors.pink,
                                                height: .8,
                                                width: 40,
                                              ),
                                            )
                                          : SizedBox(),
                                    ],
                                  ),
                                ),
                              ),
                              Apputils.sizeW10,
                              Container(
                                height: 20,
                                width: .6,
                                color: AppColors.black,
                              ),
                              Apputils.sizeW10,
                            ],
                          ),
                          SizedBox(
                            height: 70,
                            child: ListView.builder(
                              shrinkWrap: true,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: AllController
                                  .categoryC.allCategory.value.data!.length,
                              itemBuilder: (c, i) {
                                final item = AllController
                                    .categoryC.allCategory.value.data![i];
                                return Obx(
                                  () => Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          selectedJCategory.value = i;

                                          AllController.productC
                                              .getCategoryWiseProduct(
                                            categoryId: item.id,
                                          );
                                        },
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            CachedNetworkImageWidget(
                                              imageUrl: item.icon,
                                              height: 40,
                                            ),
                                            // Transform.scale(
                                            //   scale: .6,
                                            //   child: CachedNetworkImageWidget(
                                            //     imageUrl: item.icon,
                                            //   ),
                                            // ),
                                            // Apputils.sizeH10,
                                            KText(
                                              text: item.name,
                                              fontSize: 10,
                                            ),
                                            selectedJCategory.value == i
                                                ? Center(
                                                    child: Container(
                                                      color: AppColors.pink,
                                                      height: .8,
                                                      width: 40,
                                                    ),
                                                  )
                                                : SizedBox(),
                                          ],
                                        ),
                                      ),
                                      item.name ==
                                              AllController
                                                  .categoryC
                                                  .allCategory
                                                  .value
                                                  .data!
                                                  .last
                                                  .name
                                          ? Container()
                                          : Apputils.sizeW10,
                                      item.name ==
                                              AllController
                                                  .categoryC
                                                  .allCategory
                                                  .value
                                                  .data!
                                                  .last
                                                  .name
                                          ? Container()
                                          : Container(
                                              height: 20,
                                              width: .6,
                                              color: AppColors.black,
                                            ),
                                      item.name ==
                                              AllController
                                                  .categoryC
                                                  .allCategory
                                                  .value
                                                  .data!
                                                  .last
                                                  .name
                                          ? Container()
                                          : Apputils.sizeW10,
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
            Apputils.sizeH10,

            Obx(
              () => AllController.productC.isLoading.value == true
                  ? loadingAnimation()
                  : AllController.productC.product.value.data!.isEmpty
                      ? Center(
                          child: KText(
                            text: 'No data!!',
                          ),
                        )
                      : _productCard(),
            ),
            Apputils.sizeH30,
            Apputils.sizeH30,
            Apputils.sizeH30,
          ],
        ),
      ),
    );
  }

  Widget _productCard() {
    return Obx(
      () => Padding(
        padding: Apputils.paddingH10,
        child: GridView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: AllController.productC.product.value.data!.length,
            gridDelegate: Apputils.geidDeligate,
            itemBuilder: (c, i) {
              final item = AllController.productC.product.value.data![i];
              return productCard(
                onTap: () => Get.to(ProductDetailsPage(productId: item.id)),
                id: item.id,
                title: item.name,
                image: item.thumbnailImage,
                price: item.mainPrice.toString(),
                discountPrice: item.strokedPrice.toString(),
              );
            }),
      ),
    );
  }

  // // ignore: unused_element
  // _flashCard() {
  //   return Column(
  //     children: [
  //       Padding(
  //         padding: EdgeInsets.symmetric(horizontal: 10),
  //         child: Row(
  //           children: [
  //             KText(
  //               text: 'Flash Sale',
  //               fontWeight: FontWeight.normal,
  //               fontSize: 18,
  //             ),
  //             Apputils.sizeW5,
  //             Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: AppColors.black,
  //               ),
  //               height: 30,
  //               width: 30,
  //               child: Center(
  //                 child: KText(
  //                   text: '00',
  //                   color: AppColors.white,
  //                   fontWeight: FontWeight.normal,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //             Apputils.sizeW5,
  //             Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: AppColors.black,
  //               ),
  //               height: 30,
  //               width: 30,
  //               child: Center(
  //                 child: KText(
  //                   text: '00',
  //                   color: AppColors.white,
  //                   fontWeight: FontWeight.normal,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //             Apputils.sizeW5,
  //             Container(
  //               decoration: BoxDecoration(
  //                 borderRadius: BorderRadius.circular(5),
  //                 color: AppColors.black,
  //               ),
  //               height: 30,
  //               width: 30,
  //               child: Center(
  //                 child: KText(
  //                   text: '$_start',
  //                   color: AppColors.white,
  //                   fontWeight: FontWeight.normal,
  //                   fontSize: 16,
  //                 ),
  //               ),
  //             ),
  //             Spacer(),
  //             TextButton(
  //               onPressed: () {},
  //               child: KText(
  //                 text: 'Shop More >',
  //                 color: AppColors.pink,
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //       Apputils.sizeH10,
  //       Padding(
  //         padding: Apputils.paddingH10,
  //         child: SizedBox(
  //           height: 130,
  //           child: ListView.builder(
  //               shrinkWrap: true,
  //               primary: false,
  //               itemCount: productList.length,
  //               scrollDirection: Axis.horizontal,
  //               itemBuilder: (c, i) {
  //                 final item = productList[i];
  //                 return Padding(
  //                   padding: EdgeInsets.only(right: 10),
  //                   child: Stack(
  //                     children: [
  //                       Container(
  //                         width: 120,
  //                         height: 130,
  //                         decoration: BoxDecoration(
  //                           // border: Border.all(
  //                           //   color: AppColors.pink,
  //                           // ),
  //                           borderRadius: BorderRadius.circular(5),
  //                         ),
  //                         child: Column(
  //                           children: [
  //                             CachedNetworkImageWidget(
  //                               imageUrl: item['image'],
  //                               fit: BoxFit.cover,
  //                               width: 120,
  //                               height: 80,
  //                             ),
  //                             Apputils.sizeH5,
  //                             Container(
  //                               height: 20,
  //                               width: 120,
  //                               decoration: BoxDecoration(
  //                                 borderRadius: BorderRadius.circular(10),
  //                                 color: AppColors.pink.withOpacity(.5),
  //                               ),
  //                               alignment: Alignment.centerLeft,
  //                               child: Row(
  //                                 children: [
  //                                   CircleAvatar(
  //                                     radius: 10,
  //                                     backgroundColor: AppColors.pink,
  //                                     child: KText(
  //                                       text: '3',
  //                                       color: AppColors.white,
  //                                     ),
  //                                   ),
  //                                   KText(
  //                                     text: ' sold',
  //                                     color: AppColors.white,
  //                                   ),
  //                                 ],
  //                               ),
  //                             ),
  //                             Apputils.sizeH5,
  //                             Row(
  //                               mainAxisAlignment: MainAxisAlignment.start,
  //                               crossAxisAlignment: CrossAxisAlignment.center,
  //                               children: [
  //                                 KText(
  //                                   text: Apputils.tkSymbol,
  //                                   fontSize: 12,
  //                                   color: AppColors.pink,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                                 KText(
  //                                   text: item['price'].toString(),
  //                                   color: AppColors.pink,
  //                                   fontWeight: FontWeight.bold,
  //                                 ),
  //                               ],
  //                             ),
  //                           ],
  //                         ),
  //                       ),
  //                       Positioned(
  //                         top: 5,
  //                         right: 10,
  //                         child: Container(
  //                           // height: 20,
  //                           decoration: BoxDecoration(
  //                             color: AppColors.pink,
  //                             borderRadius: BorderRadius.circular(5),
  //                           ),
  //                           child: Padding(
  //                             padding: Apputils.paddingAll5,
  //                             child: KText(
  //                               text: '30%',
  //                               color: AppColors.white,
  //                               fontSize: 11,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 );
  //               }),
  //         ),
  //       ),
  //     ],
  //   );
  // }
}

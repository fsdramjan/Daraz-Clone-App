import 'dart:async';

import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/slider/sliderWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/dummyData/dummyData.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Timer? _timer;
  int _start = 59;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            // timer.cancel();
            _start = 59;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    startTimer();
    _controller = ScrollController();
    _controller.addListener(_scrollListener);
    super.initState();
  }

  late ScrollController _controller;
  String? message = '';

  _scrollListener() {
    if (_controller.offset <= _controller.position.minScrollExtent &&
        !_controller.position.outOfRange) {
      setState(() {
        isTransparentAppbar = true;
      });

      print(isTransparentAppbar);
    } else {
      setState(() {
        isTransparentAppbar = false;
      });
      print(isTransparentAppbar);
    }
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  bool isTransparentAppbar = true;

  RxInt selectedJCategory = RxInt(0);

  _appBar() {
    return AppBar(
      backgroundColor: AppColors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: SizedBox(
        height: 35,
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.transparent,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: AppColors.transparent,
              ),
            ),
            prefixIcon: Icon(
              Icons.search,
              color: Colors.grey,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: 'money bag for men',
            fillColor: AppColors.grey100,
            filled: true,
          ),
        ),
      ),
      actions: [
        iconButton(
          tooltip: 'Compare',
          icons: Icons.autorenew_outlined,
          iconColor: AppColors.black,
        ),
        iconButton(
          tooltip: 'Wishlist',
          icons: Icons.favorite_outline,
          iconColor: AppColors.black,
        ),
      ],
    );
  }

  @override
  Widget build(context) {
    return Scaffold(
      // backgroundColor: AppColors.pink,
      appBar: isTransparentAppbar == true ? null : _appBar(),

      body: Scrollbar(
        controller: _controller,
        child: SingleChildScrollView(
          controller: _controller,
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
                    isTransparentAppbar != true
                        ? Container()
                        : Positioned(
                            // top: 40,

                            child: SizedBox(
                              // height: 50,
                              child: AppBar(
                                backgroundColor: AppColors.transparent,
                                elevation: 0,
                                automaticallyImplyLeading: false,
                                title: SizedBox(
                                  height: 35,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: AppColors.transparent,
                                        ),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(5),
                                        borderSide: BorderSide(
                                          color: AppColors.transparent,
                                        ),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.grey,
                                      ),
                                      contentPadding:
                                          EdgeInsets.symmetric(horizontal: 10),
                                      hintText: 'money bag for men',
                                      fillColor: AppColors.white,
                                      filled: true,
                                    ),
                                  ),
                                ),
                                actions: [
                                  iconButton(
                                    tooltip: 'Compare',
                                    icons: Icons.autorenew_outlined,
                                    iconColor: AppColors.black,
                                  ),
                                  iconButton(
                                    tooltip: 'Wishlist',
                                    icons: Icons.favorite_outline,
                                    iconColor: AppColors.black,
                                  ),
                                ],
                              ),
                            ),
                          ),
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
                              KText(
                                text: 'Set your delivery location',
                                fontSize: 14,
                                fontWeight: FontWeight.normal,
                                color: AppColors.black.withOpacity(.7),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: topCategoryList
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
                                  imageUrl: e['image'],
                                  height: 60,
                                ),
                              ),
                              SizedBox(height: 3),
                              Expanded(
                                child: KText(
                                  text: e['title'],
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
              // Apputils.sizeH20,
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
              SizedBox(
                height: 200,
                child: Padding(
                  padding: Apputils.paddingH10,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 2.4),
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: categoryList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) {
                      final item = categoryList[i];
                      return GestureDetector(
                        onTap: () =>
                            Get.toNamed(AppRouteService.categoryProductPage),
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: AppColors.grey100)),
                          child: Padding(
                            padding: EdgeInsets.all(3),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CachedNetworkImageWidget(
                                  imageUrl: item['image'],
                                  // width: 200,
                                  fit: BoxFit.fitHeight,
                                ),
                                Spacer(),
                                KText(
                                  text: item['title'],
                                  fontSize: 11,
                                  fontWeight: FontWeight.normal,
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
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

              Apputils.sizeH10,

              Center(
                child: SizedBox(
                  height: 100,
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: productList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        final item = productList[i];
                        return FittedBox(
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: AppColors.grey100)),
                              child: Column(
                                children: [
                                  CachedNetworkImageWidget(
                                    imageUrl: item['image'],
                                  ),
                                  KText(
                                    text: Apputils.tkSymbol +
                                        item['price'].toString(),
                                    fontSize: 8,
                                    color: AppColors.black.withOpacity(.7),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),

              Apputils.sizeH10,

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    KText(
                      text: 'Flash Sale',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    Apputils.sizeW5,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.black,
                      ),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: KText(
                          text: '00',
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Apputils.sizeW5,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.black,
                      ),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: KText(
                          text: '00',
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Apputils.sizeW5,
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: AppColors.black,
                      ),
                      height: 30,
                      width: 30,
                      child: Center(
                        child: KText(
                          text: '$_start',
                          color: AppColors.white,
                          fontWeight: FontWeight.normal,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: KText(
                        text: 'Shop More >',
                        color: AppColors.pink,
                      ),
                    ),
                  ],
                ),
              ),

              Apputils.sizeH10,

              Padding(
                padding: Apputils.paddingH10,
                child: SizedBox(
                  height: 130,
                  child: ListView.builder(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: productList.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (c, i) {
                        final item = productList[i];
                        return Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Stack(
                            children: [
                              Container(
                                width: 120,
                                height: 130,
                                decoration: BoxDecoration(
                                  // border: Border.all(
                                  //   color: AppColors.pink,
                                  // ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  children: [
                                    CachedNetworkImageWidget(
                                      imageUrl: item['image'],
                                      fit: BoxFit.cover,
                                      width: 120,
                                      height: 80,
                                    ),
                                    Apputils.sizeH5,
                                    Container(
                                      height: 20,
                                      width: 120,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.pink.withOpacity(.5),
                                      ),
                                      alignment: Alignment.centerLeft,
                                      child: Row(
                                        children: [
                                          CircleAvatar(
                                            radius: 10,
                                            backgroundColor: AppColors.pink,
                                            child: KText(
                                              text: '3',
                                              color: AppColors.white,
                                            ),
                                          ),
                                          KText(
                                            text: ' sold',
                                            color: AppColors.white,
                                          ),
                                        ],
                                      ),
                                    ),
                                    Apputils.sizeH5,
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        KText(
                                          text: Apputils.tkSymbol,
                                          fontSize: 12,
                                          color: AppColors.pink,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        KText(
                                          text: item['price'].toString(),
                                          color: AppColors.pink,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                top: 5,
                                right: 10,
                                child: Container(
                                  // height: 20,
                                  decoration: BoxDecoration(
                                    color: AppColors.pink,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Padding(
                                    padding: Apputils.paddingAll5,
                                    child: KText(
                                      text: '30%',
                                      color: AppColors.white,
                                      fontSize: 11,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      }),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    KText(
                      text: 'Trending Now',
                      fontWeight: FontWeight.normal,
                      fontSize: 18,
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: KText(
                        text: 'Shop More >',
                        color: AppColors.pink,
                      ),
                    ),
                  ],
                ),
              ),

              // Apputils.sizeH10,

              SizedBox(
                height: 330,
                child: Padding(
                  padding: Apputils.paddingH10,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      childAspectRatio: 1,
                    ),
                    shrinkWrap: true,
                    primary: false,
                    itemCount: productList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (c, i) {
                      final item = productList[i];
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.grey100,
                            ),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5),
                            child: Stack(
                              children: [
                                Container(
                                  width: 120,
                                  // height: 150,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    children: [
                                      CachedNetworkImageWidget(
                                        imageUrl: item['image'],
                                        fit: BoxFit.cover,
                                        width: 120,
                                        height: 80,
                                      ),
                                      Apputils.sizeH5,
                                      KText(
                                        text: item['title'],
                                        color: AppColors.black.withOpacity(.7),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        maxLines: 2,
                                      ),
                                      Apputils.sizeH5,
                                      KText(
                                        text:
                                            '17k people searched this prod...',
                                        color: AppColors.black.withOpacity(.7),
                                        fontSize: 12,
                                        fontWeight: FontWeight.normal,
                                        maxLines: 2,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
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

              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 70,
                  child: ListView.builder(
                    shrinkWrap: true,
                    primary: false,
                    scrollDirection: Axis.horizontal,
                    itemCount: jCategoryList.length,
                    itemBuilder: (c, i) {
                      final item = jCategoryList[i];
                      return Obx(
                        () => GestureDetector(
                          onTap: () {
                            selectedJCategory.value = i;
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Transform.scale(
                                    scale: .6,
                                    child: CachedNetworkImageWidget(
                                      imageUrl: item['image'],
                                    ),
                                  ),
                                  // Apputils.sizeH10,
                                  KText(
                                    text: item['title'],
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
                              item['title'] == jCategoryList.last['title']
                                  ? Container()
                                  : Apputils.sizeW10,
                              item['title'] == jCategoryList.last['title']
                                  ? Container()
                                  : Container(
                                      height: 20,
                                      width: .6,
                                      color: AppColors.black,
                                    ),
                              item['title'] == jCategoryList.last['title']
                                  ? Container()
                                  : Apputils.sizeW10,
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              Apputils.sizeH10,

              Padding(
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
                        onTap: () => Get.toNamed(
                          AppRouteService.productDetails,
                        ),
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
                                        padding:
                                            EdgeInsets.symmetric(horizontal: 4),
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
              ),
              Apputils.sizeH30,
              Apputils.sizeH30,
              Apputils.sizeH30,
            ],
          ),
        ),
      ),
    );
  }
}

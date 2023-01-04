// ignore_for_file: must_be_immutable

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/pages/cart/cartPage.dart';
import 'package:enayas_app/view/pages/chat/chatListPage.dart';
import 'package:enayas_app/view/pages/home/homePage.dart';
import 'package:enayas_app/view/pages/profile/profilePage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../services/configs/appColors.dart';
import '../../../services/configs/appUtils.dart';
import '../../widgets/text/kText.dart';

class BottomBarHomePage extends StatefulWidget {
  @override
  State<BottomBarHomePage> createState() => _BottomBarHomePageState();
}

class _BottomBarHomePageState extends State<BottomBarHomePage> {
  var _selectedIndex = RxInt(0);

  RxBool isHome = RxBool(false);

  List<Widget> _items = [
    HomePage(),
    ChatListPage(),
    CartPage(),
    ProfilePage(),
  ];
  @override
  void initState() {
    _selectedIndex.value = 0;
    isHome.value = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        resizeToAvoidBottomInset: false,
        body: Obx(() => _items[_selectedIndex.value]),
        bottomSheet: BottomAppBar(
          elevation: 1,
          child: Container(
            height: 50,
            color: AppColors.white,
            child: Padding(
              padding: Apputils.paddingH10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Obx(
                        () => _button(
                            onTap: () {
                              _selectedIndex.value = 0;
                              isHome.value = true;
                            },
                            icons: Icons.home,
                            text: 'Home',
                            itemIndex: 0,
                            child: isHome.value == true ? Container() : null),
                      ),
                      _selectedIndex.value != 0
                          ? Container()
                          : Positioned(
                              bottom: 10,
                              left: 5,
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  SizedBox(
                                    height: 60,
                                    width: 60,
                                    child: Transform.rotate(
                                      angle: 180,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.pink,
                                        ),
                                        height: 60,
                                        width: 60,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 2,
                                    right: 2,
                                    bottom: 0,
                                    top: 0,
                                    child: DefaultTextStyle(
                                      style: GoogleFonts.lato(
                                        fontSize: 12,
                                        color: AppColors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      child: FittedBox(
                                        child: AnimatedTextKit(
                                          repeatForever: true,
                                          animatedTexts: [
                                            RotateAnimatedText('Shop Now'),
                                            RotateAnimatedText('Categories'),
                                          ],
                                          onTap: () {
                                            print("Tap Event");

                                            Get.toNamed(
                                              AppRouteService.category,
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                    ],
                  ),
                  _button(
                    onTap: () {
                      _selectedIndex.value = 1;
                      isHome.value = false;
                    },
                    icons: Icons.chat_bubble,
                    text: 'Message',
                    itemIndex: 1,
                  ),
                  _button(
                    onTap: () {
                      _selectedIndex.value = 2;
                      isHome.value = false;
                    },
                    icons: Icons.shopping_cart,
                    text: 'Cart',
                    itemIndex: 2,
                  ),
                  _button(
                    onTap: () {
                      _selectedIndex.value = 3;
                      isHome.value = false;
                    },
                    icons: Icons.person,
                    text: 'Profile',
                    itemIndex: 3,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _button({
    required IconData icons,
    required String text,
    required void Function() onTap,
    required int itemIndex,
    Widget? child,
  }) =>
      MaterialButton(
        onPressed: onTap,
        hoverElevation: 0,
        splashColor: AppColors.transparent,
        focusColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: child ??
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  icons,
                  color: itemIndex == _selectedIndex.value
                      ? AppColors.pink
                      : AppColors.black.withOpacity(.5),
                  size: 20,
                ),
                KText(
                  text: text,
                  color: itemIndex == _selectedIndex.value
                      ? AppColors.pink
                      : AppColors.black.withOpacity(.6),
                  fontWeight: FontWeight.w500,
                  fontSize: 12,
                ),
              ],
            ),
      );
}

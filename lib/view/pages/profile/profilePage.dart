import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/widgets/buttons/iconAndBottomTextButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/cachedNetwork/cachedNetworkWidget.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.grey100,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.pink,
              height: 200,
              child: SafeArea(
                child: Padding(
                  padding: Apputils.paddingAll10,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.grey,
                            child: CircleAvatar(
                              backgroundColor: AppColors.pink,
                              radius: 19,
                              child: Icon(Icons.person),
                            ),
                          ),
                          Apputils.sizeW10,
                          KText(
                            text: 'Hello, Welcome to Enayas!',
                            color: AppColors.white,
                          ),
                          Spacer(),
                          iconButton(
                            icons: Icons.settings_outlined,
                            iconColor: AppColors.white,
                          ),
                        ],
                      ),
                      Apputils.sizeH30,
                      GestureDetector(
                        onTap: () => Get.toNamed(AppRouteService.login),
                        child: Card(
                          child: Container(
                            height: 40,
                            width: Get.width / 2,
                            alignment: Alignment.center,
                            child: Padding(
                              padding: Apputils.paddingH10,
                              child: KText(
                                text: 'Login / Signup',
                                fontSize: 15,
                                color: AppColors.pink,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Apputils.sizeH10,
            CachedNetworkImageWidget(
              isImgCircular: true,
              borderRadius: BorderRadius.circular(10),
              imageUrl:
                  'https://icms-image.slatic.net/images/ims-web/19a118f8-f78e-42c9-940a-c8551da80ac0.jpg',
              height: 90,
              width: Get.width,
              fit: BoxFit.cover,
            ),
            Apputils.sizeH10,
            Container(
              color: AppColors.white,
              height: 160,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        KText(
                          text: 'My Orders',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: KText(
                            text: 'View All >',
                            color: AppColors.pink,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Apputils.sizeH10,
                  Row(
                    children: [
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.payment_outlined,
                        text: 'To Pay',
                        textSize: 11.5,
                        fontWeight: FontWeight.normal,
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.domain_verification_rounded,
                        text: 'To Ship',
                        textSize: 11.5,
                        fontWeight: FontWeight.normal,
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.delivery_dining,
                        text: 'To Received',
                        textSize: 11.5,
                        fontWeight: FontWeight.normal,
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.payment_outlined,
                        text: 'To Pay',
                        textSize: 11.5,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Apputils.sizeH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.repeat,
                        iconSize: 25,
                        text: 'My Returns',
                        textSize: 12,
                        fontWeight: FontWeight.normal,
                        isRowText: true,
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.disabled_by_default_outlined,
                        iconSize: 25,
                        text: 'My Cancellations',
                        textSize: 12,
                        fontWeight: FontWeight.normal,
                        isRowText: true,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Apputils.sizeH10,
            Container(
              height: 60,
              color: AppColors.white,
              child: Padding(
                padding: Apputils.paddingH10,
                child: Row(
                  children: [
                    KText(
                      text: 'Coins',
                    ),
                    Spacer(),
                    Container(
                      height: 30,
                      width: Get.width / 3.5,
                      decoration: BoxDecoration(
                        color: AppColors.pink,
                        borderRadius: BorderRadius.circular(
                          10,
                        ),
                      ),
                      child: Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.centerLeft,
                        children: [
                          Positioned(
                            left: -5,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor: AppColors.pink,
                              child: CircleAvatar(
                                radius: 19,
                                backgroundColor: AppColors.white,
                                child: FlutterLogo(),
                              ),
                            ),
                          ),
                          Positioned(
                            right: 10,
                            child: KText(
                              text: 'Coins --',
                              color: AppColors.white,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {},
                      child: KText(
                        text: '''Earn/Redeem
Coins >''',
                        color: AppColors.pink,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Apputils.sizeH10,
            Container(
              color: AppColors.white,
              height: 160,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        KText(
                          text: 'My Orders',
                          fontWeight: FontWeight.normal,
                          fontSize: 14,
                        ),
                        Spacer(),
                        TextButton(
                          onPressed: () {},
                          child: KText(
                            text: 'View All >',
                            color: AppColors.pink,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Apputils.sizeH10,
                  Row(
                    children: [
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.message,
                        text: 'My Message',
                        textSize: 11.5,
                        width: Get.width / 4,
                        maxline: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.normal,
                        textAlign: TextAlign.center,
                        
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.payment,
                        text: 'Payment Collection',
                        textSize: 11.5,
                        width: Get.width / 4,
                        maxline: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.normal,
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.help_center_outlined,
                        text: 'Help Center',
                        textSize: 11.5,
                        width: Get.width / 4,
                        maxline: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.normal,
                      ),
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.co_present_outlined,
                        text: 'Chat with us',
                        textSize: 11.5,
                        width: Get.width / 4,
                        maxline: 1,
                        textOverflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  Apputils.sizeH10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      iconAndTextButton(
                        onTap: () {},
                        icons: Icons.reviews_outlined,
                        iconSize: 25,
                        text: 'My Reviews',
                        textSize: 12,
                        fontWeight: FontWeight.normal,
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
  }
}

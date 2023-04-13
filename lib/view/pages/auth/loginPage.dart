import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/snackbar.dart';
import 'package:enayas_app/services/helpers/willPopScope.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/pages/home/bottomBarHomePage.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/primaryButton.dart';
import 'package:enayas_app/view/widgets/formfield/cFormField.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => willPopCallback(
        context: context,
        isOffAll: false,
        routeName: BottomBarHomePage(),
      ),
      child: Scaffold(
        body: Container(
          color: AppColors.pink,
          child: Padding(
            padding: Apputils.paddingH20,
            child: Obx(
              () => ListView(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: backButton(
                      onBack: () => Get.to(BottomBarHomePage()),
                      icon: Icons.close,
                      iconColor: AppColors.white,
                    ),
                  ),
                  // SizedBox(height: Get.height / 12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          KText(
                            text: 'Enayas'.toUpperCase(),
                            fontSize: 26,
                            color: AppColors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ],
                      ),
                      Apputils.sizeH30,
                      Apputils.sizeH20,
                      KText(
                        text: '''Shop Over 23 
    Million Products At 
    Unbeatable prices'''
                            .toUpperCase(),
                        fontSize: 14,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: Get.height / 10),
                      // KText(
                      //   text: 'Register or Login with Mobile Number',
                      //   color: AppColors.white,
                      // ),
                      Apputils.sizeH10,
                      cFormField(
                        controller: AllController.authC.phoneOrEmail.value,
                        prefixIcon:
                            AllController.authC.isEmailLogin.value == true
                                ? null
                                : Padding(
                                    padding: EdgeInsets.only(
                                        top: 10, left: 10, right: 10),
                                    child: KText(
                                      text: '+880',
                                    ),
                                  ),
                        keyboardType:
                            AllController.authC.isEmailLogin.value == true
                                ? null
                                : TextInputType.number,
                        hintText: AllController.authC.isEmailLogin.value == true
                            ? 'Enter your email'
                            : 'Enter your mobile number',
                      ),
                      SizedBox(
                        height: 30,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              AllController.authC.phoneOrEmail.value.clear();
                              AllController.authC.isEmailLogin.value =
                                  !AllController.authC.isEmailLogin.value;
                              print(AllController.authC.isEmailLogin.value);
                            },
                            child: KText(
                              text:
                                  AllController.authC.isEmailLogin.value != true
                                      ? 'Login with email'
                                      : 'Login with phone',
                              color: AppColors.white,
                              fontStyle: FontStyle.italic,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      ),
                      cFormField(
                        controller: AllController.authC.password.value,
                        hintText: 'Enter your password',
                        obscureText: true,
                      ),

                      Apputils.sizeH30,
                      primaryButton(
                        onTap: () {
                          if (AllController
                                  .authC.phoneOrEmail.value.text.isEmpty ||
                              AllController.authC.password.value.text.isEmpty) {
                            emptySnackBarWidget();
                          } else if (AllController.authC.isEmailLogin.value ==
                              true) {
                            if (AllController
                                .authC.phoneOrEmail.value.text.isEmail) {
                              AllController.authC.userLogin();
                            } else {
                              snackBar(message: 'Enter a valid email address');
                            }
                          } else {
                            AllController.authC.userLogin();
                          }
                        },
                        height: 40,
                        buttonColor: AppColors.white,
                        buttonName: 'Login',
                        textColor: AppColors.black.withOpacity(.7),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),

                      // Apputils.sizeH30,
                      // Row(
                      //   children: [
                      //     Expanded(
                      //       child: Container(
                      //         height: .8,
                      //         color: AppColors.white,
                      //       ),
                      //     ),
                      //     Apputils.sizeW10,
                      //     KText(
                      //       text: 'Or continue with',
                      //       fontSize: 13,
                      //       color: AppColors.white,
                      //     ),
                      //     Apputils.sizeW10,
                      //     Expanded(
                      //       child: Container(
                      //         height: .8,
                      //         color: AppColors.white,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      // Apputils.sizeH10,
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   crossAxisAlignment: CrossAxisAlignment.center,
                      //   children: [
                      //     CircleAvatar(
                      //       child: KText(
                      //         text: 'f',
                      //         color: AppColors.white,
                      //         fontWeight: FontWeight.bold,
                      //         fontSize: 38,
                      //       ),
                      //     ),
                      //     Apputils.sizeW30,
                      //     CircleAvatar(
                      //       backgroundColor: AppColors.white,
                      //       child: Text(
                      //         'G',
                      //         style: GoogleFonts.poppins(
                      //           color: AppColors.pink,
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: 28,
                      //         ),
                      //       ),
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                  Apputils.sizeH20,
                  primaryButton(
                    onTap: () => Get.toNamed(AppRouteService.register),
                    height: 40,
                    // buttonColor: AppColors.pink,
                    border: Border.all(color: AppColors.white),
                    buttonName: 'Register',
                    textColor: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/routes/appRouterService.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.pink,
        child: ListView(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: backButton(
                icon: Icons.close,
                iconColor: AppColors.white,
              ),
            ),
            SizedBox(height: Get.height / 8),
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
                SizedBox(height: Get.height / 6),
                KText(
                  text: 'Register or Login with Mobile Number',
                  color: AppColors.white,
                ),
                Apputils.sizeH10,
                Padding(
                  padding: Apputils.paddingH20,
                  child: SizedBox(
                    height: 45,
                    child: TextFormField(
                      onFieldSubmitted: (_) {
                        Get.offAndToNamed(AppRouteService.bottomHome);
                      },
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.transparent,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.transparent,
                          ),
                        ),
                        prefixIcon: Padding(
                          padding:
                              EdgeInsets.only(top: 10, left: 10, right: 10),
                          child: KText(
                            text: '+880',
                          ),
                        ),
                        hintText: 'Enter your mobile number',
                        contentPadding: Apputils.paddingH10,
                        fillColor: AppColors.white,
                        filled: true,
                      ),
                    ),
                  ),
                ),
                Apputils.sizeH30,
                TextButton(
                  onPressed: () {},
                  child: KText(
                    text: 'Login with email',
                    color: AppColors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
                Apputils.sizeH30,
                Padding(
                  padding: Apputils.paddingH20,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: .8,
                          color: AppColors.white,
                        ),
                      ),
                      Apputils.sizeW10,
                      KText(
                        text: 'Or continue with',
                        fontSize: 13,
                        color: AppColors.white,
                      ),
                      Apputils.sizeW10,
                      Expanded(
                        child: Container(
                          height: .8,
                          color: AppColors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Apputils.sizeH10,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      child: KText(
                        text: 'f',
                        color: AppColors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 38,
                      ),
                    ),
                    Apputils.sizeW30,
                    CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: Text(
                        'G',
                        style: GoogleFonts.poppins(
                          color: AppColors.pink,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

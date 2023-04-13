import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

loadingDialog({String? loadingText, bool barrierDismissible = false}) {
  var context = Get.context as BuildContext;
  showDialog(
      barrierDismissible: barrierDismissible,
      context: context,
      builder: (_) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(AppColors.pink),
                ),
                SizedBox(
                  width: 15,
                ),
                KText(
                  text: loadingText ?? 'Processing...',
                  fontWeight: FontWeight.w600,
                ),
              ],
            ),
          ),
        );
      });
}

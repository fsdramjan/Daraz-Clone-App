import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';

Widget primaryButton({
  Color? buttonColor,
  required String buttonName,
  Color? textColor,
  double? fontSize,
  FontWeight? fontWeight,
  double? height,
  double? width,
  void Function()? onTap,
  BoxBorder? border,
  Widget? child,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: height,
      width: width,
      decoration: BoxDecoration(

        border: border,
        borderRadius: BorderRadius.circular(5),
        color: buttonColor ?? AppColors.pink,
      ),
      alignment: Alignment.center,
      child: Padding(
        padding: Apputils.paddingAll5,
        child: child?? KText(
          text: buttonName,
          color: textColor ?? AppColors.white,
          fontSize: fontSize ?? 12,
          fontWeight: fontWeight,
        ),
      ),
    ),
  );
}

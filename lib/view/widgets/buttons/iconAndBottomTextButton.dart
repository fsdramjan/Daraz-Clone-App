import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:flutter/material.dart';

import '../../../services/configs/appColors.dart';
import '../text/kText.dart';

Widget iconAndTextButton({
  required void Function() onTap,
  required IconData icons,
  double? iconSize,
  double? textSize,
  int? maxline,
  TextOverflow? textOverflow,
  required String text,
  Widget? child,
  Color? color,
  Color? iconColor,
  FontWeight? fontWeight,
  double? width,
  bool? isRowText,
  TextAlign? textAlign = TextAlign.center,
}) =>
    SizedBox(
      width: width,
      child: MaterialButton(
        onPressed: onTap,
        hoverElevation: 0,
        splashColor: AppColors.transparent,
        focusColor: AppColors.transparent,
        highlightColor: AppColors.transparent,
        child: isRowText == true
            ? Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icons,
                    color: iconColor != null
                        ? iconColor
                        : color ?? AppColors.black.withOpacity(.5),
                    size: iconSize ?? 20,
                  ),
                  Apputils.sizeW10,
                  KText(
                    text: text,
                    color: color ?? AppColors.black.withOpacity(.6),
                    fontWeight: fontWeight ?? FontWeight.w500,
                    fontSize: textSize ?? 12,
                    maxLines: maxline,
                    overflow: textOverflow,
                    textAlign: textAlign,
                  ),
                ],
              )
            : child ??
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      icons,
                      color: iconColor != null
                          ? iconColor
                          : color ?? AppColors.black.withOpacity(.5),
                      size: iconSize ?? 20,
                    ),
                    KText(
                      text: text,
                      color: color ?? AppColors.black.withOpacity(.6),
                      fontWeight: fontWeight ?? FontWeight.w500,
                      fontSize: textSize ?? 12,
                      textAlign: textAlign,
                    ),
                  ],
                ),
      ),
    );

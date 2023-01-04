import 'package:flutter/material.dart';
import '../../../services/configs/appColors.dart';

Widget iconButton({
  void Function()? onTap,
  required IconData? icons,
  Widget? child,
  double? iconSize,
  Color? iconColor,
  FontWeight? fontWeight,
  Color? onPrimaryColor,
  final double? elevation,
  final double? height,
  final double? width,
  final Color? buttonBackgroundColor,
  final double? borderRadius,
  final borderSideColor,
  tooltip = '',
  double? splashRadius,
}) {
  return SizedBox(
    height: height,
    width: width,
    child: IconButton(
      tooltip: tooltip,
      onPressed: onTap ?? () {},
      splashRadius: splashRadius ?? 20,
      style: ElevatedButton.styleFrom(
        side: BorderSide(
          color: borderSideColor ?? AppColors.transparent,
        ),
        foregroundColor: onPrimaryColor,
        backgroundColor: buttonBackgroundColor ?? AppColors.black,
        elevation: elevation,
        padding: EdgeInsets.zero,
        alignment: Alignment.center,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
        ),
      ),
      icon: child ??
          Icon(
            icons,
            size: iconSize,
            color: iconColor ?? AppColors.black,
          ),
    ),
  );
}

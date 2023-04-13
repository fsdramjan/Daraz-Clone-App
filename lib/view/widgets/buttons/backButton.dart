import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget backButton({
  IconData? icon,
  Color? iconColor,
  double? iconSize,
  void Function()? onBack,
}) {
  return iconButton(
    tooltip: 'Back',
    onTap:onBack?? () => Get.back(),
    icons: icon ?? Icons.arrow_back,
    iconColor: iconColor,
    iconSize: iconSize,
  );
}

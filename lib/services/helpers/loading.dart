import 'package:enayas_app/services/configs/appColors.dart';
import 'package:flutter/material.dart';

Widget loadingAnimation() {
  return Center(
    child: CircularProgressIndicator(
      color: AppColors.pink,
    ),
  );
}

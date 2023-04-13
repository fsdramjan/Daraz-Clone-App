import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/view/widgets/cachedNetwork/cachedNetworkWidget.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';

Widget categoryCard({
  required String? image,
  required String? title,
  Widget? bottomChild,
  void Function()? onTap,
}) {
  return 
  
  GestureDetector(
    onTap: onTap,
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: AppColors.grey100)),
      child: Padding(
        padding: EdgeInsets.all(3),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CachedNetworkImageWidget(
              imageUrl: image,
              // width: 200,
              fit: BoxFit.fitHeight,
            ),
            Spacer(),
            KText(
              text: title,
              textAlign: TextAlign.center,
              fontSize: 11,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
      ),
    ),
  );
}

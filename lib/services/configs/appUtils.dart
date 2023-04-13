import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class Apputils {
  static final tkSymbol = '৳';

  static final dio = Dio();
  static final getStorage = GetStorage();

  static final accessToken = 'accessToken';

  static final isLoggedIn = RxBool(false);

  static final paddingAll5 = EdgeInsets.all(5);
  static final paddingAll10 = EdgeInsets.all(10);

  static final paddingH5 = EdgeInsets.symmetric(horizontal: 5);
  static final paddingH10 = EdgeInsets.symmetric(horizontal: 10);
  static final paddingH20 = EdgeInsets.symmetric(horizontal: 20);

  static final sizeH5 = SizedBox(height: 5);
  static final sizeH10 = SizedBox(height: 10);
  static final sizeH20 = SizedBox(height: 20);
  static final sizeH30 = SizedBox(height: 30);

  static final sizeW5 = SizedBox(width: 5);
  static final sizeW10 = SizedBox(width: 10);
  static final sizeW20 = SizedBox(width: 20);
  static final sizeW30 = SizedBox(width: 30);

  static final loadingAnimation =
      'https://assets8.lottiefiles.com/packages/lf20_qi4nzlpv.json';

  static final geidDeligate = SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 10,
    crossAxisSpacing: 10,
    childAspectRatio: MediaQuery.of(Get.context as BuildContext).size.width /
        (MediaQuery.of(Get.context as BuildContext).size.height / 1.52),
  );
}

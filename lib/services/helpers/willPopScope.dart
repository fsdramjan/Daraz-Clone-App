import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> willPopCallback(
    {required BuildContext context,
    required Widget routeName,
    bool? isOffAll}) async {
  final completer = Completer<bool>();
  isOffAll == true ? Get.offAll(routeName) : Get.to(routeName);
  completer.complete(true);
  return completer.future;
}

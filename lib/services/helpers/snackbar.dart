import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../configs/appColors.dart';

snackBar({
  String? title,
  required String? message,
    bool? isRed=false,
  bool? isShowSnackbar,
  ToastGravity? gravity,
}) {
  return isShowSnackbar == null
      ? isRed == false
          ? Fluttertoast.showToast(
              msg: message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: gravity ?? ToastGravity.BOTTOM,
              timeInSecForIosWeb: 2.5.toInt(),
              webBgColor: "linear-gradient(to right, #00b09b, #00b09b)",
              backgroundColor: AppColors.pink,
              webPosition: "right",
              webShowClose: true,
              textColor: AppColors.white,
              
              fontSize: 14,
            )
          : Fluttertoast.showToast(
              webPosition: "right",
              webBgColor: "linear-gradient(to right, #FF0000, #FF0000)",
              timeInSecForIosWeb: 2.5.toInt(),
              msg: message.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.red,
              textColor: AppColors.white,
              fontSize: 14,
            )
      : Container();
}

emptySnackBarWidget() => snackBar(
      message: 'Empty field!!',
      isRed: true,
      gravity: ToastGravity.CENTER,
    );
serverErrorSnackbar({errorText}) => snackBar(
      message:errorText?? '''Something went wrong!!''',
      isRed: true,
      gravity: ToastGravity.CENTER,
    );
